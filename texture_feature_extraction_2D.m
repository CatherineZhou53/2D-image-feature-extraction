function Texture_feature=texture_feature_extraction_2D(ROI)
%extracting the texture features for 2D ROI image
Mat1=graycomatrix(ROI,'Offset',[0 1],'NumLevels', 8);
feature1=calculating_feature(Mat1);
Mat2=graycomatrix(ROI,'Offset',[-1 1],'NumLevels', 8);
feature2=calculating_feature(Mat2);
Mat3=graycomatrix(ROI,'Offset',[-1 0],'NumLevels', 8);
feature3=calculating_feature(Mat3);
Mat4=graycomatrix(ROI,'Offset',[-1 -1],'NumLevels', 8);
feature4=calculating_feature(Mat4);

Mat5=graycomatrix(ROI,'Offset',[0 1],'NumLevels', 16);
feature5=calculating_feature(Mat5);
Mat6=graycomatrix(ROI,'Offset',[-1 1],'NumLevels', 16);
feature6=calculating_feature(Mat6);
Mat7=graycomatrix(ROI,'Offset',[-1 0],'NumLevels', 16);
feature7=calculating_feature(Mat7);
Mat8=graycomatrix(ROI,'Offset',[-1 -1],'NumLevels', 16);
feature8=calculating_feature(Mat8);

Mat9=graycomatrix(ROI,'Offset',[0 1],'NumLevels', 32);
feature9=calculating_feature(Mat9);
Mat10=graycomatrix(ROI,'Offset',[-1 1],'NumLevels', 32);
feature10=calculating_feature(Mat10);
Mat11=graycomatrix(ROI,'Offset',[-1 0],'NumLevels', 32);
feature11=calculating_feature(Mat11);
Mat12=graycomatrix(ROI,'Offset',[-1 -1],'NumLevels', 32);
feature12=calculating_feature(Mat12);

Mat13=graycomatrix(ROI,'Offset',[0 1],'NumLevels', 64);
feature13=calculating_feature(Mat13);
Mat14=graycomatrix(ROI,'Offset',[-1 1],'NumLevels', 64);
feature14=calculating_feature(Mat14);
Mat15=graycomatrix(ROI,'Offset',[-1 0],'NumLevels', 64);
feature15=calculating_feature(Mat15);
Mat16=graycomatrix(ROI,'Offset',[-1 -1],'NumLevels', 64);
feature16=calculating_feature(Mat16);

Mat17=graycomatrix(ROI,'Offset',[0 1],'NumLevels', 128);
feature17=calculating_feature(Mat17);
Mat18=graycomatrix(ROI,'Offset',[-1 1],'NumLevels', 128);
feature18=calculating_feature(Mat18);
Mat19=graycomatrix(ROI,'Offset',[-1 0],'NumLevels', 128);
feature19=calculating_feature(Mat19);
Mat20=graycomatrix(ROI,'Offset',[-1 -1],'NumLevels', 128);
feature20=calculating_feature(Mat20);



Mat21=graycomatrix(ROI,'Offset',[0 2],'NumLevels', 8);
feature21=calculating_feature(Mat21);
Mat22=graycomatrix(ROI,'Offset',[-2 2],'NumLevels', 8);
feature22=calculating_feature(Mat22);
Mat23=graycomatrix(ROI,'Offset',[-2 0],'NumLevels', 8);
feature23=calculating_feature(Mat23);
Mat24=graycomatrix(ROI,'Offset',[-2 -2],'NumLevels', 8);
feature24=calculating_feature(Mat24);

Mat25=graycomatrix(ROI,'Offset',[0 2],'NumLevels', 16);
feature25=calculating_feature(Mat25);
Mat26=graycomatrix(ROI,'Offset',[-2 2],'NumLevels', 16);
feature26=calculating_feature(Mat26);
Mat27=graycomatrix(ROI,'Offset',[-2 0],'NumLevels', 16);
feature27=calculating_feature(Mat27);
Mat28=graycomatrix(ROI,'Offset',[-2 -2],'NumLevels', 16);
feature28=calculating_feature(Mat28);

Mat29=graycomatrix(ROI,'Offset',[0 2],'NumLevels', 32);
feature29=calculating_feature(Mat29);
Mat30=graycomatrix(ROI,'Offset',[-2 2],'NumLevels', 32);
feature30=calculating_feature(Mat30);
Mat31=graycomatrix(ROI,'Offset',[-2 0],'NumLevels', 32);
feature31=calculating_feature(Mat31);
Mat32=graycomatrix(ROI,'Offset',[-2 -2],'NumLevels', 32);
feature32=calculating_feature(Mat32);

Mat33=graycomatrix(ROI,'Offset',[0 2],'NumLevels', 64);
feature33=calculating_feature(Mat33);
Mat34=graycomatrix(ROI,'Offset',[-2 2],'NumLevels', 64);
feature34=calculating_feature(Mat34);
Mat35=graycomatrix(ROI,'Offset',[-2 0],'NumLevels', 64);
feature35=calculating_feature(Mat35);
Mat36=graycomatrix(ROI,'Offset',[-2 -2],'NumLevels', 64);
feature36=calculating_feature(Mat36);

Mat37=graycomatrix(ROI,'Offset',[0 2],'NumLevels', 128);
feature37=calculating_feature(Mat37);
Mat38=graycomatrix(ROI,'Offset',[-2 2],'NumLevels', 128);
feature38=calculating_feature(Mat38);
Mat39=graycomatrix(ROI,'Offset',[-2 0],'NumLevels', 128);
feature39=calculating_feature(Mat39);
Mat40=graycomatrix(ROI,'Offset',[-2 -2],'NumLevels', 128);
feature40=calculating_feature(Mat40);

Texture_feature=[feature1 feature2 feature3 feature4 feature5 feature6 feature7 feature8 feature9 feature10 feature11 feature12 feature13...
    feature14 feature15 feature16 feature17 feature18 feature19 feature20 feature21 feature22 feature23 feature24 feature25 feature26...
    feature27 feature28 feature29 feature30 feature31 feature32 feature33 feature34 feature35 feature36 feature37 feature38 feature39 feature40];



