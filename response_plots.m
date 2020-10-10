% In KCF tracker, wwe calcuate the gaussian correlation using 
% kzf = gaussian_correlation(zf, model_xf, kernel.sigma);
% We can visualize each segment individually as shown below.
% It is recommended that the figure is visualized in full screen and
% should be used with KCF code available at https://www.robots.ox.ac.uk/~joao/circulant/tracker_release2.zip
%

figure();
subplot(4,4,2); imshow(patch);
title('Target Patch')

hog_features = get_features(patch, features, cell_size, cos_window);
subplot(4,4,3); imshow(hog_features(:,:,2));
title('HOG Features (for one orientation)')

subplot(4,4,5); mesh(abs(zf(:,:,1)))
title('FFT of the current patch')
subplot(4,4,6); mesh(abs(fftshift(zf(:,:,1))))
title('FFT of the current patch, shifed to centre')

subplot(4,4,7); mesh(abs(model_xf(:,:,1)))
title('FFT of the previous patch')
subplot(4,4,8); mesh(abs(fftshift(model_xf(:,:,1))))
title('FFT of the current patch, shifted to the centre')

kzf = gaussian_correlation(zf, model_xf, kernel.sigma);
subplot(4,4,10); mesh(abs(kzf(:,:,1)));
title('Gaussian response of the FFT of the two patches')
subplot(4,4,11); mesh(abs(fftshift(kzf(:,:))));
title('Centred Gaussian response of the FFT of the two patches')

% Fast Training is done using 
% response = real(ifft2(model_alphaf .* kzf));
% Hence, the highest response will be the location of the target in the new
% frame

response = real(ifft2(model_alphaf .* kzf));
subplot(4,4,14); mesh(response);
title('Response of the classifier, for detection')
subplot(4,4,15); mesh(fftshift(response));
title('Centred response of the classifier');