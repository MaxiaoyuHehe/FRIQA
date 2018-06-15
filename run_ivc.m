clear

load IVC_names;
load IVC_dmos;
sc=zeros(185,36);


for i=1:185
    i
   
    Img_test=[IVC_names{i}];
    S = regexp(IVC_names{i}, '_', 'split');
    Img_src=[S{1} '_' S{2} '_' S{3} '.bmp'];
    
    ImSc=imread(Img_src); 
    ImTs=imread(Img_test); 
    ImSc=double(rgb2gray(ImSc));  
    ImTs=double(rgb2gray(ImTs));
    [Sca Scb Scc Scd]=dwt2(ImSc,'db1');
    [Tsa Tsb Tsc Tsd]=dwt2(ImTs,'db1');
    sc(i,1:9)=lsi02(Sca,Tsa,17);
    sc(i,10:18)=lsi02(Scb,Tsb,17);
    sc(i,19:27)=lsi02(Scc,Tsc,17);
    sc(i,28:36)=lsi02(Scd,Tsd,17);

 
end 
   