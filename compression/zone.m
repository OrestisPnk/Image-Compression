function [C,rs,ts,pososto] = zone(I,r)
C=zeros(size(I));
d=32;
k=1;
s=zeros(256,1);

%Euresh twn suntelestwn sunhmitonou gia ka9e block kai apo8hkeush tous se
%ena 3D array
co=zeros(d,d,256);
for i=1 : d : size(I,1)
    for j = 1 : d :size(I,2)
        window=I(i:i+d-1,j:j+d-1);
        coefficients=dct2(window);
        co(:,:,k)=coefficients;
        k=k+1;
    end
end
%Ypologismos twn diasporwn gia ka9e suntelesth kai dhmiourgia zwnwn me bash
%kapoio katwfli diasporas 
k=1;
for i=1:d
   for j=1:d
      s(k)=var(co(i,j,:));
      k=k+1;
   end
end
rs=reshape(s,[d d]);
rs=rs';
ts=(rs>r);
pososto=100*(size(find(ts)))/(size(coefficients,1)*size(coefficients,2));

%Dhmiourgia ths telikhs eikonas, block by block pairnontas ton antistrofo
%dct gia ka8e ena.
k=1;
for i=1:d:size(I,1)
    for j=1:d:size(I,2)
            C(i:i+d-1,j:j+d-1)=idct2(co(:,:,k).*ts);
            k=k+1;
    end
end
end

