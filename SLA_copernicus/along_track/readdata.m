%Read netcdf

% note that the 'ncread' function already applies attributes and fill
% values

sla_filtered=ncread('nrt_med_j3_phy_assim_l3_20190331_20190421.nc','sla_filtered');
time=ncread('nrt_med_j3_phy_assim_l3_20190331_20190421.nc','time');
final_time = double(time + datenum('01-01-1950 00:00:00'));
save read_data0

tmp2=squeeze(wave_significantH);
mean_wave=nanmean(tmp2,3);

% plot

ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 900 800],'visible','on');%[x y width height]

p=pcolor(longitude,latitude,wave_significantH');shading interp
colorbar
caxis([1 7])
colormap(jet)

set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Global Wind Speed (m/s)','fontsize',14,'fontweight','bold');
xlabel('Longitude','fontsize',14,'fontweight','bold');
ylabel('Latitude','fontsize',14,'fontweight','bold');
set(gcf, 'PaperPositionMode', 'auto');

print('-dpng','-r600','wave_map.png')