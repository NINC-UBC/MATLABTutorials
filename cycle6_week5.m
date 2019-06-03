% As we have been learning about matrices, strings, loops, etc we've paused
% a few times to check graphically that what we were doing made sense. In
% this tutorial we will spend more time exploring different types of plots
% and figures in MATLAB.

% Our goals are to introduce the basic plot commands (plot, bar) as well
% as imagesc and imshow which can be used to display 2D images. We will
% learn the basic commands for adding titles, labels, changing font size
% and adding legends. We will also introduce the File Exchange, which has
% user contributed code to extend MATLAB functionality (in this case of
% plotting).

% 2D line plots:

% First, let's make some data for plotting. In this case, a parabola.


% 1. Set up the x values as an ordered list. Start the list at 0, use an
% increment of 0.1 and end at 3.


% 2. Square the x values and assign the result to a new variable called y1.
% Hint: check doc .^


% When making plots you must begin by creating a figure window. Follow
% that by the plotting command.

% Try:

figure;
plot(y1);


% 3. Notice the x axis is the y1 index (1-31) replot again and make use of the
% x values. You'll need two input arguments for plot.
% Hint: check doc plot


% This is the basic 2D plot. We can add a title.

title('First plot example of a parabolic curve');

% Notice the input to the title is a string. So when we are working with
% our data, we can create titles that incorporate string variables (Such as
% the filename where the data came from).


% 4. Add the string 'x values' as an x axis label and the string 'y values'
% as a y axis label using the commands xlabel and ylabel.
% Hint: check doc xlabel & doc ylabel for info.


% MATLAB's default fontsize is often too small. People you share the plots
% with will complain.


% 5. Re-do the plot and change the fontsize of the xlabel and ylabel to
% match the title. The commands are analogous.

figure;
plot(x,y1)
title('First plot example of a parabolic curve','fontsize',20);


% What about the axis tick labels? (i.e. the numbers on the axes)

% Try:

set(gca,'FontSize',18)

% gca is short for "get current axes", think of it as returning a variable
% that contains all the properties of the axes.

% doc axes properties 

% The command above will take you to a full list. Fontsize is just one.  
% We can manipulate them via the set command.

% Another common one is to eliminate the drawing of the axis on the top and
% right-hand sides, which makes the graph look boxed-in.

set(gca,'box','off')

% Or to add gridlines:

set(gca,'xgrid','on')

% There are a lot of options, too many to go into each one.

% Let's move to the situation where you want to plot more than one curve
% together.


% 6. Create another variable called y2. Assign it the values of x raised
% to the 1.5 power instead of as we did for y1 above.


% 7. Let's begin by making a new figure window and plotting y1 vs x as we
% did above.

figure;
plot(x,y1)

% The matlab command

hold on;

% will allow you to keep the first plot while adding the next.


% 8. Plot y2 vs x isn an analogous way to y1.

plot(x,y2)

% Notice that by default MATLAB has colored the curves first y2 blue and
% then y1 red.


% Let's say we wanted it the other way around. We can add another argument
% to the plot command to indicate the color.

% Try:

figure;
plot(x,y1,'r')
hold on;
plot(x,y2,'b')

% Details are listed under linespec in the doc plot.

% For example if we wanted the red line dashed and the blue one to have
% circles marking the points:

figure;
plot(x,y1,'--r')
hold on;
plot(x,y2,'-ob')

% Now that we have two curves a legend also becomes important.

legend({'Power: 2','Power: 1.5'})

% You can move it around by setting the location:

legend({'Power: 2','Power: 1.5'},'location','northwest')

% Make it more legible by increasing the fontsize:

legend({'Power: 2','Power: 1.5'},'location','northwest','fontsize',20)

% Let's move on to an example where we would like to represent the error
% bounds of multiple measurements.

% Let's add some random noise to our parabola.
% Example: parabola with noise

y1=x.^2+.5*randn(1,numel(y1));


% 9. Plot it to see the effect of the noise.


% 10.  Create an empty variable (filled with zeros) with space for 10 
% replicates of y1 called all_y1. First, store the value 10 in a variable
% called n_reps, so we can easily change it later. Make all_y1 have 10
% columns and get the number of rows from the number of elements of y1.

all_y1=zeros(numel(y1),10);


% 11. Construct a for loop to store the result of 10 (n_reps) instances of our
% parabola with noise. These could be a signal we've measured in response
% to 10 stimuli for example. Use i as your loop variable. Start your loop variable 
% at 1 and end at n_reps (10).

for i=1:10

    all_y1(:,i)=x.^2+.5*randn(1,numel(y1));

end


% Your loop can contain 2 commands, one like the Example: parabola with
% noise above, which generates a parabola with noise, and a second which
% indexes all_y1 using the loop variable and stores the values in the 
% correct places in the larger matrix.

% Now try:

figure;plot(all_y1)

% This plots all the columns so you can see the noise.


% 12. Use the mean command to average all_y1 over the reps. Store the
% result in a variable called avg_y1.


% 13. Use the std command to calculate the standard deviation at each x
% value. Store the result in a variable called err_y1.

% Bonus: This is standard deviation, how would you get standard error of
% the mean?


% Now we can try the matlab function shadedErrorBar. This is a function
% written by a community member and shared on the file exchange.

% http://www.mathworks.com/matlabcentral/fileexchange/?term=type%3AFunction

% Use shadedErrorBar in an analogous way to plot, but with one more
% argument for the error bars.

figure;
shadedErrorBar(x,avg_y1,err_y1)

% Let's move on to bar graphs.


% 14. Make three variables called b1, b2 and b3. Assign the values 10, 5
% and 7.5.


% The matlab command for bar graphs is bar. If given a single input it
% will plot bars with the heights of the elements of the input.
% We will concatenate b1, b2, & b3 into a list using square brackets and 
% use this as the input to bar. For example, try:

figure;
bar([b1 b2 b3])

% It looks a bit ridiculous with the bars so wide, so you can give bar a
% second input to change this:

figure;
bar([b1 b2 b3], .5)

% Let's create another set of numbers representing the standard error of
% the mean for each bar.

err_b=[1, 1.5, .7];

% Now try the file exchange function barwitherr:

figure;
barwitherr(err_b, [b1 b2 b3], .5)

% Some additional code to add and manipulate labels:

Labels = {'Group1', 'Group2', 'Group3'};
set(gca,'xticklabel',[]); % Turn off the numerical labels.
xt=get(gca,'xtick'); % Get the xtick positions.
yt=-1.*ones(size(xt)); % Make some ytick positions, note negative values means 
% below x axis. Units are those of your graph.
text(xt, yt, Labels, 'horizontal', 'center', 'FontSize', 14, 'Rotation', 45)
% Use text command to write on the Labels; control centering, fontsize, and rotation.

% Lastly, displaying images.

% Load in sample_image.jpg using imread.

img=imread('sample_image.jpg');

% You can see in the workspace that img is a 833 row by 1656 column by 3
% color (RGB) channel matrix.

% You can use it directly with imagesc.

figure;imagesc(img)

% Or look at only the green channel:

figure;imagesc(img(:,:,2))

% Or use imshow:

figure;imshow(img(:,:,2))

% What are the differences?

% Bonus, how can the range of displayed grey values be changed?
