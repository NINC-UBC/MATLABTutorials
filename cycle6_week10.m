% % For more examples see YAGTOM (yet another guide to MATLAB)
% section "File input and output"

% http://ubcmatlabguide.github.io/html/files.html#22

% This week's tutorial is about files. We will present various ways to save
% files including matlabs native formats, text files, and binary data files
% to use with (for example) imagej.

% Matlab has two important file types that we've used throughout the
% tutorial. One is the .m file we used to save our scripts and functions.
% The other is the .mat file (remember cell1.mat and cell2.mat) which we
% used to store data. To store data in a .mat file, you can manually go to
% the workspace and right-click a variable. When you select save as, it will present
% a dialog to allow you to save the variable in a .mat file.

% Let's try this.

% Create a variable full of random numbers.

dat=rand(10,10);

% Right-click it in the workspace and save as to a file called dat.mat.
% When you select dat.mat under Current Folder in the left window, it will 
% show below what variables are in the file. In this case, there is one variable
% called dat. As we expect, it is a 10x10 matrix. You can load it into the
% workspace by double clicking the file.

% Type clear in the command window to clear the workspace and try 
% re-loading dat by double clicking dat.mat. Matlab will show the
% equivalent command in the command window.  

clear

% .mat files can contain many variables so you can also load only those you
% choose by dragging the variable name to the workspace.

% Type clear and load dat again, this time by dragging.

% .mat files can also be written from your scripts and functions using the
% save command

% Try the following command:

save('my_workspace.mat')

% You should get a file called my_workspace.mat. If you click on it, it
% should have a single variable called dat.

% Create another variable

dat2=rand(20,20);

% and repeat save

save('my_workspace.mat')

% Now the file should have two variables called dat and dat2 saved within
% it.


% 1. Look up save in the documentation by typing doc save. Use the second
% argument of this function called variables to make the save command save
% only the variable dat2 in a file called dat2.mat.


% .mat files are useful for saving your work or the progress of your
% scripts but in general, text files are a good choice for importing into
% different programs for further analysis or sending to other people who
% may not be using matlab.


% 2. Continue to look through the documentation for the save command. It
% allows you to save as a text file. Hint: Ascii means a text format.
% Save the variable dat2 in a file called dat2.txt. Open this file with
% excel or a text editor to confirm that the command worked.


% Matlab allows you to write many stadard image formats. Create a test
% image called img of 512x512 pixels with random values.

img=rand(512,512);

% Write it out in jpg format using imwrite to a file called test.jpg

imwrite(img,'test.jpg','jpg');


% 3. One of the more convenient ways to save large stacks of images is to
% use fwrite to write the images directly to a binary file. ImageJ can
% directly read these so long as you specify the dimensions. This requires
% a couple of extra commands in comparison to the file saving exmaples above.

% First, create a stack to save using random numbers again. Call the
% variable dat3 and make the image 256x256 pixel with 35 slices in the
% stack.

dat3=rand(256,256,35);

% Create a variable called file_out by assigning it a string value of
% 'test_stack.raw'. This will be the filename of the file which is
% written.

file_out='test_stack.raw';

% Use the command fopen to open the file for writing and select the option
% 'b'.

fid=fopen(file_out,'w', 'b');

% fopen has an output argument called the file id which we've stored in the
% variable fid. This is used as an input argument by fwrite to ensure we are 
% writing to the correct file.


% 4. Use fid and file_out with fwrite to write the file. Check the precision option.
% Use float32.

fwrite(fid, dat3, 'float32');

% Once the file is written close it using fclose.

fclose(fid);

% Bonus: Use File>Import>Raw in ImageJ to load the stack.

% Double Bonus: Create a function called raw_write to handle writing the
% file for you.

% What input arguments would be needed?  Output arguments?

fid=raw_write(file_out,dat3);