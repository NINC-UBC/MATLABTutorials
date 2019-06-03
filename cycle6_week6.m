% This week we review the last 5 weeks.

% Week 1 Review:

% In week 1, we introduced many ideas: variables, assignment, evaluation. As
% well as the different parts of the matlab interface: the editor, the command
% line, the workspace, and the command history.  

% In the command window below, we can directly type commands and evaluate
% them. Recall typing 

1+1 

% Matlab automatically assigns the result to a default variable name called
% ans, which appears in the workspace to the right.

% We normally create variable by assignment using the = operator
% Recall expressions like:

a = 'hello'
f = log10(100)
g =2^10 - 1

% Notice a couple of things:
% i. The results of the assignment are displayed in the command window. Why?
% ii. Variable a is a string. Variables can have different types. What
% others have we seen besides numerical and string?

% We introduced matrices. Matrices are the most important variable type in
% matlab and used to represent most data. Although they can have lots of
% dimensions, it is convenient to think:

% 1d matrix -> time course of a signal
% 2d matrix -> an image
% 3d matrix -> a volume, i.e. stack of images


% 1. The shorthand for generating a matrix consisting of an ordered list of 
% integers with a start, an end and a given increment (or decrement) is
% used a lot in matlab. Write a command to store the sequence  1 3 5 7 9
% and store the result in variable a.


% Week 2 Review:

% In week 2, we expanded on ways to create matrices. Recall that we can type
% them in directly. For example:

a=[1 2 3; 4 5 6 ; 7 8 9]

% makes a 2d matrix with 3 rows and 3 columns.

% Also recall that matlab has many built in functions for creating
% matrices.

% For example: 

a=zeros(3,4)
b=ones(4,3)

% These commands create 3x4 and 4x3 matrices filled with zeros and filled
% with ones.


% 2. Write a command to create a 1x10 matrix filled with normally
% distributed random numbers. Assign the result to b.
% Hint: recall randn command.


% We introduced many built-in matlab functions which report different
% properties of the matrix.

% numel gives the total number of elements of the matrix
% size gives the number of rows and columns 
% mean gives the mean value of the numbers stored in the matrix
% std gives the standard deviation of the numbers stored in the matrix
% sum adds the numbers in the matrix
% min finds the smallest value
% max finds the largest value


% 3. Write commands and evaluate to calculate each of the above quantities for
% your random matrix, b.

% Bonus: Use two output arguments for the max and min commands to find both
% the largest and smallest values and their corresponding positions in the
% matrix (index).


% Week 3 Review:


% 4. Week 3 was about indexing. Indexing allows us to specify which part of
% the matrix we want to isolate by referring to those elements in
% parentheses after the variable name. For example, to see the value in
% the first row and first column of b, we would evaluate:

b=randn(4,4);

b(1,1)

% Write a command to add the elements of b which are on the diagonal of the
% matrix.
% Hint: The diagonal refers to the elements for which the row and
% column number are equal. b(1,1) is the first element on the diagonal of
% b.


% 5. The shorthand we discussed for ordered lists is often applied to
% indexing. Using the start:finish shorthand, isolate the first 3 rows and
% first 3 columns of your matrix b. Assign the result to a new variable
% called c.


% 6. Overwrite variable c. This time store the last 3 rows and columns of
% b.

% Bonus: Is it necessary to make use of the number 4 in the command?


% 7. We also introduced logical indexing. This indexing method allows us
% to isolate the elements of a matrix which satisfy a certain condition.
% An intensity threshold applied to an image is an example. It gives you
% all the pixels which are above the threshold.

% Let's try exactly this application.

% Use imread to read in the data in the file cell.tiff, assign the result
% to a variable named dat.

dat=imread('cell.tif');

% Evaluate the following command to see the image:

figure;imagesc(dat)

% Logically index dat to find those pixels which are greater than 200.
% Assign the rsult to a variable called th.

% Use the following command to see your thresholded image:

figure;imshow(th)


% Week 4 Review:

% In week 4 we spent some time on strings in the context of filenames.

% For example, if we store the string 'cell1.tiff' in a variable called
% the_filename we can refer to this and read in the data in the file to a
% variable called c1.

the_filename='cell1.tif';
c1=imread(the_filename);

% Use this command to see the result.

figure;imagesc(c1)

% Often we have filenames which are simply numbered. For example, the
% cell1.tif, cell2.tiff and cell3.tif. We can generate them in matlab by
% concatenating the parts of the filename.

% Concatenation uses square brackets [ ].

myfile=['cell' num2str(1) '.tif']

% Recall the num2str function which converts the number 1 to the
% string '1' for us.

% This lends itself to the automatic generation of filenames using loops
% which can be a quick way to read in your data.


% 8. Write a loop to automatically generate the filenames of cell1.tif
% through cell3.tif.

% Bonus: read each image in and store in 1 plane of a 3D matrix, where
% the dimensions represent x y pixels and cell number. Call your matrix
% cells and initalize it to all elements equal to zero when you create it.


% Week 5 Review:


% 9. In week 5, we used imagesc to display an image in a figure window.
% Add commands to your loop to display the image as it is read in. Title
% each figure with the filename.

% Bonus: look up the doc page for the subplot command. How might this be
% applied?
