%% Loads awac wave data, despikes and plots
% input awac_wave.mat
% output awac_wave_proc.mat
% figures  -tps.png
%          -hsdt.png
%          -dirtps.png
% 
%        


clear  
close all
clc

%% data
load awac_wave

% set time
day=cellstr(awac_wave.Data);
day=cellstr(day);

time=cellstr(awac_wave.Ora);
time=cellstr(time);
timec=strcat(day,{' '},time);

clear day time

formatIn1='dd/mm/yyyy HH:MM';
timen=datenum(timec, formatIn1);

% smoothing
hss= nanmoving_average(awac_wave.Hm0-nanmean(awac_wave.Hm0),12);
tps= nanmoving_average(awac_wave.Tp-nanmean(awac_wave.Tp),12);
dirtps= nanmoving_average(awac_wave.DirTp-nanmean(awac_wave.DirTp),12);

%%
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,(awac_wave.Hm0-nanmean(awac_wave.Hm0)));
hold on
plot(timen,hss,'r','linewidth',2);

grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('AWAC Significant Hight Detrended','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Hs (m) ','fontsize',14,'fontweight','bold');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','hsdt.png')

clear ah
close
%%

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,(awac_wave.Tp-nanmean(awac_wave.Tp)),'g');
hold on
plot(timen,tps,'k','linewidth',2);

grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('AWAC Peak Period Detrended','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Tp (s) ','fontsize',14,'fontweight','bold');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','tps.png')

clear ah
close
%%

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,(awac_wave.DirTp-nanmean(awac_wave.DirTp)),'g');
hold on
plot(timen,dirtps,'k','linewidth',2);

grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('AWAC Peak Direction Detrended','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Direction Tp (deg) ','fontsize',14,'fontweight','bold');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','dirtps.png')

clear ah
close
%save awac_wave_proc
