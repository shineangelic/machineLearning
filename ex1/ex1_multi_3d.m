%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc





%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%
fprintf('Loading data ...\n');
%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);



% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed with normal equation: \n');
fprintf(' %f \n', theta);
fprintf('\n');

figure('Position',[250,250,1024,768]); % open a new figure window

%%%%%%%%%%SUBPLOT 1 %%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1);
plot3 (X(:,2), X(:,3), y, 'rx') ;
hold on; % keep previous plot visible
%plot3( xfak , xfak , X*theta, '-')
 
[tx , ty] = meshgrid ( linspace(min(X(:,2)),max(X(:,2)) ,25), linspace(min(X(:,3)),max(X(:,3)) ,25  ) );
%molt di matrici su mesh
 tz = theta(1) + theta(2) * tx + theta(3) * ty;
%figure('Position',[250,250,1024,768]);

mesh (tx, ty,  tz);
%plot3 (r.*sin(t), r.*cos(t), z);

xlabel('house size');
ylabel('# of rooms');
zlabel('prevision $');
title('Linear regression with 2 parameters, having the heigth (z axis) equal to prediction');
view(-20,20);
%axis([min(X(:,2)) max(X(:,2)) min(X(:,3)) max(X(:,3))   ]);
hold off; % don't overlay any more plots on this figure

%%%%%%%%%%SUBPLOT 2 %%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);
plot3 (X(:,2), X(:,3), y, 'rx') ;
hold on; % keep previous plot visible
%plot3( xfak , xfak , X*theta, '-')
 
[tx , ty] = meshgrid ( linspace(min(X(:,2)),max(X(:,2)) ,25), linspace(min(X(:,3)),max(X(:,3)) ,25  ) );
%molt di matrici su mesh
 tz = theta(1) + theta(2) * tx + theta(3) * ty;
%figure('Position',[250,250,1024,768]);

mesh (tx, ty,  tz);
%plot3 (r.*sin(t), r.*cos(t), z);

xlabel('house size');
ylabel('# of rooms');
zlabel('prevision $');
legend('Training data', 'Linear regression');
view(90,0);
title('Rot=90 , Elev = 0 (some training data hidden by mesh)');
%axis([min(X(:,2)) max(X(:,2)) min(X(:,3)) max(X(:,3))   ]);
hold off; % don't overlay any more plots on this figure

%%%%%%%%%%SUBPLOT 3 %%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);
plot3 (X(:,2), X(:,3), y, 'rx') ;
hold on; % keep previous plot visible
%plot3( xfak , xfak , X*theta, '-')
 
[tx , ty] = meshgrid ( linspace(min(X(:,2)),max(X(:,2)) ,25), linspace(min(X(:,3)),max(X(:,3)) ,25  ) );
%molt di matrici su mesh
 tz = theta(1) + theta(2) * tx + theta(3) * ty;
%figure('Position',[250,250,1024,768]);

mesh (tx, ty,  tz);
%plot3 (r.*sin(t), r.*cos(t), z);

xlabel('house size');
ylabel('# of rooms');
zlabel('prevision $');
legend('Training data', 'Linear regression');
view(45,37);
title('Rot=45 , Elev= 40');
%axis([min(X(:,2)) max(X(:,2)) min(X(:,3)) max(X(:,3))   ]);
hold off; % don't overlay any more plots on this figure


%%%%%%%%%%SUBPLOT 4 %%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4);
plot3 (X(:,2), X(:,3), y, 'rx') ;
hold on; % keep previous plot visible
%plot3( xfak , xfak , X*theta, '-')
 
[tx , ty] = meshgrid ( linspace(min(X(:,2)),max(X(:,2)) ,25), linspace(min(X(:,3)),max(X(:,3)) ,25  ) );
%molt di matrici su mesh
 tz = theta(1) + theta(2) * tx + theta(3) * ty;
%figure('Position',[250,250,1024,768]);

mesh (tx, ty,  tz);
%plot3 (r.*sin(t), r.*cos(t), z);

xlabel('house size');
ylabel('# of rooms');
zlabel('prevision $');
legend('Training data', 'Linear regression');
view(0,0);
title('Rot=0 , Elev = 0');
%axis([min(X(:,2)) max(X(:,2)) min(X(:,3)) max(X(:,3))   ]);
hold off; % don't overlay any more plots on this figure
