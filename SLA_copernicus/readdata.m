%% Read netcdf

% input: dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc
% output: read_data_l4
% figures: sla_map_focus.png
%          sla_coor.png
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%           
            
% note that the 'ncread' function already applies attributes and fill
% values

sla=ncread('dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc','sla');
longitude=ncread('dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc','longitude');
latitude=ncread('dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc','latitude');
time=ncread('dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc','time');
final_time = double(time + datenum('01-01-1950 00:00:00'));
sla_awac=sla(68,32,:);
sla_tide=sla(69,31,:);
save read_data_l4


%% plot map

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 900 800],'visible','on');%[x y width height]

pcolor(longitude,latitude,sla(:,:,1)')
shading interp
hold on
plot(med_coastline(:,1),med_coastline(:,2),'color','k','Linewidth',2)

colorbar
caxis([0.1 0.25])
colormap(jet)
axis([1 15 36 46]); dasp(40);
%axis([8 8.9 39.5 40.1]); dasp(39.8);

set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('SLA (m)','fontsize',14,'fontweight','bold');
xlabel('Longitude','fontsize',14,'fontweight','bold');
ylabel('Latitude','fontsize',14,'fontweight','bold');
set(gcf, 'PaperPositionMode', 'auto');

%print('-dpng','-r600','sla_map_focus.png')
clear ah

%% plot timeseries
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 900 800],'visible','on');%[x y width height]

plot(final_time,squeeze(sla_tide),'m','Linewidth',2)
hold on
plot(final_time,squeeze(sla_awac),'k','Linewidth',2)

grid on

legend('SLA AWAC','SLA Tide Gauge');
xlabel('SLA (m)','fontsize',14,'fontweight','bold');
ylabel('Time','fontsize',14,'fontweight','bold');
datetick('x','dd-mm','keeplimits')
set(gca,'fontweight','bold')
set(gca,'fontsize',14)
set(gcf,'PaperPositionMode','auto')
% print('-dpng','-r600','sla_coor.png')
% crop('sla_coor.png')
