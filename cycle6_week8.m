% % For more examples see YAGTOM (yet another guide to MATLAB)
% section "Flow Control"

% Our goals are to introduce if statements and to use them in combination
% with for loops we worked on before.

% if statements are used to make decisions in your code. Look back in
% cycle6_week7.m to section 6 on the while loop. There I used an if statement to
% determine if the value stored in the variable tmp met our criterion (ie.
% that tmp is less than -1).


% 1. Assign the variable tmp a value (random or fixed, however you wish),
% then re-write an analogous if statement to that used in cycle6_week7.m except
% simply print the variable to the screen if the condition is met.
% Remember if statements need an end.


% The condition immediately following the if must evaluate to true or false,
% zero or one. There are many important operators. The example in 1. above uses the 
% operator:

% less than, <, 

% but there also exist many more: 

% greater than, >
% greater than equal to, >=
% less than equal to, <=
% equal to ==
% and not equal to ~=


% 2. Let's test them out. Search the help or google for "Relational
% operator" and you should find the correct syntax. Create two variables A
% and B by assigning them values. Test the operators and make sure they
% behave as you expect as you change A and B.


% Another kind of operator that is useful for if statements are the logical
% operators. Google or search the documenatation for these. They are "and",
% "or", "not" and "xor". "and" and "or" are useful when you need to make a decision
% which depend on the relationship between two conditions.

% For example create a variable A by assigning it the value 1. Create a
% second varibale B by assigning it the value 0.

A=1;B=0;

% Print the value of A and B to the screen:

A & B

% Change A and B to be 1 and 1 and repeat:

A=1;B=1;A & B

% and do the other two possible combinations:

A=0;B=1;A & B
A=0;B=0;A & B

% Side Note: By evaluating all the possible combinations we have generated
% the "truth table" for the and operator. Check the Wikipedia page.


% 3. Repeat the above combinations and find all the values of the truth
% table for the or opertor which is written as a | instead of an &.

% Change A and B to be 1 and 1 and repeat:

A=1;B=1;disp(A | B)

% and do the other  possible combinations:

A=0;B=1;disp(A | B)
A=1;B=0;disp(A | B)
A=0;B=0;disp(A | B)


% 4. Repeat for xor (exclusive or). What's the difference?

% Change A and B to be 1 and 1 and repeat:

A=1;B=1;disp(xor(A,B))

% and do the other possible combinations below:

A=0;B=1;disp(A | B)
A=1;B=0;disp(A | B)
A=0;B=0;disp(A | B)


% What about ~ (not)?


% 5. Use load to read in the dat in cell1.mat and cell2.mat.
% Note I used these commands to make the matrices. We will use the ones
% that I saved in files, so that everyone gets the same results.

%  cell1 = randi(2,100,1) - 1;
%  cell2 = randi(2,100,1) - 1;

load('cell1.mat')
load('cell2.mat')

% Each of these is a sequence of 100 1's and 0's. Imagine you have
% collected calcium imaging data of two cells and you have already
% processed the recording for each cell. The 1's and 0's now represent whether or
% not there was a calcium transient at time points 1 through 100.

% Using a for loop and an if statement, print the time points at which both
% cells are firing to the screen.


% 6. Repeat 5 but print those time points in which one cell fires, but not
% the other. This time store the results in a variable. Check the example
% of the while loop in cycle6_week7.m for an example of how to store the results 
% in a variable.


% 7. Again using a for loop and an if statement, print the time points
% at which cell1 fires and cell2 fires in the next time point.
% Keep in mind that we cannot test this for the final time point.


% 8. if statments can be expanded to include multiple components. This is
% called an "if then else". Other variations are possible i.e. "if elseif 
% else" can be used to do one thing if your condition is true and another
% if it is not.

% Using a for loop and an if then else statement store the time points
% where both cells fire in one variable and the time points where they do
% not in a separate variable.


% 9. Matlab has lots of shortcuts that let you do things without loops.  
% There are ways to use logical operators on arrays without loops.

% Try:

cell1 & cell2

% find is very useful:

tpts=find(cell1 & cell2);

