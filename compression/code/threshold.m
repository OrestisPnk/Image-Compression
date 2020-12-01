function [C,magns,magnitudes,pososto] = threshold(I,T)
C=zeros(size(I));
d=32;
k=1;
s=zeros(256,1);

%Euresh twn suntelestwn sunhmitonou gia ka9e block kai apo8hkeush tous se
%ena 3D array
co=zeros(d,d,256);
magns=zeros(d,d,256);
for i=1 : d : size(I,1)
    for j = 1 : d :size(I,2)
        window=I(i:i+d-1,j:j+d-1);
        coefficients=dct2(window);
        magnitudes=abs(coefficients);
        magns(:,:,k)=(magnitudes>T);
        co(:,:,k)=coefficients;
        k=k+1;
    end
end


%Dhmiourgia ths telikhs eikonas, block by block pairnontas ton antistrofo
%dct gia ka8e ena.
k=1;
for i=1:d:size(I,1)
    for j=1:d:size(I,2)
            C(i:i+d-1,j:j+d-1)=idct2(co(:,:,k).*magns(:,:,k));
            k=k+1;
    end
end
pososto=100*size(find(magns))/(512*512);
end

