%% Loads awac wave data, despikes and plots
% input sample.mat
% output sample_proc.mat
% figures  -tps.png
%          -hsdt.png
%          -dirtps.png
% 
%        


clear  
close all
clc

%% data
load gitdata.mat

% set time
day=cellstr(sample.Data);
day=cellstr(day);

time=cellstr(sample.Ora);
time=cellstr(time);
timec=strcat(day,{' '},time);

clear day time

formatIn1='dd/mm/yyyy HH:MM';
timen=datenum(timec, formatIn1);

% smoothing
hss= nanmoving_average(sample.Hm0-nanmean(sample.Hm0),12);
tps= nanmoving_average(sample.Tp-nanmean(sample.Tp),12);
dirtps= nanmoving_average(sample.DirTp-nanmean(sample.DirTp),12);

%%
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,(sample.Hm0-nanmean(sample.Hm0)));
hold on
plot(timen,hss,'r','linewidth',2);

grid on
set(gca, 'xtick', []);

datetick('x','dd-mmm-yy HH:MM','keeplimits')
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

plot(timen,(sample.Tp-nanmean(sample.Tp)),'g');
hold on
plot(timen,tps,'k','linewidth',2);

grid on

set(gca, 'xtick', []);

datetick('x','dd-mmm-yy HH:MM','keeplimits')
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

plot(timen,(sample.DirTp-nanmean(sample.DirTp)),'g');
hold on
plot(timen,dirtps,'k','linewidth',2);

grid on

set(gca, 'xtick', []);

datetick('x','dd-mmm-yy HH:MM','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('AWAC Peak Direction Detrended','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Direction Tp (deg) ','fontsize',14,'fontweight','bold');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','dirtps.png')

clear ah
close
save awac_wave_proc
