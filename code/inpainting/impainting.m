function [ BG ] = impainting( imggray_orig,mask )
imggray=imggray_orig;
[r,c]=size(imggray);
BG= imggray;
Four_Images = [];
Ix=r;
Iy=c;
x_start=[2,2,Ix-1,Ix-1];
x_end=[Ix-1,Ix-1,2,2];
y_start=[2,Iy-1,2,Iy-1];
y_end=[Iy-1,2,Iy-1,2];
x_traverse=[1,1,-1,-1];
y_traverse=[1,-1,1,-1];

for i=(1:4)
    imggray=imggray_orig;
    P_i = imggray;
    M = mask;
    for y = (y_start(i):y_traverse(i):y_end(i))
       for x = (x_start(i):x_traverse(i):x_end(i))
           if M(x,y)==0
               avg_list = [imggray(x-1,y)*uint8(M(x-1,y)),imggray(x,y-1)*uint8(M(x,y-1)),imggray(x+1,y)*uint8(M(x+1,y)),imggray(x,y+1)*uint8(M(x,y+1))];
               P =mean((double(nonzeros(avg_list))));
               P_i(x,y) = P;
               imggray(x,y) = P;
               M(x,y) = 1;
           end
       end
    end
    Four_Images = [Four_Images P_i];
end
L=[];
for y = (y_start(1)-1:y_end(1)+1)
    for x=(x_start(1)-1:x_end(1)+1)
        L=[Four_Images(x,y) Four_Images(x,Iy + y) Four_Images(x, 2*Iy + y) Four_Images(x,3*Iy + y)];
        BG(x,y) = min(L);
    end
end


end

