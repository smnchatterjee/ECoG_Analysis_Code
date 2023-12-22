% function my_plot_updated_baseline_degradation(data1,data2,data3)
% Author        :   Rathin K. Joshi
% Date          :   May 2023
% Function      :   my_plot_updated_baseline_degradation.
% Description   :   Plots RMS values of a three inputs and shows chronic
%                   Baselnine Degaradataion.
% Parameters    :   None
% Return        :   Chronic Baseline Plots for three different baselines.

function my_plot_updated_baseline_degradation(data1,data2,data3)
tic
close all

% Different Colors for Chronic Baselines traces
c1=[0 114 160]/255;
c2=[0 171 240]/255;
c3=[115 215 255]/255;

% Calculate the RMS values for three input baselines
rms1=rms(data1);
rms2=rms(data2);
rms3=rms(data3);
rms_combined=[rms1; rms2; rms3];

f = figure('WindowState','maximized');
pause(1);
ba=bar(rms_combined','FaceColor','flat');
ba(1).FaceColor=c1;
ba(2).FaceColor=c2;
ba(3).FaceColor=c3;
ba(1).LineWidth=1;
ba(2).LineWidth=1;
ba(3).LineWidth=1;
ba(1).EdgeColor='b';
ba(2).EdgeColor='b';
ba(3).EdgeColor='b';
xlabel('Channel Number')
ylabel('Averaged RMS Value (\muV)')
legend('Day2 Baseline','Day4 Baseline','Day6 Baseline','Location','southoutside','NumColumns',3)
ylim([0 22]) % Set the Y Axis Limit
xticks(1:1:10);
yticks(0:5:20);
title('Rat: Baseline Degradation');
set(gca,'FontSize',27,'FontName','Georgia','LineWidth',3,'TickLength',[0.01 0.01],'color','w')
set(gcf, 'units','normalized','outerposition',[0 0 1 1],'color','w');
toc
