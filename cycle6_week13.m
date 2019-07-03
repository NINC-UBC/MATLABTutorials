% This week's tutorial demonstartes how to make a graphical user interface
% (GUI, pronounced gooey) for your program. GUI are implemented inside
% functions and the user interface controls (buttons and such) live inside a
% matlab figure window. In matlab, GUI's can be create using matlab's GUI
% tool called GUIDE or programmatically. We will use the programmatic
% approach here.

% An online example is here:
% https://www.mathworks.com/help/matlab/creating_guis/about-the-simple-programmatic-gui-example.html

% We will build up the GUI in a series of steps. This file outlines the
% steps and you will build your GUI function in another file in the editor.
% I have provided .m files for each step so if you need to see what the
% code should look like at any step, just open the appropriate .m file.

% Step 1: Use New>function to create a new editor file with a function
% template. Modify the function definition in line 1 to give the function
% the name cycle6_week13_GUI. We will not use input or output arguments
% for our function so these can be removed. Save the function in a .m
% file. Recall from our tutorial on functions that in matlab functions
% must be saved in .m files where the filename corresponds to the function
% name.

% Step 2: Next we need to create a figure window. The GUI elements
% (buttons, etc.) will be within the figure window.

% Add this line to your function.

f = figure('Position',[360,500,450,285]); % Note the units of position are pixels.

% It create a figure window. Position defines where the GUI figure pops up
% on your screen and its size [distance from left, distance from bottom, 
% width, height]. Notice that we assign the result of the figure command to
% a variable. Normally we do not do this when plotting graphs or images
% but here it is useful. Figures are objects the properties of which can
% be changed programmatically using dot notation as we saw for other objects
% in week 12.

% Run your function in the command line. You should see a figure window pop
% up with nothing in it.

% Step 3: We now use matlab's built-in uicontrol function to add the
% different elements we want the user to interact with to the figure
% window.

% Our GUI will be used to make an interface for the responds function that
% we made in week 9. The first control we need is a button. This button
% will be used to pick the file to load.

% Add this command to your function:

hload=uicontrol('Style','pushbutton','String','Load','Position',[315,220,70,25]);

% Just like the figure, the uicontrol is an object. By assigning the
% result to hload we can manipulate the control later using dot notation.
% Note the position of the button is specified in pixels: [distance from 
% left, distance from bottom, width, height]. Same idea as for the figure,
% but instead of relative to the screen it is relative to the figure
% itself.

% Step 4: At this point we have a button but it doesn't do anything.  The
% action performed by the button press is controlled by another function
% called a callback.

% Define a function called load_callback within your function like so:

    function load_callback( source,eventdata )
        disp('Load button pressed')
    end
    
% Note that indenting helps keep things easy to read.

% Next add an option to your button definition to specify the callback.

hload=uicontrol('Style','pushbutton','String','Load','Position',[315,220,70,25],'callback',@load_callback);

% Note that the input args to load_callback are required. They are
% explained a bit here:

% https://www.mathworks.com/help/matlab/creating_guis/write-callbacks-using-the-programmatic-workflow.html

% Now run your function. Note that when you press the button, the message
% in the disp command is printed to the command window. This is a place
% holder for the intended functionality.

% Step 5: Let's make our callback function do something more like what we
% intended. Use uigetfile within your callback to have the load button pop
% up a window to select a single .mat file. Our target will be week9.mat
% which has variable trace in it. This was our voltage sensitive dye
% response to sensory stimulation that we worked with in week 9 using the
% function responds.m.

% Use the output of uigetfile (i.e., path and filename info) as the input to
% load to read in the data. Note that unless you specify the variable name in
% the load function (or assign the output to another variable) you will get
% a message like:
% Error using load
% Attempt to add "trace" to a static workspace.

% You can add another disp to inform the user via the command window which
% file is being loaded and even pop up a separate figure window to check
% that the trace looks ok.  

% Run your function!

% Step 6: You may notice that your callback does not have an output
% argument. There are many ways to share data amongst the different parts
% of an app. Useful info here:

% https://www.mathworks.com/help/matlab/creating_guis/share-data-among-callbacks.html

% We will take advantage of the simple fact that variables created in the
% main function are accessible to all the sub-functions. Create a variable
% tc in the main function (initialize using zeros and make the size 108x1).

% Within your load callback assign trace to tc, i.e.:

tc=trace;

% Two more small tweaks are needed. Add another property called CreateFcn
% to your hload uicontrol definition so that the function runs as soon as 
% the button is created as well.

hload=uicontrol('Style','pushbutton','String','Load','Position',[315,220,70,25] ...
    ,'CreateFcn',@load_callback,'callback',@load_callback);

% Since this function is now used for two purposes, you can use eventdata to
% figure out if it is a button press or the initial data load on creation
% and print the button press message when appropriate. Like so:

        if ~isempty(eventdata) & strcmp(eventdata.EventName,'Action')
            disp('Load button pressed')
        end

% On creation there is no event, so event data is empty. If the button is 
% pressed, then the eventdata is present and the event name is set to Action.

% So at this point if you plot tc from your main function you will see the
% time course as expected.

% Step 7: We don't really want tc plotted in a separate figure window, we
% would like a plot axes within our GUI. Do this by placing an axis within
% the figure and then the usual plot command immediately after the hload
% uicontrol definition.

ha = axes('Units','pixels','Position',[50,60,200,185]);
plot(tc)

% Additionally, if new data is loaded we need a way to plot it. Add
% another button. Assign the result of your uicontrol function call to
% hplot. This one does not need a createfcn just a callback. Write a
% placeholder callback that just displays a message in the command window if
% the button is pressed. Make the text on the button 'Plot'.

% Step 8: Modify your callback to update the plot by plotting tc from
% within the callback. There is another .mat file called week13.mat which
% contains a very different looking trace. Load week9.mat initially
% then press load again and load week13.mat. Test your plot button, if it
% works, the plot should update with the new curve.

% Step 9: Add another button and placeholder callback. This time the button
% should be named calc.

% Step 10: Modify calc callback to call responds. Add a variable in your
% main function for the input, i.e. res=0; for the stim time, i.e. st=31;
% and for the number of standard deviations, i.e. num_std=2.


