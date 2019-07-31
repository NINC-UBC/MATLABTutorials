% This example will allow us to put together some of the things we have been
% learning about strings, matrices, built-in and file-exchange matlab
% functions.

% The overall goal is to process a set of image stacks (xyt) which were recorded
% during repeated stimulation of the hindlimb of a mouse. The images are of
% the left hemisphere of the dorsal cortex and we expect the primary and secondary 
% somatosensory cortices to activate. The reporter in this case is a
% fluorescent voltage sensitive dye. It brightens when the membranes
% deploarize.

% I have provided a folder called VSD_data which contains files in numerical
% sequence. The ones we will use are called hi*.tif and no*.tif where the *
% is a number from 1-5. The hi files were stimulated and no files were not.
% We will make use of both eventually.


% 1. Let's begin by reading in a single file.

% 1.1 First, let's define some string variables: one for the path to the
% file and one for the filename.

% The path:

pathname='C:/Users/User/Documents/MATLAB Tutorials/Matlab Tutorial C6-2/VSD_data/';

% NB: This will be different on Mac vs Windows (think C:\). Don't forget a folder
% separating slash at the end in any case. The easiest way to get it is to
% navigate to the VSD_data folder (double-click) in the Current Folder viewer to the left
% of the editor. Above the Editor and Current Folder windows, there is a
% text box with the full path to VSD_data. Click on it, then copy and paste
% the path into the variable above. Note that Windows users must replace all "\" with "/".
% Then navigate back to the folder with the tutorials.

% Let's read in the first hi file.

filename='hi1.tif';

% 1.2 Now concatenate the strings using square brackets and assign the
% result to a new variable. Call it fullpathandfile.

fullpathandfile=[pathname filename];

% 1.3 We will make use of the supplied function called imreadalltiff to
% read the image stacks into variables. Try:

dat=imreadalltiff(fullpathandfile,108);

% Notice the second argument of imreadalltiff is 108. There are 108 time
% points in our image stack. Look in the workspace. dat is 128x128x108,
% which means 128x128 rows and columns of pixels in each of the 108 time points.

% 1.4 Define a variable called nFrames by assigning it the value 108 so
% we can use it later.

nFrames=108;

% 1.5 Now that we have the data from hi1.tif in the variable dat, let's plot
% the time course of a single pixel. Say the center pixel, i.e. row 60 and
% col 30, and all the time points. Let's store this time course in a separate 
% variable, call it tc.

tc=dat(60,30,:);

% Then try to plot it.

figure;plot(tc)

% Notice that you get an error saying "Data cannot have more than 2 dimensions."
% What's going on?  When you index a multidimensional matrix, in this case
% 3D, and assign the result to a new variable the number of dimensions
% remains the same. Let's investigate using the size function.
% Try and compare:

size(dat)
size(tc)

% Each result has 3 values indicating 3 dimensions: rows, columns, and time points.  
% Notice that size(dat) shows that dat has 128 rows, 128 cols, and 108 time 
% points while size(tc) shows 1 row, 1 col, and 108 time points which is what
% we asked for, the time course of single pixel.

% The trouble is that the dimensionality is preserved. tc is 3D and the plot
% function is expecting a 2D variable only (a single row or column).  

% This is a good time to introduce the squeeze function. This is a built-in matlab
% function which is essential in these circumstances, i.e. when you need to
% reduce the dimensionality of a variable in order to make use of other
% functions like plot in this case.

% Try:

tc=squeeze(tc);

% then check:

size(tc)

% The rows and columns are gone and we have pixel intensity at each time point.
% Note that the matrix is 108x1; matlab doesn't truly have 1d matrices, it's
% either a row 1xn or a column nx1. This is normal.

% Back to the plot, which should work now.

figure;plot(tc)

% Examine the plot. The curve mainly trends down. This is due to bleaching
% of the voltage sensitive dye. Bleaching refers to a photochemical 
% reaction of the dye while it is in an excited state before fluorescing. Once
% bleached, the molecule is no longer fluorescent so the prep gets dimmer as
% time goes on. Notice the small bump in the curve after timepoint 31 or
% so. This is the response to the stimulus. It is small and difficult to
% make out against the background bleaching. This is why we collect
% alternating stim and no-stim stacks. We will use the no stim stacks to
% normalize and account for the bleaching.  After that we will then
% calculate the change in fluorescence with respect to the baseline
% (pre-stim). This is the so-called delta F over F (DFF).


% 2.  Let's divide the task up into a few different steps.

% I. Defining variables
% II. Reading in all the data from the files using a loop.
% III. Normalizing the stim by no-stim trials.
% IV. Calculate the DFF.
% V. Average over trials.

% At each step we will try to use figures to check our progress.

% I. We have already defined pathname and nFrames, so let's make a variable for
% number of trials. Call it nTrials and assign it the value of 5. Let's
% also create one for the stimulation time point, call it t_stim and assign it 31.
% This was set during the image acquistion by the experimenter. There is
% no way to get it from the data after the fact. Also assign s the
% size(dat). This will be useful when defining matrices to hold the data.

pathname='/Volumes/Unimatrix6/MATLAB tutorial/Matlab Tutorial C6/VSD_data/';
nFrames=108;
nTrials=5;
t_stim=31;
s=size(dat);

% Using the zeros function, define two arrays called stim and nost to store 
% the data from the tif files. Think about what size they need to be.
% Recall there are 5 trials, and each stack is 128x128x108. Use the
% variable names and elements of s where possible.

stim=zeros(nTrials,s(1),s(2),s(3));
nost=zeros(nTrials,s(1),s(2),s(3));

% II. We will desgin a loop to read in the data in the files. The files are
% named sequentially which means we can use a strategy similar to the text
% files we used in a previous tutorial.

% First, set up the basic structure of the for loop. Use i as your loop
% variable and make the loop start at 1 and go to nTrials.

for i=1:nTrials
end

% Within the loop set up two string variables. One for the stim file
% names, call it file_stim. One for the no stims, file_nost.  Assign each
% the needed string by concantenating the first part of the file name
% (either hi or no), the loop variable converted to string by the num2str
% function, and the file extension (.tif).

for i=1:nTrials
    file_stim=['hi' num2str(i) '.tif' ];
    file_nost=['no' num2str(i) '.tif' ];
end

% Now add commands to read in the data using imreadalltiff in analgous
% fashion to above. Remember to concatenate the path using square brackets.
% Read the data into temporary variables called dat1 and dat2 for
% example.

for i=1:nTrials
    file_stim=['hi' num2str(i) '.tif' ];
    file_nost=['no' num2str(i) '.tif' ];
    disp(['      >> Reading in: ' file_stim])
    dat1=imreadalltiff([pathname file_stim],nFrames);
    disp(['      >> Reading in: ' file_nost])
    dat2=imreadalltiff([pathname file_nost],nFrames);
end

% Note that the disp is not required; it is just nice to have a progress
% update in some cases.

% The final step is to index the large matrices we made, stim & nost, 
% to store the data loaded into the tmp variables dat1 and dat2.
% Remember that the larger matrices have 5 spaces for 128x128x108. 

for i=1:nTrials
    file_stim=['hi' num2str(i) '.tif' ];
    file_nost=['no' num2str(i) '.tif' ];
    disp(['      >> Reading in: ' file_stim])
    dat1=imreadalltiff([pathname file_stim],nFrames);
    disp(['      >> Reading in: ' file_nost])
    dat2=imreadalltiff([pathname file_nost],nFrames);
    stim(i,:,:,:)=dat1;
    nost(i,:,:,:)=dat2;
end

% Before we move on, make figures of some of the individual frames using
% imagesc, just to make sure that stim and nost are filled in.

figure;imagesc(squeeze(nost(3,:,:,38)))
figure;imagesc(squeeze(stim(1,:,:,35)))

% This is another time where we need to use squeeze. imagesc expects either
% a nxmx1 or nxmx3 matrix. Indexed versions of our stim and nost will be
% 1x128x128x1 unless we use squeeze.

% III. In the next step, we will use nost to normalize stim to account for
% bleaching of the dye.

% First, set up a variable called norm_st using zeros with the same number of
% dimensions and sizes of the dimensions as stim and nost.

norm_st=zeros(nTrials,s(1),s(2),s(3));

% or, if you'd like to make use of size again:

norm_st=zeros(size(stim));

% Next, set up the basic structure of a loop again. Use i as your loop
% variable and make the loop start at 1 and go to nTrials.

for i=1:nTrials
end

% Since we are going to be normalizing stim with no stim and we saw before
% that our signal is quite small, we can expect the result to be nearly
% flat and have a value around 1.  If we want the baseline values (prior to
% the stim) to reflect the raw fluorescence values before bleaching we need
% to estimate and keep track of the baseline of each curve.

% Inside your loop, index nost with the loop variable (ie trial number), all
% rows and columns of pixels and time points beginning from 1 and going to
% t_stim (i.e. the baseline). Assign this to a matrix called baseline.
% Compute the mean on the fourth index and assign to baseline again. This
% is the mean of the baseline and we will use it to scale our curves after
% normalization.

for i=1:nTrials 
    baseline=nost(i,:,:,1:t_stim);
    baseline=mean(baseline,4);
    disp(['      >> Computing basline trial #: ' num2str(i)])
end

% Again the disp is not required.

% Next we need to fill in all the values of norm_st with stim/no_stim for 
% every time point. One way to do this is by using another for loop 
% inside our nTrials loop after we calculate the baseline mean.
% This is called a nested loop. Let's begin by make the basic structure of
% a loop, this time within our main loop. Make the loop variable j and
% start it at 1 and go to nFrames (i.e. the maximum timepoint).

for i=1:nTrials 
    baseline=nost(i,:,:,1:t_stim);
    baseline=mean(baseline,4);
    disp(['      >> Computing basline trial #: ' num2str(i)])

    for j=1:nFrames
    end
    
end

% Now within the nFrames inner loop, assign nost the value of stim/no_stim.
% This requires indexing with the two loop variables.  You want the i
% trial, all the rows and colums of pixels, and the j time point.  Use ./
% instead of simply / to tell matlab to divide each corresponding pixel in
% the stim and nost images.

for i=1:nTrials 
    baseline=nost(i,:,:,1:t_stim);
    baseline=mean(baseline,4);
    disp(['      >> Computing basline trial #: ' num2str(i)])

    for j=1:nFrames
        norm_st(i,:,:,j)=stim(i,:,:,j)./nost(i,:,:,j);
    end
    
end

% Now all that remains is to multiply by the baseline we computed in the
% outer loop. You can add this mulitplication to the exising line or do it
% on a separate line to make it extra clear.

for i=1:nTrials 
    baseline=nost(i,:,:,1:t_stim);
    baseline=mean(baseline,4);
    disp(['      >> Computing basline trial #: ' num2str(i)])

    for j=1:nFrames
        norm_st(i,:,:,j)=stim(i,:,:,j)./nost(i,:,:,j);
        norm_st(i,:,:,j)=norm_st(i,:,:,j).*baseline;
    end
    
end

% Again check a couple frames in norm_st to make sure it is filled in.

figure;imagesc(squeeze(norm_st(3,:,:,79)))

% Another good thing to check is to pull out the time course of single
% pixel again and plot. As we did above. Remember to squeeze before
% plotting.

tc=squeeze(norm_st(1,60,30,:));

figure;plot(tc)

% Is the bleaching gone? Stimulus response more obvious?

% IV. Now we need to calculate DFF. This is the fractional change in the
% normalized fluorescence, i.e. norm_st. So we will need to compute the value
% of norm_st minus baseline divided by baseline. Multiply the result by
% 100%. This can be achieved by a loop exactly analogous to the one for
% normalization.

% First define a matrix to store the result. Call it dff. It needs to have
% the same size as norm_st.

dff=zeros(size(norm_st));

% Modify the nested loop: this time, the baseline is calculated from norm_st
% and the arithmetic in the inner loop over timepoints does the fractional 
% change and multiplication by 100 storing the results in dff. The 
% indexing is the same.   

for i=1:nTrials 
    baseline=norm_st(i,:,:,1:t_stim);
    baseline=mean(baseline,4);
    disp(['      >> Computing basline trial #: ' num2str(i)])

    for j=1:nFrames
        dff(i,:,:,j)=(norm_st(i,:,:,j)-baseline)./baseline;
        dff(i,:,:,j)=dff(i,:,:,j).*100;
    end
    
end

% Finally, take the mean over trials and squeeze away the trial dimension,
% assigning the result to dff again.

dff=squeeze(mean(dff,1));

% Make a figure of  the 35th timepoint using imagesc.

figure;imagesc(squeeze(dff(:,:,35)))

% See the response?

% This code will output the data so it can be read into imagej.

fid=fopen('VSD_HL_example.raw','w','b');
fwrite(fid,dff,'float32');
fclose(fid);
