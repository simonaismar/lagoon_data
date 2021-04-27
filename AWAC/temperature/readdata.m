
%% Loads awac temperature and pressure data, despikes and plots
% input awac_temp.mat
% output awac_temp_proc.mat
% figures  -awac_temp.png
%          


clear  
close all
clc

%% data

load ('gitdata.mat')

pressure=sample.pressure/100;
temperature=sample.temperature/100;

ind=find(pressure==0);
pressure(ind)=NaN;
temperature(ind)=NaN;

% detrend
pdt=pressure-nanmean(pressure);
tdt=temperature-nanmean(temperature);

% normalise
pnm=normalize(pressure);
tnm=normalize(temperature);

% remove circadian cycle
pc=nanmoving_average(pnm,24);
tc=nanmoving_average(tnm,24);

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timep,pc,'r','linewidth',2);
hold on
plot(timep,tc,'b','linewidth',2);

grid on

set(gca, 'xtick', []);
datetick('x','dd-mmm-yy HH:MM','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Pressure vs Temperature','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Pressure (dbar) Temperature (°C)','fontsize',14,'fontweight','bold');
legend('Pressure','Temperature');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','awac_p_vs_t.png')

clear ah ind

%save awac_temp_proc



