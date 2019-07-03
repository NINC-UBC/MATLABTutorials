function cycle6_week13_GUI
%function to demo GUI for matlab tutorial.

f = figure('Position',[360,500,450,285]);
tc=zeros(108,1);

hload=uicontrol('Style','pushbutton','String','Load','Position',[315,220,70,25] ...
    ,'CreateFcn',@load_callback,'callback',@load_callback);

ha = axes('Units','pixels','Position',[50,60,200,185]);
plot(tc)

hplot=uicontrol('Style','pushbutton','String','Plot','Position',[315,180,70,25],'callback',@plot_callback);

hcalc=uicontrol('Style','pushbutton','String','Calc','Position',[315,140,70,25],'callback',@calc_callback);

    function load_callback( source,eventdata )
        if ~isempty(eventdata) & strcmp(eventdata.EventName,'Action')
            disp('Load button pressed')
        end
        [FileName,PathName] = uigetfile('*.mat','Select the .mat file with time course');
        disp(['Loading: ' PathName FileName])
        load([PathName FileName],'trace')
        tc=trace;
    end

    function plot_callback( source,eventdata )
        disp('Plot button pressed')
        plot(tc)
    end

    function calc_callback( source,eventdata )
        disp('Calc button pressed')
    end

end

