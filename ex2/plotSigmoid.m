function plotSigmoid()
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

xlabel('X');
ylabel('sigmoid(x)');

plot( linspace(-50,50) , sigmoid(linspace(-50,50)),
  'color' , 'Blue');
  
plot ([-1, 1], [0.5,0.5],'color' , 'Black') 

 
axis([-10 10 -3 3]);






% =========================================================================



hold off;

end
