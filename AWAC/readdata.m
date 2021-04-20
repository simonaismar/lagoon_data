%% Loads awac data, despikes and plots
% input awac.mat
% output awac_proc.mat
% figures  -awac_depthnm.png
%          -awac_depthdt.png
%          -comp_t_a_r.png
% notes: awac.TOTALLEVELdetrended and awac.RESIDUALLEVELdetrended
%        are the other way around.   

%% data
load('awac.mat')

% detrend
depthdt=awac.depth-mean(awac.depth);
%depthdt2=detrend(awac.Depth);

% normalise
depthnm=normalize(awac.depth);

% the processed data have spikes so

sshtdt=awac.TOTALLEVELdetrended;
astrodt=awac.ASTRONOMICLEVELdetrended;
sshrdt=awac.RESIDUALLEVELdetrended;

for kk=1:size(awac,1)
    
if  abs(sshtdt(kk))>=2
    sshtdt(kk)=NaN;
    
elseif    abs(astrodt(kk))>=2
          astrodt(kk)=NaN;
    
end

end

clear kk

%% format time

formatIn1='mm/dd/yyyy HH:MM:SS'; 


% discontinuities 643  1219 2131 2707 3619

t1=datenum(awac.date(1), formatIn1);
t2=datenum(awac.date(2), formatIn1);
delta_time=t2-t1;
timen=NaN*(1:3836)';
timen(1)=t1;
for jj=1:3835
    timen(jj+1)=timen(jj)+delta_time';
end

clear t1 t2 formatIn1  jj delta_time

%% Figures

%detrended data plot

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,depthdt,'k','linewidth',2)
grid on
datetick('x','dd-mm','keeplimits')

set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('Awac Depth Detrended','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Depth (m)','fontsize',14,'fontweight','bold');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','awac_depthdt.png')

clear ah
% normalised data plot

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,depthnm,'r','LineWidth',2)
grid on
title('Awac Depth Normalised','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')

set(gca,'fontsize',14)
set(gca,'fontweight','bold')
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('Depth (m)','fontsize',14,'fontweight','bold');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','awac_depthnm.png')

clear ah

% comparison data plot

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

hold on
ap=plot(timen,astrodt,'m','linewidth',.7);
hold on
srp=plot(timen,sshrdt,'c','linewidth',.7);
hold on
stp=plot(timen,sshtdt,'k','linewidth',2);

%spp=plot(timen,seapressurenm,'r');
grid on
datetick('x','dd-mm','keeplimits')

set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Awac','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('SSH (m)','fontsize',14,'fontweight','bold');

legend([stp,ap,srp], 'Residual','Astronomic','Total');

set(gcf,'PaperPositionMode','auto')
print('-dpng','-r600','comp_t_a_r.png')


clear ah ap srp stp ans
%% remove daily cycle
residual_ssh_sm=nanmoving_average(sshtdt,24);

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 1000 500],'visible','on');

plot(timen,sshtdt,'linewidth',2,'Color',[.59 .59 .59])
hold on
plot(timen,residual_ssh_sm,'r','linewidth',2);

grid on

datetick('x','dd-mm','keeplimits')
set(gca,'fontsize',14)
set(gca,'fontweight','bold')

title('AWAC Circadian Cycle Removal','fontsize',14,'fontweight','bold');
xlabel('Time (dd-mm)','fontsize',14,'fontweight','bold');
ylabel('SSH (m) ','fontsize',14,'fontweight','bold');
legend('SSH','SSH - Daily Cycle');

set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','circadian.png')

clear ah 
save awac_proc
