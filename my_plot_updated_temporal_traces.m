% function my_plot_temporal_traces(data,chunks)
% Author        :   Rathin K. Joshi
% Date          :   March 2023
% Function      :   my_plot_temporal_traces.
% Description   :   Plots RMS values of a three inputs and shows chronic
%                   Baselnine Degaradataion.
% Parameters    :   1. Delta (Distance between two consecutive traces)
%					2. tick_val (to Decide the tick on either side of the Y Axis. Helps in identifying scale)							
% Return        :   An image in the current folder with the name ECoG_Temproal_Trace.png.


function my_plot_updated_temporal_traces(data,chunks)
tic
close all
sr=250;

%To find out range
a=max(max(data));
b=min(min(data));
range = [(ceil(a/10)*10) (floor(b/10)*10)];
range_val= (ceil(a/10)*10)-(floor(b/10)*10);
tick_val=250; % tick_val is 250 for Epileptic Activities, 25 for Initial Baseline, and 15 for Post AED Baselines. 
delta = (range(1)-range(2))*1.25000; % Value of Delta can be automated by chaging factor as per data. Increase the value for post-AED baselines.
% delta=800; % Delta 800 for Epileptic Activities, 80 for Initial Baseline, and 60 for Post AED Baselines 

n=size(data,2);

%To plot all graphs
n_graphs=floor(n/chunks);
for z=1:n_graphs
    figure
    for i=(chunks)*(z-1)+1:(chunks)*(z)
        plot((1:max(size(data)))/sr,data(:,i)+((chunks*z-i))*delta,'LineWidth',4,'color',[0.80 0.0 0.00])
		% 
        k((3*i-1)-chunks*(z-1)) = ((chunks*z)-i)*(delta);
        k((3*i-0)-chunks*(z-1)) = ((chunks*z)-i)*(delta)- tick_val; 
        k((3*i-2)-chunks*(z-1)) = ((chunks*z)-i)*(delta)+ tick_val;

        m{(3*i-1)-chunks*(z-1)} = num2str(i);
        m{(3*i-0)-chunks*(z-1)} = [];
        m{(3*i-2)-chunks*(z-1)} = [];
        hold on
    end
    
%formatting graph
set(gca,'FontSize',25,'FontName','Georgia','LineWidth',4,'TickLength',[0.02 0.02])
xlim([0 (size(data,1))/sr])
xlabel('Time (s)','FontName','Georgia','FontSize',24)
ylim([range(2)-range_val delta*(chunks-1)+range(1)+range_val])
ylabel('Channel Number (\muV)','FontName','Georgia','FontSize',24)
% ylabel('Averaged MEA Response (\muV)','FontName','Georgia','FontSize',24)

xticks(0:10:20)
k=k(end+1-chunks*3:end);
m=m(end+1-chunks*3:end);
yticks(flip(k))
yticklabels(flip(m))
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
im_nm=strcat('ECoG_Temproal_Trace',num2str(z),'.png');
exportgraphics(gcf,im_nm,'Resolution',1000)
clear k

disp(strcat(num2str(ceil(100*z/n_graphs)),'% Done'))
end
toc
