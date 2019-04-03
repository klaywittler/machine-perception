%% Approximate LoG with DoG, 1D

% Generate a Laplacian of Gaussian
sigma = 5;
fSize = 51;
x = -(fSize-1)/2:(fSize-1)/2;
LoG = 1/(sqrt(2*pi)*sigma) * (x.^2/sigma^4 - 1/sigma^2) .* exp(-x.^2/(2*sigma^2));

figure()
plot(LoG);
axis tight; 
title(['Example LoG filter, \sigma=' num2str(sigma)]);

% Approximate it with a Difference of Gaussians
% G(sigma) and G(k*sigma)
k_range = 1.1:0.1:2;
LoG_approx = zeros(length(k_range),fSize);
diff = zeros(length(k_range),1);
for i=1:length(k_range)
    k = k_range(i);
    % Your code starts here %%%%%%%%%%%%%%%%%%%%%%%
    % Generate the two Gaussians, take the difference and multiply
    % by the right factor
    DoG =                            % use dog1d.m
    LoG_approx(i,:) =                % DoG multiplied by the
                                     % scaling factor
    
    % Compute sum of squared differences between filter and approximation
    diff(i) = sqrt(sum((LoG-LoG_approx(i,:)).^2));
end


figure()
subplot(1,2,1)
plot(LoG,'r');
hold on;
for i=1:length(k_range)
    plot(LoG_approx(i,:),'b')
end
legend('LoG','Approximations by DoG');
axis tight;
subplot(1,2,2)
plot(k_range,diff);
xlabel('k'); ylabel('||DoG-LoG||_2');
title('Difference between LoG and DoG as k increases');


