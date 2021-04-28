%% Loads salinity and temp data, despikes and plots
% input   raw_sal_temp.mat
% output  sal_temp_proc.mat
% figures salinity&tempnodaily.png
% notes: from saltemp.VarName12 to saltemp.VarName14 excluded

close all
clear 
clc
%% load raw data

load gitdata.mat

%% extract time
% why is it on multiple columns?

time_raw=sample.Salinit;
ind=isnat(time_raw);
time1=datenum(time_raw(~ind));
clear ind
clear time_raw

time_raw=sample.Temperatura;
time2=datenum(time_raw);
clear time_raw

%% extract salinity and temperature
salinity1=sample.VarName3;      %already every ~2 hrs
temperature1=sample.VarName4;   %already every ~2 hrs
temperature2=sample.VarName10;  %every half hour --> half smoothing window 2  

%% normalise and smooth data (remove circadian cycle)
% if delta time is 2 hours
% 12 datapoints in one day so 6 is the half window

salinity1_nm=normalize(salinity1);
salinity1_sm=nanmoving_average(salinity1_nm,6);

temperature1_nm=normalize(temperature1);
temperature1_sm=nanmoving_average(temperature1_nm,6);

temperature2_nm=normalize(temperature2);
temperature2_sm=nanmoving_average(temperature2_nm,24);

%% plots
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

ind=isnan(salinity1);

p1=plot(time1(~ind),temperature1_sm(~ind),'Color','b','linewidth',1.5);
grid on
hold on
p2=plot(time1(~ind),salinity1_sm(~ind),'Color','g','linewidth',1.5);
hold on

clear ind

set(gca, 'xtick', []);
datetick('x','dd-mmm-yy HH:MM','keeplimits')
% xo=get(gca,'XTick');
% xn=xo(1):2:xo(end);
% set(gca,'XTick',xn);
%axis tight

set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Salinity and Temperature - Daily Cycle','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Salinity (PSU) & Temperature (°)','fontsize',14,'fontweight','bold');

% legend([p1,p2,p3,p4], 'Temperature1','Salinity','Temperature2 normalised','Temperature 2 smoothed');
legend([p1,p2], 'Temperature','Salinity','location','best');


set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','salinity&tempnodaily.png')

clear ah p* xn xo

%%  
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

ind=isnan(salinity1);

p1=plot(time1(~ind),temperature1_nm(~ind),'Color','b','linewidth',1.5);
grid on
hold on
p2=plot(time1(~ind),salinity1_nm(~ind),'Color','g','linewidth',1.5);
hold on

clear ind


set(gca, 'xtick', []);
datetick('x','dd-mmm-yy HH:MM','keeplimits')

% datetick('x','dd-mm','keeplimits')
% xo=get(gca,'XTick');
% xn=xo(1):2:xo(end);
% set(gca,'XTick',xn);

axis tight

set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Salinity and Temperature - Normalised','fontsize',14,'fontweight','bold');

xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Salinity (PSU) & Temperature (°)','fontsize',14,'fontweight','bold');

legend([p1,p2], 'Temperature','Salinity','location','best');

set(gcf,'PaperPositionMode','auto')

%print('-dpng','-r600','salinity&temp.png')
clear ah p* xn xo

%save saltemp_proc
