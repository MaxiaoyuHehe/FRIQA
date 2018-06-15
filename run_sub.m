
% ctime = datestr(now, 30);
% tseed = str2num(ctime((end - 5) : end)) ;
% rand('seed', tseed) 
dir_dist='E:\ImageDataBase\MF2017\Distorted';
dir_ref='E:\ImageDataBase\MF2017\Reference';
sc=zeros(960,2);
cnt=1;
G1=fspecial('Gaussian',5,0.5);
G2=fspecial('Gaussian',5,1);
G3=fspecial('Gaussian',5,1.5);
G4=fspecial('Gaussian',5,2);
G5=fspecial('Gaussian',5,2.5);
G6=fspecial('Gaussian',5,3);
G7=fspecial('Gaussian',5,3.5);
G8=fspecial('Gaussian',5,4);
G9=fspecial('Gaussian',5,4.5);

for j=1:4
    for i=1:60
        for k=1:4
               path_dist=[dir_dist '\IMG_' num2str(i,'%03d') '_' num2str(j,'%01d') '_' num2str(k) '.bmp'];
               path_ref=[dir_ref '\IMG_' num2str(i,'%03d') '.bmp'];
               img_dist=imread(path_dist);
               img_ref=imread(path_ref);
               img_dist_y=double(rgb2gray(img_dist));
               img_ref_y=double(rgb2gray(img_ref));
               Ref0=double(img_ref);
               Dist0=double(img_dist);
               
%                Ref1=zeros(size(Ref0));
%                Ref2=zeros(size(Ref0));
%                Ref3=zeros(size(Ref0));
%                Ref4=zeros(size(Ref0));
%                Ref5=zeros(size(Ref0));
%                Ref6=zeros(size(Ref0));
%                Ref7=zeros(size(Ref0));
%                Ref8=zeros(size(Ref0));
%                Ref9=zeros(size(Ref0));
%                
%                Dist1=zeros(size(Ref0));               
%                Dist2=zeros(size(Ref0));
%                Dist3=zeros(size(Ref0));
%                Dist4=zeros(size(Ref0));
%                Dist5=zeros(size(Ref0));
%                Dist6=zeros(size(Ref0));
%                Dist7=zeros(size(Ref0));
%                Dist8=zeros(size(Ref0));
%                Dist9=zeros(size(Ref0));
%                
%                for ii=1:3
%                  Ref1(:,:,ii)=conv2(Ref0(:,:,ii),G1,'same');
%                  Ref2(:,:,ii)=conv2(Ref0(:,:,ii),G2,'same');
%                  Ref3(:,:,ii)=conv2(Ref0(:,:,ii),G3,'same');
%                  Ref4(:,:,ii)=conv2(Ref0(:,:,ii),G4,'same');
%                  Ref5(:,:,ii)=conv2(Ref0(:,:,ii),G5,'same');
%                  Ref6(:,:,ii)=conv2(Ref0(:,:,ii),G6,'same');
%                  Ref7(:,:,ii)=conv2(Ref0(:,:,ii),G7,'same');
%                  Ref8(:,:,ii)=conv2(Ref0(:,:,ii),G8,'same');
%                  Ref9(:,:,ii)=conv2(Ref0(:,:,ii),G9,'same');
%                  
%                  Dist1(:,:,ii)=conv2(Dist0(:,:,ii),G1,'same');
%                  Dist2(:,:,ii)=conv2(Dist0(:,:,ii),G2,'same');
%                  Dist3(:,:,ii)=conv2(Dist0(:,:,ii),G3,'same');
%                  Dist4(:,:,ii)=conv2(Dist0(:,:,ii),G4,'same');
%                  Dist5(:,:,ii)=conv2(Dist0(:,:,ii),G5,'same');
%                  Dist6(:,:,ii)=conv2(Dist0(:,:,ii),G6,'same');
%                  Dist7(:,:,ii)=conv2(Dist0(:,:,ii),G7,'same');
%                  Dist8(:,:,ii)=conv2(Dist0(:,:,ii),G8,'same');
%                  Dist9(:,:,ii)=conv2(Dist0(:,:,ii),G9,'same');
%                  
%                end
               
%                Ref1=conv2(Ref0,G1,'same');
%                Ref2=conv2(Ref0,G2,'same');
%                Ref3=conv2(Ref0,G3,'same');
%                Ref4=conv2(Ref0,G4,'same');
%                Ref5=conv2(Ref0,G5,'same');
%                Ref6=conv2(Ref0,G6,'same');
%                Ref7=conv2(Ref0,G7,'same');
%                Ref8=conv2(Ref0,G8,'same');
%                Ref9=conv2(Ref0,G9,'same');
%                
%               
%                Dist1=conv2(Dist0,G1,'same');
%                Dist2=conv2(Dist0,G2,'same');
%                Dist3=conv2(Dist0,G3,'same');
%                Dist4=conv2(Dist0,G4,'same');
%                Dist5=conv2(Dist0,G5,'same');
%                Dist6=conv2(Dist0,G6,'same');
%                Dist7=conv2(Dist0,G7,'same');
%                Dist8=conv2(Dist0,G8,'same');
%                Dist9=conv2(Dist0,G9,'same');
               
               ss=MAD_index(Ref0,Dist0);
               sc(cnt,1)=ss.MAD;
               sc(cnt,2)=VSI(Ref0,Dist0);
%                sc(cnt,2)=psnr(Ref1,Dist1);
%                sc(cnt,3)=psnr(Ref2,Dist2);
%                sc(cnt,4)=psnr(Ref3,Dist3);
%                sc(cnt,5)=psnr(Ref4,Dist4);
%                sc(cnt,6)=psnr(Ref5,Dist5);
%                sc(cnt,7)=psnr(Ref6,Dist6);
%                sc(cnt,8)=psnr(Ref7,Dist7);
%                sc(cnt,9)=psnr(Ref8,Dist8);
%                sc(cnt,10)=psnr(Ref9,Dist9);
               
               
%               sc(cnt,1)=psnr(img_ref_y,img_dist_y);
%                sc(cnt,2)=ssim(img_ref_y,img_dist_y);
%                sc(cnt,3)=vifvec(img_ref_y,img_dist_y);
%                sc(cnt,4)=GMSD(img_ref_y,img_dist_y);
%                sc(cnt,5)=FeatureSIM(img_ref,img_dist);
               
              
               cnt=cnt+1;
              
             disp(cnt);
              
        end
    end
end
