

img_names={'1600';'aerial_city';'boston';'bridge';'butter_flower';'cactus';'child_swimming';...
    'couple';'elk';'family';'fisher';'foxy';'geckos';'lady_liberty';'lake';...
    'log_seaside';'monument';'native_american';'redwood';'roping';'rushmore';'shroom';...
    'snow_leaves';'sunsetcolor';'sunset_sparrow';'swarm';'trolley';'turtle';'veggies';'woman'
};
dist_names={'AWGN';'JPEG';'jpeg2000';'fnoise';'BLUR';'contrast'};
dist_degrees=[5;5;5;5;5;4];
metric_names={@psnr;@psnrhvsm;@ssim;@vifvec;@GMSD;@FeatureSIM;@VSI;@MAD_index};
metric_pres=[0;0;0;0;0;1;1;1];%0==>Gray Image;1==>Color Image
dir_dist='G:\ImageDataBase\CSIQ\dst_imgs';
dir_ref='G:\ImageDataBase\CSIQ\src_imgs';
ImgNum=sum(dist_degrees)*size(img_names,1);
MetricNum=size(metric_names,1);
MetricScore=zeros(ImgNum,MetricNum);

cnt=1;


for i=1:size(img_names,1)
    for j=1:size(dist_degrees,1)
        for k=1:dist_degrees(j)
               path_dist=[dir_dist '\' dist_names{j} '\' img_names{i} '.' dist_names{j} '.' num2str(k,'%d') '.png'];
               path_ref =[dir_ref '\' img_names{i}  '.png'];
               for ii=1:MetricNum
                if metric_pres(ii)==0
                    Ref =double(rgb2gray(imread(path_ref )));
                    Dist=double(rgb2gray(imread(path_dist)));
                else
                    Ref =imread(path_ref );
                    Dist=imread(path_dist);
                end
                MetricScore(cnt,ii)=metric_names{ii}(Ref,Dist);
               end
               
               cnt=cnt+1;
               disp(sprintf('CNT:::%d',cnt));
              
              
        end
    end
end
