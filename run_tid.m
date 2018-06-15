
% ctime = datestr(now, 30);
% tseed = str2num(ctime((end - 5) : end)) ;
% rand('seed', tseed) 
dir_dist='E:\ImageDataBase\tid2013\distorted_images';
dir_ref='E:\ImageDataBase\tid2013\reference_images';
%scp=zeros(3000,5);
sc=zeros(3000,2);
cnt=1;
G1=fspecial('Gaussian',15,0.2);
G2=fspecial('Gaussian',15,0.4);
G3=fspecial('Gaussian',15,0.6);
G4=fspecial('Gaussian',15,0.8);
G5=fspecial('Gaussian',15,1);
G6=fspecial('Gaussian',15,1.2);
G7=fspecial('Gaussian',15,1.4);
G8=fspecial('Gaussian',15,1.6);
G9=fspecial('Gaussian',15,1.8);
G10=fspecial('Gaussian',15,2);

for i=1:25
    for j=1:24
        for k=1:5
               path_dist=[dir_dist '\I' num2str(i,'%02d') '_' num2str(j,'%02d') '_' num2str(k) '.bmp'];
               path_ref=[dir_ref '\I' num2str(i,'%02d') '.bmp'];
               img_dist=imread(path_dist);
               img_ref=imread(path_ref);
               Ref0=img_ref;
               Dist0=img_dist;
%                img_dist_y=double(rgb2gray(img_dist));
%                img_ref_y=double(rgb2gray(img_ref));
%                Ref0=double(img_ref_y);
%                Dist0=double(img_dist_y);
               
%                Ref1=conv2(Ref0,G1,'same');
%                Ref2=conv2(Ref0,G2,'same');
%                Ref3=conv2(Ref0,G3,'same');
%                Ref4=conv2(Ref0,G4,'same');
%                Ref5=conv2(Ref0,G5,'same');
%                Ref6=conv2(Ref0,G6,'same');
%                Ref7=conv2(Ref0,G7,'same');
%                Ref8=conv2(Ref0,G8,'same');
%                Ref9=conv2(Ref0,G9,'same');
%                Ref10=conv2(Ref0,G10,'same');
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
%                Dist10=conv2(Dist0,G10,'same');
               
               ss=MAD_index(Ref0,Dist0);
               sc(cnt,1)=ss.MAD;
               sc(cnt,2)=VSI(Ref0,Dist0);
%                sc(cnt,3)=ssim(Ref2,Dist2);
%                sc(cnt,4)=ssim(Ref3,Dist3);
%                sc(cnt,5)=ssim(Ref4,Dist4);
%                sc(cnt,6)=ssim(Ref5,Dist5);
%                sc(cnt,7)=ssim(Ref6,Dist6);
%                sc(cnt,8)=ssim(Ref7,Dist7);
%                sc(cnt,9)=ssim(Ref8,Dist8);
%                sc(cnt,10)=ssim(Ref9,Dist9);
%                sc(cnt,11)=ssim(Ref10,Dist10);
               cnt=cnt+1;
               disp(sprintf('CNT:::%d',cnt));
              
              
        end
    end
end
