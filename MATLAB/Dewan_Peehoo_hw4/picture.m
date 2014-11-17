function [ ] = picture(image, k, iter )

%Reading the image and normalizing
Pic = double(imread(image));
Pic = Pic/255;

%Dataset
X = reshape(Pic, size(Pic,1) * size(Pic,2), 3);

[mu, labels] = costFunction(X,iter, k);

X_new = X;

for j = 1:k
    X_new(labels==j,:) = repmat(mu(j,:),size(X_new(labels==j,:),1),1);
end

X_new = reshape(X_new, size(Pic,1), size(Pic,2), 3);

subplot(1, 2, 1);
imagesc(Pic); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_new)
title(sprintf('Compressed, with %d colors.', k));

end

