
%% Loads awac temperature and pressure data, despikes and plots
% input awac_temp.mat
% output awac_temp_proc.mat
% figures  -awac_temp.png
%          


clear  
close all
clc

%% data

load ('awac_temp.mat')

pressure=tp_alberto.pressure(2:end)/100;
temperature=tp_alberto.temperature(2:end)/100;

ind=find(pressure==0);
pressure(ind)=NaN;
temperature(ind)=NaN;
% building the time vector (it is the same as the AWAC)
% load('awac.mat')
% formatIn1='mm/dd/yyyy HH:MM:SS';
% % discontinuities 643  1219 2131 2707 3619
% t1=datenum(awac.date(1), formatIn1);
% t2=datenum(awac.date(2), formatIn1);
% delta_time=t2-t1;
% timep=NaN*(1:size(tp_alberto,1)-1)';
% timep(1)=t1;
% 
% for jj=1:(size(tp_alberto,1)-2)
% timep(jj+1)=timep(jj)+delta_time';
% end

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

datetick('x','dd-mm','keeplimits')

set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Pressure vs Temperature','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Pressure (dbar) Temperature (°C)','fontsize',14,'fontweight','bold');
legend('Pressure','Temperature');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','awac_p_vs_t.png')

clear ah ind

save awac_temp_proc



