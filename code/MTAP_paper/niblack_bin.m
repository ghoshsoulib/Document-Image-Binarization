function output = niblack_bin(image, varargin)
% Initialization
numvarargs = length(varargin);      % only want 4 optional inputs at most
if numvarargs > 4
    error('myfuns:somefun2Alt:TooManyInputs', ...
     'Possible parameters are: (image, [m n], k, offset, padding)');
end
 
optargs = {[3 3] -0.2 0 'replicate'};   % set defaults
 
optargs(1:numvarargs) = varargin;   % use memorable variable names
[window, k, offset, padding] = optargs{:};
if ndims(image) ~= 2
    error('The input image must be a two-dimensional array.');
end
% Convert to double
image = double(image);
% Mean value
mean = averagefilter(image, window, padding);
% Standard deviation
meanSquare = averagefilter(image.^2, window, padding);
deviation = (meanSquare - mean.^2).^0.5;
% Initialize the output
output = zeros(size(image));
% Niblack
output(image > mean + k * deviation - offset) = 1;
end
