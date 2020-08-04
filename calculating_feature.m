function feature=calculating_feature(Mat)

harMat=[];
numLevels=size(Mat,1);
totalValue=0;
for m=1:numLevels
    for n=1:numLevels
        totalValue=totalValue+Mat(m,n);
    end
end
%     pij = sum(sum(coMat(:,:,iteration))); %already normalized
pij=sum(sum(Mat));
Mat(:,:)=Mat(:,:)./pij;

tempmux=0;
tempmuy=0;
for j=1:numLevels
    for i=1:numLevels
        tempmux =  tempmux+(i*(Mat(j,i)));
        tempmuy =  tempmuy+(j*(Mat(j,i)));
    end
end
mux=tempmux; %mux
muy=tempmuy;

tempx=0;
tempy=0;
for j=1:numLevels
    for i=1:numLevels
        tempx = tempx+ (i-mux)^2*Mat(j,i);
        tempy = tempy+ (j-muy)^2*Mat(j,i);
    end
end
sigx=tempx; %sigx
sigy=tempy;
if sigx==0
    sigx=0.000001;
end
if sigy==0
    sigy=0.000001;
end



%Calculations
tempEnergy=0;
tempEntropy=0;
tempCorr=0;
tempCont=0;
tempGen=0;
tempVar=0;
tempMean=0;
tempInert=0;
tempShade=0;
tempTen=0;
tempInVar=0;

for j=1:numLevels
    for i=1:numLevels
        value = Mat(j,i);

        tempEnergy = tempEnergy+ value^2;
        if(value~=0) 
            tempEntropy = tempEntropy + (value * log10(value));
        end
        tempCorr = tempCorr+ ((i-mux)*(j-muy)*(value/(sigy*sigx)));
%             n=(abs(i-j))^2;
        tempCont = tempCont+(i-j)^2*totalValue;
        tempGen = tempGen+ value/(1+abs(i-j));
        tempVar = tempVar + ((i - mux)^2)*value+((j-muy)^2)*value;
        tempMean = tempMean + (i+j)*(value);
        tempInert = tempInert+ (i-j)^2*(value);
        tempShade=tempShade+ ((i+j-mux-muy)^3)*(value);
        tempTen = tempTen+ (((i + j - mux - muy)^4) .* (value));
        if i~=j
            tempInVar=tempInVar+ value/(i-j)^2;
        end
    end
end
harMat(1)=tempEnergy;         %Energy
harMat(2) = -tempEntropy;     %Entropy
harMat(3)=tempCorr;           %Correlation
harMat(4)=tempCont/2;           %Contrast%Inertia
harMat(5) = tempGen;          %Homogeneity
harMat(6) = tempVar/2;        %Variance
harMat(7)=tempMean/2;         %Sum Mean
harMat(8)=tempInert;          %Inertia%Contrast
harMat(9)=tempShade;          %Cluster Shade
harMat(10) = tempTen;         %Cluster Tendency
harMat(11) = max(max(Mat)); %Max Probability
harMat(12) = tempInVar;       %Inverse Variance

clear 'tempEnergy' 'tempEntropy' 'tempCorr' 'tempCont' 'tempGen';
clear 'tempVar' 'tempMean' 'tempInert' 'tempShade' 'totalValue'
clear 'tempTen' 'tempInVar';
% harMat = harMat';
feature=harMat;