% For more examples see YAGTOM (yet another guide to MATLAB)
% section "File System Issues".

% So far we have spent our time learning about matrices and how to
% manipulate them. We will use matrices to represent our data and indexing
% to isolate and work with specific pixels or time points, for example.
% However, our data is usually stored in files which means to read it into
% matlab we must be able to generate and manipulate text variables to 
% represent the filenames. Such text variables are called strings.

% Our goals are to introduce string variables and learn how to
% manipulate them by indexing and concatenation. We will introduce and
% make use of the built-in matlab function num2str, load, imread as well as
% introduce the for loop.  

% First let's look at a string. Evaluate:

a='a string';

% A string is a group of characters surrounded by single quotes. Matlab
% will automatically turn it purple.

% In this case we use the = to assign the characters to a variable called a.
% a can be indexed like other matrices. You can think of a string variable
% as a matrix with a single row. Each element is a single character rather
% than a number.

% So it can be indexed. Evaluate:

a(1)
a(3:end)


% 1. Which characters will this command return?

a(1:2:end-1)


% You can use the built-in matlab function disp to avoid seeing ans = in
% the command window.

% For example:

disp(a)

disp(a(1:5));

disp(a(6:end));

% So as you can see, by indexing you can isolate part of the string, which is
% useful if you only want to look at or use part of it.

% This can handy for filenames. Let's work with the 4 text files:
% VicPos1_Roi1.txt, VicPos1_Roi2.txt, VicPos1_Roi3.txt, & VicPos1_Roi4.txt.

% For example, say your input filename was stored in the variable
% myfile_in. Evaluate:

myfile_in='VicPos1_Roi1.txt';

% Imagine that you've loaded your data, done some analysis and now want to 
% save the results in a .mat file.

% We can use this filename as a basis for the output name to keep things organized:

% Index the string to isolate the filename from the .txt extension:

myfile_out=myfile_in(1:end-4);

% Note that the 4 characters at the the end are the extension .txt so we
% can leave them off by keeping only the charaters 1:end-4.

disp(myfile_out)

% Next we can concatenate some meaningful text to describe the results
% (_RESULTS in this case) along with the appropriate extension .mat.
% Concatenation is accomplished with [ ] square brackets as it is with
% numeric matrices.

myfile_out=[myfile_out '_RESULTS.mat'];

% Now we have a filename to store our results in.

disp(myfile_out)

% Our 4 text files are named in a numerical sequence. We can use these
% string manipulations to automatically generate these filenames.

% Store the first part of the filename in a variable
file_prefix=myfile_in(1:end-5)

% store the last part (without the numerical bit) in another variable
file_suffix=myfile_in((end-3):end)

% We can also generate filenames referring to any numbered ROI by
% concatenation. To do this, we need to make use of the built-in matlab function 
% called num2str. This converts a number, 4 for example, to a string '4'
% so that we can concatenate it with other strings.

a_file=[file_prefix num2str(4) file_suffix]

% or the 3rd...

another_file=[file_prefix num2str(3) file_suffix]

% This is a good time to introduce loops as we can make use of them to generate
% our filenames. For loops allow you to repeat a set of commands a given 
% number of times. They always begin with for and end with an end
% statment. After the for, you define a special variable known as the loop
% variable and assign it a set of values. Usually this is an ordered list
% of numbers given with typical matlab shorthand e.g. 1:4 meaning [1 2 3 4].
% The first time the loop runs, the variable i will be set to its first
% value, e.g. 1, and the second time, 2, and so on up to 4 in our example. Try
% this loop below.  

% Example loop 1:

for i=1:4
    
   disp(i); 

end

% It runs the disp command 4 times. Once for each value of the loop
% variable i. You should see it printed in the command window.

% So, by combining the loop with our filename by concantenation,
% we can use it to make filenames

% Example loop 2:

for i=1:4
    the_name=[file_prefix num2str(i) file_suffix];
    disp(the_name);
end

% You can imagine generating each filename in turn in your loop and
% using the name to read its data into the matlab workspace.

% So once you have the name of a file in a string, how do you read it in?

% It depends on the type of data.

% For text files, use load:

myfile_in=[file_prefix num2str(400) file_suffix];
disp(myfile_in);
% Example text load:
dat=load(myfile_in,'-ascii');

% You can see dat is assigned the numbers that are in the filename stored
% in myfile_in

dat(:,1)=dat(:,1)/5.92;%Hz


% 2. Combine the loop above and the load command to read in each txt file
% for ROI's 1-4 in sequence.

% Let's break this down into a few steps.

% 2.1 Before we start let's think about the matrix we need to store the data in 
% for all the files:
% How many dimensions should it have? How many values of the index for
% each dimension?  

% 2.2 We have already read in one of our txt files above and
% seen with the figure that it is a timecourse of a signal, i.e. it is two columns
% of numbers. This data is stored in matrix dat and we can see in the 
% workspace that it is 115x2. We could use these values directly when 
% setting up our matrix to hold everything, but let's use matlab functions 
% to do this automatically. Use the size command find the size of dat.  
% Store the result in s.

s=size(dat)

% 2.2 We know that we have 4 files to read in. Let's create a variable
% called n_files and assign it the value 4 using the =.

n_files=4;

% 2.3 Using n_files and the values stored in s as input, use the zeros
% command to set up an empty matrix to hold the data. Call the matrix
% all_dat.

all_dat=zeros(s(1),s(2),n_files);

% Hint: Thinking back to 2.1, we need a matrix which has space for 4 files 
% worth of 115 rows x 2 columns.

% 2.4 Referring to example loop 1 above, set up the basic template of a for
% loop.

for i=1:n_files
    
end

% 2.5 We've defined a variable for the number of files. Substitute it into
% the for statement in your for loop template to determine the values of the 
% loop variable.

% 2.6 Inside the loop we need to do two things. First, create and display the
% filename. This is analogous to example loop 2 above. Put these commands
% inside your loop in 2.4.

% 2.7 The second thing our loop needs to do is read in the data and store
% it in the appropriate place in all_dat. Reading in is analogous to the
% example text load above. Put this command inside your loop, but make
% sure the string variable name for your filename from 2.6 matches the
% load command. Finally index all_dat using the loop variable to store the
% data from the file.

for i=1:n_files
%   disp(i)
    myfile_in=[file_prefix num2str(i) file_suffix];
    disp(myfile_in)
    dat=load(myfile_in,'-ascii');
    all_dat(:,:,i)=dat;
    figure;plot(all_dat(:,2,i))
    title(myfile_in)
end

% Bonus:  Check that each timecourse was successfully loaded by plotting.


% Ok, now on to examples of how to read in other file types:

% Matlab has the built-in function imread to read in a single image. 
% Try it:

myimage=imread('sample_image.jpg');

% Evaluate to see the image.

figure;imagesc(myimage)

% But what about paths? You might ask... We can't always have the files 
% in the same folder as the code.

% A simple approach: You can type it in and assign it to a variable:

mypath = '/Users/jledue/Downloads/Matlab Tutorial C6/'

% Then simply concatenate like we've been doing:

fullfileandpath=[mypath myfile_in];
disp(fullfileandpath)

% This will look a bit different on Windows, due to the C: and \.

% Or you can use the built-in function uigetfile. Evaluate the command
% below and select the 4 text files in the resulting dialog.

[filename, pathname] = uigetfile( ...
{  '*.*', 'All files'}, ...
   'Pick a file(s)', ...
   'MultiSelect', 'on',mypath);

% We can now concatenate as we have been doing.

tmp=[pathname filename{1}]

% Being sure to index filename to get the one we like.


% 3. Write a loop to display all the filenames in sequence in the result of 
% uigetfile.

% Hint: use curly brackets to index filename. It is a new type of variable
% and requires these. It's called a cell array.

% As with lots of things in matlab, there are many ways to get lists of
% filenames.

% Here is another:

listing_txt=dir('*.txt');

% Evaluate:

listing_txt(1).name

listing_txt.name
