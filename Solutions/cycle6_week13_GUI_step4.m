function cycle6_week13_GUI
%function to demo GUI for matlab tutorial.

f = figure('Position',[360,500,450,285]);

hload=uicontrol('Style','pushbutton','String','Load','Position',[315,220,70,25],'callback',@load_callback);


    function load_callback( source,eventdata )
        disp('Load button pressed')
    end

end

