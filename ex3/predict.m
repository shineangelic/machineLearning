function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
X = [ones(m, 1) X];
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%COME DOVREBBE, ma non va
%(op1 is 25x401, op2 is 400x5000)
z2=((Theta1*X')') ;


a2 = sigmoid( z2 );
%add layer2 Bias
a2 = [ones(m, 1) a2];



%layer 3 -> come logistic regression
%(op1 is 10x26, op2 is 5000x26)
z3 = (Theta2*a2')';
%z3 = [ones(m, 1) z3];

a3 = sigmoid( z3 );
%piglia l'indice corrispondente alla p.ta' max
[val, col] = max( a3, [] , 2);
p=col;

















% =========================================================================


end
