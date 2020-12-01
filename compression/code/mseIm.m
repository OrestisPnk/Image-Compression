function [m] = mseIm(A,B)
    m=sum(sum((A-B)*(A-B)))/(size(A,1)*size(A,2));
end

