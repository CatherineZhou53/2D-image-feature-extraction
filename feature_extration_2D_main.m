%extracting features from 2D images
clc;
clear;
% addpath fns/
warning off
t='E:\UÅÌ\ºÚÉ«ËØÁö\image_and_data\image-after-treatment_test';
listing=dir(t);
listing=struct2cell(listing);
[m,n]=size(listing);

t1='E:\UÅÌ\ºÚÉ«ËØÁö\image_and_data\mask-after-treatment_test';
label_listing=dir(t1);
label_listing=struct2cell(label_listing);
[m1,n1]=size(label_listing);
p1=1;
for i=3:n1
    i
    foldername=[listing{2,i},'\',listing{1,i}];
    file_listing=dir(foldername);
    file_listing=struct2cell(file_listing);
    img_folder=[file_listing{2,1},'\',file_listing{1,1}];
    nii_img=load(img_folder);
    nii_img=nii_img.img1;
    foldername1=[label_listing{2,i},'\',label_listing{1,i}];
    file_listing1=dir(foldername1);
    file_listing1=struct2cell(file_listing1);
    labelname=[file_listing1{2,1},'\',file_listing1{1,1}];;
    label_img=load( labelname);
    label_img=label_img.img2;
    contour_img=label_img;
    for i1=1:size(contour_img,3)
        tmp=sum(sum(contour_img(:,:,i1)));
        if tmp~=0
            ori_img=nii_img(:,:,:,i1);
            break;
        end
    end
    ROI=zeros(size(label_img,1),size(label_img,2));
    VEC=[];
    j=1;
    for p=1:size(label_img,1)
        for q=1:size(label_img,2)
            if label_img(p,q)==0
                ROI(p,q)=NaN;
            end
            if label_img(p,q)==255 || label_img(p,q)==1
                ROI(p,q)=ori_img(p,q);
                VEC(j)=ori_img(p,q);
                j=j+1;
            end
        end
    end
    %calculating intensity features
    VEC=double(VEC);
    VEC_max=max(VEC);
    VEC_min=min(VEC);
    VEC_mean=mean(VEC);
    VEC_median=median(VEC);
    VEC_std=std(VEC);
    VEC_var=var(VEC);
    VEC_sum=sum(VEC);
    VEC_skewness=skewness(VEC);
    VEC_kurtosis=kurtosis(VEC);
    VEC_fea=[VEC_max VEC_min VEC_mean VEC_median VEC_std VEC_var VEC_sum VEC_skewness VEC_kurtosis];
    
    %calculating geo features
    BW=label_img>0;
    stats=regionprops(BW,'MajorAxisLength','MinorAxisLength','Eccentricity','Orientation','BoundingBox','Perimeter');
    stats=stats(1,:);
    volume=length(VEC);
    major_AL=stats.MajorAxisLength;
    minor_AL=stats.MinorAxisLength;
    Ecc=stats.Eccentricity;                             
    Ori=stats.Orientation;
    w_Bound=stats.BoundingBox(1);
    h_Bound=stats.BoundingBox(2);
    V_Bound=w_Bound*h_Bound;
    Elongation=w_Bound/h_Bound;
    peri=stats.Perimeter;
    Geo_fea=[volume major_AL minor_AL Ecc Elongation Ori V_Bound peri];
    
%     calculating texture features
    Texture_feature=texture_feature_extraction_2D(ROI);
%     final features
    pname=listing{1,i};
    fin_mrn{p1}=pname;
    fin_fea(p1,:)=[VEC_fea Geo_fea Texture_feature];
    p1=p1+1;
end


