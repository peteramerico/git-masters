clear

%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao02/Anavel02a/OperaA/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao03/Anavel03b/OperaA/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao04/Anavel04b/OperaA/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao05/Anavel05b/OperaA/'
PATH='/processamento/peter/Anavel/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao02/Anavel02/Opera/'
%PATH='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao03/Anavel03a/Opera/'
%PATH1='~/Mestrado/CIGCONT_ffd/ContPSDM/Migracao02a/'



%PATH='~/Marmousi/Migracao01/Anavel01a/'
%xina=250;dxana=250;xfna=8750;
xina=25;dxana=500;xfna=25025;

suave=1;

%%Here comes the necessary information to build the model:
%dz= sample interval in z - dx=sample interval in x
%xini=beginning of x axis - xfinal=end of x axis
%zini=beginning of z axis - zfinal=end of z axis%%
%dz=3;dx=25;
dz=10;dx=50;
%xini=0.0;xfinal=9025;
xini=0.0;xfinal=25850;
%zini=0.0;zfinal=3000.0;
zini=0.0;zfinal=3000.0;

%%vini=initial velocity - vfinal=final velocity%%
vini=1500.0;vfinal=4500.0;

%%Now discretizing the z axis (building the model -z axis)
%zinterp will create a vector starting with zini (0) and going til
%zfinal+dz (3010), with sample interval of 10. Then nzint will simply count
%and tell us the length of zinterp.%%
zinterp=(zini:dz:zfinal+dz);nzint=length(zinterp);

j=0;
%%Here p is a vector created for us to navigate through the files we will 
%be using (pick, which come from cig->cigcont->stk). It starts at 25(xina)
%and goes until 25025(xfna), at every 500(dxana).%%
for p=xina:dxana:xfna
    clear dado
    j=j+1;
    ji=(j-1)*(nzint-1);
    
    %%int2str(p) is a function which transforms the vector p in a string
    %%(string is just text) with all the numbers from the vector p.
    %%The function strcat concatenates strings horizontally. fopen opens a
    %%file (here it will open the pick... files - eg: pick25.rsf - which is
    %%the first file fopen will open, because it is in a for loop. So, it
    %%will open all pick files, one file per for iteration, from 25 to
    %%25025.). Here we see lots of strcat because they are the ones that
    %%put together the name (with directory) of each file, like:
    %%/processamento/peter/Anavel/pick25.rsf and so on. The 'r' means it
    %%will open files just for reading. then we have the function fscanf,
    %%which reads the data opened by fopen and stores it into dado so its
    %%data can be used in the next steps.
    fid = fopen(strcat(strcat(strcat(PATH,'pick'),int2str(p)),'.rsf'), 'r');
    dado = fscanf(fid, '%g %g %g', [3 inf]);
    %%dado has 3 rows and the third has only zeros in it. This happens
    %%because all pick files have the third column filed with zeros.
    fclose(fid);
    
    %%The function length gets the lenght of the highest array dimension.
    %%In the case of an array with 3x10 dimension, it returns the value of
    %%10
    ndado=length(dado);
    %pick=[zini vini-vr;dado(1,:)' dado(2,:)'-ones(ndado,1)*vr]'; %nao
    %usando aqui.
    
    %%The pick function basically organizes the dado function in the
    %%correct way for us to use here. pick puts zini(0.0) as the first
    %%element of the first row, puts vini(1500) as the first element of the
    %%second row and after placing zini and vini it repeats the first and
    %%second row of dado in the same order as it appeared in dado. pick
    %%ignores the 3rd row of dado, which had zeros only. So, pick has
    %%depths in the first row and velocities in the second row. Then in the
    %%first column we have 0 depth in the first row and its corresponding
    %%velocitie (1500) in the second row. This correspondence between
    %%rows continues for each column. 
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
