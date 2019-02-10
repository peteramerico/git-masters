clear

%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao02/Anavel02a/OperaA/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao03/Anavel03b/OperaA/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao04/Anavel04b/OperaA/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao05/Anavel05b/OperaA/'
PATH='~/processamento/peter/git-masters/Anavel'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao02/Anavel02/Opera/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao03/Anavel03a/Opera/'
%PATH1='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao02a/'



%PATH='~/Marmousi/Migracao01/Anavel01a/'
%xina=250;dxana=250;xfna=8750;
xina=25;dxana=500;xfna=25025;

suave=1

%dz=3;dx=25;
dz=10;dx=50;
%xini=0.0;xfinal=9025;
xini=0.0;xfinal=25850;
%zini=0.0;zfinal=3000.0;
zini=0.0;zfinal=3000.0;

vini=1500.0;vfinal=4500.0;

zinterp=(zini:dz:zfinal+dz);nzint=length(zinterp);

j=0;
for p=xina:dxana:xfna
    clear dado
    j=j+1;
    ji=(j-1)*(nzint-1);
    
    fid = fopen(strcat(strcat(strcat(PATH,'pick'),int2str(p)),'.rsf'), 'r');
    dado = fscanf(fid, '%g %g %g', [3 inf]);
    fclose(fid);
    
    ndado=length(dado);
    %pick=[zini vini-vr;dado(1,:)' dado(2,:)'-ones(ndado,1)*vr]';
    pick=[zini vini;dado(1,:)' dado(2,:)']';
    npick=length(pick);
    
    %w=interp1(dado(1,:),dado(2,:),zinterp,'linear','extrap');
    %velpick(1:nzint,1:2)=[zinterp' w'];
    
    m=0;
    for prof=zini:dz:zfinal
        m=m+1;
        for k=2:npick
            if (prof>=pick(1,k-1) && prof<pick(1,k)) 
        
                yint(m)=(pick(1,k)-pick(1,k-1))/(pick(1,k)/pick(2,k)-pick(1,k-1)/pick(2,k-1));
                
            end
        end
        
        if (prof>pick(1,npick) && prof<=zfinal)

            %yint(m)=vfinal-vr;
            yint(m)=vfinal;
            
        end

        yprof(m)=prof;
        
    end
    vv(1:3,ji+1:ji+nzint-1)=[yprof' ones(nzint-1,1)*p yint']';
end
nn=j;

if (suave==1) 

    char='_smooth'
    mmp=medfilt2(reshape(vv(3,:),nzint-1,nn),'symmetric');
    xxp=reshape(vv(2,:),nzint-1,nn);
    newp=(xini:dx:xfinal-dx);nnp=length(newp);

    for k=1:nzint-1
        vfinalp(k,1:nnp)=interp1(xxp(k,:),mmp(k,:),newp','nearest','extrap');
    end

    PSF = fspecial('gaussian',21,7);
    veloINT=reshape(imfilter(vfinalp,PSF,'conv','symmetric'),(nzint-1)*nnp,1);

else
    char=''
    mmp=reshape(vv(3,:),nzint-1,nn);
    xxp=reshape(vv(2,:),nzint-1,nn);%yyp=reshape(vv(1,:),nzint-1,nn);
    newp=(xini:dx:xfinal-dx);nnp=length(newp);

    for k=1:nzint-1
        %xxpnew(k,1:nnp)=newp';
        %yypnew(k,1:nnp)=ones(nnp,1)*yprof(k);
        vfinalp(k,1:nnp)=interp1(xxp(k,:),mmp(k,:),newp','nearest','extrap');
    end

    veloINT=reshape(vfinalp,(nzint-1)*nnp,1);
end

fid = fopen(strcat(strcat(strcat(PATH,'vana01_nearest'),char),'.bin'),'wb');
fwrite(fid,veloINT,'float');
fclose(fid);
