Res = [3072, 3072];

addpath('C:\Users\user\Desktop\실전문제연구단\RawImage_14') %작업하는 파일에 저장하지 않고도 사용가능하게 만듬
Files=dir('C:\Users\user\Desktop\실전문제연구단\RawImage_14');

%9  'CHEST AP_4.raw'
%12 'Chest pa 004.raw'
%13 'Chest pa 007Q.raw'
%14 'Chest_AP 5.raw'

for k=18
    File = Files(k).name;
    I = ReadRawImage( File, 'uint16', Res(1), Res(2) ); %uint16 %어떤 사이즈의 파일을 읽어라
    I = single(I); %싱글로 변환
end

xmin = 0;  xmax =  65535; %16383; %2의 16승 및 좌표설정
ymin = 0;  ymax =  65535; %16383; 

%%%%% Global Mapping
GM=@(x) ymax - ymax*log( x + 1 )/log( xmax + 1 ) ;    %@x는 x값을 가진함수라는 뜻

X = xmin:xmax;
Y=GM(X);    LUT = [X;Y];
img=GM(I);

FL0 = fspecial('gaussian', 3, .3);  
FL1 = fspecial('gaussian', 5, .6);  
FL2 = fspecial('gaussian', 9, 1.2);  
FL3 = fspecial('gaussian', 17, 2.4);  
FL4 = fspecial('gaussian', 33, 4.8);  
FL5 = fspecial('gaussian', 65, 9.6);  
FL6 = fspecial('gaussian', 129, 19.2);  
FL7 = fspecial('gaussian', 257, 38.4);  
FL8 = fspecial('gaussian', 513, 76.8);    %513
FL9 = fspecial('gaussian', 799, 153.6);   %1025

%h는 디테일 filtering
L0=imfilter(img,FL0,'symmetric');  H0=img-L0; 
L1=imfilter(img,FL1,'symmetric');  H1=img-L1; 
L2=imfilter(img,FL2,'symmetric');  H2=img-L2; 
L3=imfilter(img,FL3,'symmetric');  H3=img-L3; 
L4=imfilter(img,FL4,'symmetric');  H4=img-L4; 
L5=imfilter(img,FL5,'symmetric');  H5=img-L5; 
L6=imfilter(img,FL6,'symmetric');  H6=img-L6; 
L7=imfilter(img,FL7,'symmetric');  H7=img-L7; 
L8=imfilter(img,FL8,'symmetric');  H8=img-L8; 
L9=imfilter(img,FL9,'symmetric');  H9=img-L9; 

New_Recon=5*L1+0.1*H8+H7+H6;

figure,imshow(New_Recon,[]),title('New_Recon'),imcontrast


input_x=[104635 128899 210287 252617 309522];
output_y=[0 0 ymax/2 ymax ymax];
X_1=65147:384930;
p=pchip(input_x,output_y,X_1);

figure,plot(X_1,p)

out_p=pchip(input_x,output_y,New_Recon);
figure,imshow(out_p,[])

histogram(out_p);



dicomwrite(uint16(New_Recon),'test.dcm')
