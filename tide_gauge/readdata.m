%% Loads tide gauge data, despikes and plots

% input tidelagoon.mat
% output tidelagoon_proc.mat
% figures  -comp_t_a_rpng
%          -depthdt_detrended.png
%          -comp_t_a_r.png
%          -circadian_temp.png
%          -circadian_ssh.png

% notes: the variable names from the excel are messed up
%        tidelagoon.TOTALLEVELdetrended = sshtdt
%        tidelagoon.RESIDUALLEVELdetrended = astrodt
%        tidelagoon.ASTRONOMICLEVELdetrended = sshrdt

%% data
load('gitdata.mat')

% format time
formatIn='dd/mm/yyyy HH:MM:SS'; 
timen=datenum(tidelagoon.Timestamp, formatIn);

% detrend
depthdt=tidelagoon.Depth-mean(tidelagoon.Depth);
seapdt=tidelagoon.SeaPressure-mean(tidelagoon.SeaPressure);
SSPdt=tidelagoon.Pressure-mean(tidelagoon.Pressure);
tempdt=tidelagoon.Temperature-mean(tidelagoon.Temperature);

%depthdt2=detrend(tidelagoon.Depth);

% normalise
depthnm=normalize(tidelagoon.Depth);
tempnm=normalize(tidelagoon.Temperature);
seapressurenm=normalize(tidelagoon.SeaPressure);

% despike 
sshtdt=tidelagoon.TOTALLEVELdetrended;
astrodt=tidelagoon.ASTRONOMICLEVELdetrended;
sshrdt=tidelagoon.RESIDUALLEVELdetrended;

for kk=1:size(tidelagoon,1)
if  abs(sshtdt(kk))>=2
    sshtdt(kk)=NaN;
end
if  abs(astrodt(kk))>=2
    astrodt(kk)=NaN;
end
if  abs(sshrdt(kk))>=2
    sshrdt(kk)=NaN;
end
end

clear kk formatIn

%% remove circadian cycle
residual_ssh_sm=nanmoving_average(astrodt,24);
temp_sm=nanmoving_average(tempnm,24);

%% measured data plots

if 0
figure
plot(timen,depthdt,'k')
grid on
title('Tide Gauge Depth dt','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')

figure
plot(timen,tidelagoon.Temperature,'b')
grid on
title('Tide Gauge Temperature','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')

figure
plot(timen,tidelagoon.Depth,'m')
grid on
title('Tide Gauge Depth','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')

figure
plot(timen,tidelagoon.SeaPressure,'r')
grid on
title('Tide Gauge Sea Pressure','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')


%% normalised plots

figure
plot(timen,depthnm,...
'-ko',...
    'LineWidth',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0     1     0],...
    'MarkerSize',3)
grid on
title('Tide Gauge Depth Normalised','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')

figure
plot(timen,tempnm,...
    '-bo',...
    'LineWidth',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0     1     0],...
    'MarkerSize',3)
grid on
title('Tide Gauge Temperature Normalised','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')


figure
plot(timen,seapressurenm,...
    '-ro',...
    'LineWidth',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0     1     0],...
    'MarkerSize',3)
grid on
title('Tide Gauge Sea Pressure','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')
end

%% compare depth and temp normalised
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

dp=plot(timen,depthnm,'k');
hold on
tp=plot(timen,tempnm,'m');
hold on
%spp=plot(timen,seapressurenm,'r');
grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Tide Gauge Normalised','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Depth (m) & Temperature (C°) ','fontsize',14,'fontweight','bold');
legend([dp,tp], 'Depth','Temperature');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','comp_t_d.png')

close;
clear ah dp tp
%% compare depth and temp residual normalised

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

stp=plot(timen,sshtdt,'c','linewidth',.7);
hold on
ap=plot(timen,astrodt,'k','linewidth',2);
hold on
srp=plot(timen,sshrdt,'y','linewidth',.7);
hold on
%spp=plot(timen,seapressurenm,'r');
grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Tide Gauge Normalised','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('SSH (m) ','fontsize',14,'fontweight','bold');
legend([stp,ap,srp], 'Total','Residual','Astronomic');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','comp_t_a_r.png')
close;

clear ah ap srp stp

%% plot circadian ssh

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

p1=plot(timen,astrodt,'linewidth',2,'Color',[.59 .59 .59]);
hold on
p2=plot(timen,residual_ssh_sm,'r','linewidth',2);

grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Tide Gauge Circadian Cycle Removal','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('SSH (m) ','fontsize',14,'fontweight','bold');
legend('SSH','SSH - Daily Cycle');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','circadian_ssh.png')

close;
clear ah 
%% plot temperature circadian
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');
hold on
p3=plot(timen,tempnm,'linewidth',2,'Color',[.90 .80 .59]);
hold on
p4=plot(timen,temp_sm,'linewidth',2,'Color','b');

grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Tide Gauge Circadian Cycle Removal','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Temperature (C°) ','fontsize',14,'fontweight','bold');
legend('Temperature','Temperature - Daily Cycle');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','circadian_temp.png')
close;

clear ah p*

%save tidelagoon_proc
