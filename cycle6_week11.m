% This time we will look at functions to get input from various sources.
% One is the keyboard and one is the mouse.

% To get input from the keyboard, we can use the matlab function input.
% Use doc input to see the manual page.

doc input

% To get numerical data from the keyboard, use the function call

evalResponse = input('Please enter a number: ');

% Matlab will display a prompt with the text you've entered as a string as
% the input argument to input. When you type a number and press enter that
% value will be stored in evalResponse. You should see it in the
% workspace.

% Please note that this form works for a matrix as well. Try it again with
% input like [12,13,14].

evalResponse = input('Please enter a matrix: ');

% Matlab will automatcially recognize the data as a matrix that you have
% entered and store it in the function's output arg, i.e. evalResponse.

% To get string input from the keyboard, a slightly different form of the
% function call for input is required. There is a second input argument
% which is the string 's' indicating to matlab to interpret the input as a
% string, not numerical.

% Please try the function call below and type your name.

yourname = input('Please type your full name, for the record: ', 's');

% Try it again and enter a number instead of letters. Look in the
% workspace. The output variable is still created and no error is
% generated, but the input is interpreted as a string, i.e. the
% numbers entered are stored as characters and not numerical data.

yourname = input('Please type your full name, for the record: ', 's');

% You can use the built-in function called isempty to see if the user
% responded with something. Try the following.

reply = input('Do you want more? Y/N [Y]: ', 's');
if isempty(reply)
    reply = 'Y';
end

% If you try the above lines of code for several inputs, you will find
% whatever you type at the prompt is stored in the output arg of input as a
% string variable. However if you press enter without typing a string, 
% the reply is automatically set to 'Y'.

% Please note that this is one of the drawbacks of asking for keyboard input
% instead of assigning variable values in the code. You must check the
% input to see if it makes sense.


% 1. Write some code to prompt the user for input. You want numerical
% input. Check to see if the user has given you a number in the range of
% -10 to +10. Display a warning if the input is invalid.

% Bonus: use a while loop to re-prompt the user for input if it is out of
% range.


% The function ginput allows you to get input from the mouse about the x
% position in a figure.

% Let's make a simple plot of a sin wave.

x=-10:.01:10;
figure;plot(x,sin(2*pi*x));

% Set the axes so we can clearly see the mins and maxes in the figure
% window.

axis([-10 10 -2 2]);

% Now use ginput to allow you to click on 5 of the maxes and store them in
% variables.

[x,y] = ginput(5);


% 2. Load in the microglia image in cell.tif. Use the ginput function to store
% the position of the cell body.

% Bonus stuff:

npolys = input('Please enter a number of polygons: ');
s=size(img);
cell_mask=zeros(s(1),s(2),npolys);

for i=1:npolys
    cell_mask(:,:,i)=roipoly;
end

figure;imshow(cell_mask)

