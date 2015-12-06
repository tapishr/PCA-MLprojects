function [normI] = normalization(II)
m=mean(II);
sd=std(II);
normI=bsxfun(@minus,II,m);
normI=bsxfun(@rdivide,normI,sd);
end