% These examples are borrowed from the YAGTOM (yet another guide to MATLAB)
% section "Getting Started".

% The purpose is to introduce the matlab interface, including the editor,
% command window, command history, workspace and folder view. We will
% introduce the concept of variables and the different values including
% numbers and characters (strings) that can be assigned to them.

% http://ubcmatlabguide.github.io/html/gettingStarted.html

% matlab will evaluate for you most arithmetic, you can type it directly in
% the command window below or here in the editor. You can highlight the
% command on line 15, right click and choose "evaluate selection"

1+1

% You should see something like

% ans =

% 2

% in the command window. A variable named ans with value 2 will also pop up
% in the workspace. Think of this as a default name for the result of the
% last expression you've asked matlab to evaluate. If you don't explicitly 
% assign the result to variable, it will be named ans.

% Try another one. Highlight and evaluate the expression below to
% calculate the square root of pi (3.14 .... )

sqrt(pi)

% Notice the ans variable in the workspace has taken on a new value of
% 1.7725. Also notice that your expressions are being logged in the
% command history. If you wish to reuse the command, click in the command
% window and press up arrow.  You should see your command to evaulate the
% square root of pi pop back up.

% 1. Edit your command and calculate the square root of 2*pi

% matlab has different types of values it can work with. In addition to
% the numerical examples above we can also manipulate text. This is useful
% for interacting with files as we will see in a few weeks. Variables
% containing text are called strings. Evalaute the string below by
% highlighting and choosing evaluate selection as before.

'foo'

% Notice ans takes on a new value coresponding to this text.

% matlab using the = symbol to denote assignment. When you evaluate a
% statement such as

myvar = 1+1

% the value resulting from the arithmetic is assigned to the variable
% called myvar. Variable names can usually be chosen quite arbitrarily
% although it is best to avoid names that are used already by matlab for
% other purposes such as "sqrt" and "pi" that we have seen above. You will
% become better at naming variables with practice.

% 2. Evaluate the following

a = 'hello'
f = log10(100)
g =2^10 - 1

% Notice the new variables appearing in the workspace. a is a string, f
% and g are numerical.

% In the command window or editor write an expression to compute 
% g plus one divided f.

(g+1)/f

% What is the resulting number?

% matlab is meant to handle data organized in matrices. For example image
% data is often naturally organized in this manner. For example you could
% have two spatial dimensions corresponding to the x and y pixels as well
% as a third dimension representing time if you were to take a time lapse
% image sequence.

% Evaluate the following examples:

a = 1:3

b = [1 2; 3 4]

c = ones(2,2,2)

% Notice that a is a single row of numbers. In matlab a : symbol is
% shorthand for a = [1 2 3] in this case. A list of number is stored in a
% starting with 1 and ending with 3 incrementing by 1 each time. This will
% be very useful in the future.

% 3. Modify the expression assigning the list 1 through 3 to a to instead
% assign the numbers 10:99 to a.

% Bonus: Run the same command again with a semi colon symbol ; at the end
% of the command. What does the semi colon do?

% Notice b assigns the values 1 2 3 4 to b organized into 2 rows and 2
% columns. Images may have many more pixels (say 128x128 or 512x512) but
% they will be stored in matlab in an analogous fashion.

% c is assigned a value by the built-in matlab function ones. The command
% ones(2,2,2) asks matlab to generate a 3d matrix (for example this could
% represent two spatial and a time axis) and fill all the values with
% ones. The 2's in the parenthesis indicates, 2 rows by 2 columns repeated
% twice. Think, 2 x positions, 2 y positions , 2 time points.

% 4. A built-in matlab function we will use a lot more than ones is
% analogous but called zeros. It operates in the same manner, but fills
% the variable with zeros instead of ones. We will use it often to initialize
% variables to store the results of our calculations.

% Write an analgous command to the one above defining c using zeros. This
% time make c have structure with 4x4 spatial dimensions and 47 time
% points.  

% The documentation in matlab is very good and is essential when working
% with it as we will need to refer to it to learn differnt ways to use the commands.

% 5. Access the documentation about the command zeros that we just tried
% above.

doc zeros

% There are usually many examples to help figure out how the command works.