% Cells, Strucutres, & Objects

% In this tutorial we will introduce cell arrays, structures, and
% objects. Variables of these types are more complicated than a basic matrix,
% but can be useful for organizing your analysis. You will also encounter them as
% input and output arguments of both built-in and file exchange
% functions, so familiarity is important to be able to get these working.

% Cell arrays.

% Cell arrays are similar to matrices in that variables of this type can
% be indexed, but you must use {} in place of the usual () we have been
% using for matrices.

% For example, a normal matrix can be indexed like so

a=[2 3; -2 -3;];

b=a(1,2)

% The notation a(1,2) isolates the value in the 1st row, 2nd column and the
% = assigns this elements value to a new variable b.

% If a were a cell

a={2 3; -2 -3;};

b=a{1,2}

% is analogous.

% So what's the difference and/or advantage?

% Unlike matrices, where each element must be the same type of data, cells
% can hold different things, like strings and numbers.

a={'c1' 'c2'; -2 -3;};

% This new a is a valid cell array. Cells can even be matrics.

a={'c1' 'col 2'; -2 -3; [1 2 3] [7 8 9 10];}

% The matrices or strings don't even have to be the same length. Double
% click a in the workspace to take a look.

% This makes cells very flexible, but it's up to you to keep track of what
% goes where:

a{1,2}=1;

% This last command changes the value of {1,2} from 'col 2' to 1. It is
% both a change of value and of type. It's valid to do this in matlab, but
% since you will not get an error it can lead to strange results if you
% didn't intend to do it.

% A useful function that outputs a cell array is uigetfile when multiselect
% is on. uigetfile is a function which can return a list of files select
% by the user through a user interface dialog.


% 1. Try uigetfile with multiselect.

% Check week4 for an example (near the end of the tutorial).

[filename, pathname] = uigetfile( ...
{  '*.*', 'All files'}, ...
   'Pick a file(s)', ...
   'MultiSelect', 'on',mypath);


% 2. Write a for loop to make use of the returned file names in the cell
% array. Simply display them to the screen in turn.

for i=1:numel(filename)
    disp(filename{i})
end


% Structures.

% Structures are variables that have fields, each field is accessed using
% dot notation, i.e. by a . after the variable name.

% For example evaluate:

var1.field1=1;
var1.field2='a';
var1.field3=[1 2 3];

% Double click var1 in the workspace to take a look.


% 3. Write a function called time_course_metrics which takes a 1d matrix as 
% the input argument and returns the average and standard deviation over 
% time as two output arguments.

function [ avg, st_dev ] = time_course_metrics( tc )

avg=mean(tc);
st_dev=std(tc);

end

% Make a random time course of 100 points using randn to serve as test
% input for your function.

test=randn(1,100);

% Call your function to test it.

[a,s]=time_course_metrics(test);

% As we have seen before for random normally distributed numbresers, the mean 
% should be close to zero and the std should be close to 1.


% Imagine that you'd been making use of this function for a long time and
% written many other programs that made use of it. And then you want to
% add another output argument say for the maximum value. You could go back
% and add yet another output argument, but you may end up having to edit a 
% lot of code to make use of your new argument.

% Instead, you could use structures. If you make the ouput of your
% function a structure, you can always add one more field. The addition
% of the new field is transparent to the calling program, meaning you don't
% have to find all the places where the function is called and edit them so
% that your new metric is calculated.


% 4. Re-program your time_course_metrics function to add the calculation of 
% the max value over time. This time make the output a structure called
% res (short for result). Give the result 3 fields: one for the average,
% one for the standard deviation, and one for the max value.

function [res] = time_course_metrics( tc )

res.field1=mean(tc);
res.field2=std(tc);
res.field3=max(tc);

end


% Objects.

% Objects extend the idea of grouping output arguments of a fucntion using
% structures to the grouping of whole data structures and the associated
% functions that operate on them.

% Open bar2plot.m. This is a simple example to illustrate. Objects are
% defined by classes and this is shown in the first line. The object has
% both properties and methods. The properties are the data structures or
% variables of which the object consists. In this case: Data, a and err.
% The associated functions are called methods; in this case, there is one
% called bar2plot and one called view. The first one is called the
% constructor. It creates the object and sets the values of the
% properties. The view method in this case plots the object in a bar
% graph form using the bar graph error bar function that we used before.

% Create the object by giving some data to bar2plot.

dat=bar2plot([1 2 3 4; 5 6 7 8]');

% Just like the fields of structures, properties can be accessed with dot
% notation.

disp(dat.a)

% Also methods!

dat.View()

% Or with a more conventional function look.

View(dat)

