% For more examples see YAGTOM (yet another guide to MATLAB)
% section "Functions"

% http://ubcmatlabguide.github.io/html/writingFunctions.html

% Our goal is to re-visit functions including their input and output 
% arguments. We will then write some practice functions and then work on a
% function to analyze some voltage sensitive dye data.

% This week's tutorial is about making your own functions. Matlab has many
% built-in functions that we've already used, such as zeros and xor.
% Typically, they have input and output arguments, i.e. variables needed as
% input and variables to store the results in. In the case of zeros:

dat=zeros(10,10);

% The input arguments specify the size of the array to create, i.e. 10x10,
% and the variable dat is assigned the result.


% 1. How would you describe the input and output arguments of xor?

A=1;B=0;

res=xor(A,B);


% Keeping track of the input and output variables is very important when
% writing your own functions. We need to keep in mind what values or sizes
% of arrays or types (true/false vs numerical vs strings) are expected as both input
% and output to avoid unexpected results.

% Use the File>New>Function to create a new editor tab with the basic
% Matlab function template.

% We must edit the first line

% function [ output_args ] = untitled( input_args )

% to name our output and input variables and the function itself. Change
% output_args to res (short for result). Change untitled to myfirstfunc.
% Save your function as a .m file. It must have the same name as the
% function to work properly. Change input_args to arg1.

% Let's now edit the function to make it do something. Use an if statement
% inside your function to compare the value (i.e. the input argument, arg1) to 10.  
% If it is larger than 10, print it to the screen and store the value in 
% res. If it is not larger than 10, print a message to
% indicate this with a message to the screen using disp and store -1 in res.

% Create a varible to use as the argument, keep in mind that since the
% function does not yet do anything, the variable could be anything but
% let's use a number.

C=10.7;

% Keep in mind that even though we have called the variable C in the script
% above and once created, it is C in the workspace, C does not necessarily
% appear inside the function. The input argument of myfirstfunc is called
% arg1 and when we use the function, the value of C is substituted for arg1
% inside the function.

% Call your function with input argument C.

res=myfirstfunc(C);

% You should see 10.7 or something similar print to the screen.

% Change the value of C to something less than 10.

C=-5;
res=myfirstfunc(C);

% Verify that res is set to -1. 
  

% 2. Modify your function to add a second input argument to represent the
% value to which the first argument is compared to. Said another way, the second 
% argument will take the place of the value 10 in our first function. This
% will allow the user of the function to change this parameter without
% having to re-code the function.

% To print a message indicating that the second argument is not greater
% than the first, you can use concatenation or see

doc sprintf

% Hint: Evaluate

msg = sprintf('This is tutorial %d of %d', 9, 13)

% Call your function for various inputs to verify that it works.

D=10;

res=mysecondfunc(C,D);

C=-2;
D=-10;

res=mysecondfunc(C,D);


% 3. Load in the data stored in week9.mat. Plot it to take a look.

load('week9.mat')
figure;plot(trace)

% This is a single trial voltage sensitive dye (VSD) response to a forelimb 
% stimulation in a particular area of the dorsal cortex of a mouse.
% The stimulus occurs at frame 31 and the reponse peaks soon after.
% Responses can vary depending on brain state, anesthesia, etc. and
% sometimes it is useful to set a threshold to determine whether an ROI can
% be considered to have responded. One such threshold is that the response
% must exceed the baseline by several standard deviations of the baseline
% fluctuations.

% Write a function called responds which takes the trace as an input argument 
% as well as the stim frame. Use the stim frame to isolate the baseline and response 
% parts of the trace. Calculate the standard deviation of the baseline.
% Find the maximum of the response. Use an if statement to determine if
% the maximum of the response exceeds the mean of the baseline by 2.5 standard deviations.
% Set the output argument of the function equal to 1 if the response meets the
% requirement, set it to 0 if it does not.  

res=responds(trace,31)

% Bonus: How would you add code to warn you if you were very close to the
% threshold?

res=responds(trace,31)


% 4. Add extra arguments: make the number of std dev's an input variable.
% Make the maximum and baseline values output variables.


% Comment on comments.  pre, post conditions. What are the assumptions we
% are making in writing this function?