classdef bar2plot
    %class to make all the bar graph stuff easier.
 
properties
   Data;%the numbers
   a;%the average value for plotting
   err;%the SEM
end
 
methods
  function obj=bar2plot(DataToStore)
     obj.Data=DataToStore;
     obj.a=mean(DataToStore);
     obj.err=std(DataToStore)/sqrt(numel(DataToStore));
  end
 
  function View(obj)
     figure();
     barwitherr(obj.err, obj.a);
  end

end
 
end