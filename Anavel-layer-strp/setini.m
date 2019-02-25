function setini(fname,n1,x,z);

if nargin < 2;
  error('Must specify filename and n1');
end;


velmod = loadbin(fname,n1);
[n1,n2]=size(velmod);
if nargin < 4;
  z=1:n1;
  if nargin < 3;
    x=1:n2;
  end;
end;

k = 'n';

while k == 'n';
  hold off
  imagesc(x,z,velmod);
  display('Select (click) points along desired curve');
  
  [i1,i2]=ginput;

  ii = find( i1 >= min(x) & i1 <= max(x) & i2 >= min(z) & i2 <= max(z));
  yy = sortrows([i1(ii),i2(ii)]);
  yyn(1,:) = yy(1,:);
  for jj=2:length(ii);
      if yy(jj,1) ~= yyn(end,1);
          yyn(end+1,:) = yy(jj,:);
      end
  end
  hold on 
  plot(yyn(:,1),yyn(:,2),'k');
  k = input('Accept depth curve ([Y]/n):','s');
end

[xx,zz]=meshgrid(x,z);
vv = interp2(xx,zz,velmod,yyn(:,1),yyn(:,2));

aux= [yyn,vv];
save -ascii ini.txt aux
