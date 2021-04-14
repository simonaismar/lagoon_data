% Plots the lagoon map

% load data
load('map.mat', 'med_coastline')
load('gebco_Med.mat')
[latm,lonm]=meshgrid(LAT,LON);
latm=latm';
lonm=lonm';

% make figure 
fh=figure;
set(fh,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[700 700 1200 600],'visible','on');

%bathy&oro
pc=pcolor(lonm,latm,HH);
shading interp
hold on
caxis([-200 100])
colormap(bone)

% coastline
plot(med_coastline(:,1),med_coastline(:,2),'color',...
'k','linewidth',1);
axis([8 8.9 39.5 40.1]); dasp(39.8);

% coordinates
% AWAC in Lat 39.88589, Lon 8.497863 
% mareografo in Lat 39.827925, Lon 8.559690.
lon_aw= 8.497863; 
lat_aw= 39.88589;

lon_tg=8.559690;
lat_tg=39.827925;

hold on

stg=scatter(lon_tg,lat_tg,100,'MarkerEdgeColor','k',...
    'MarkerFaceColor',[1     1     0]);

hold on

saw=scatter(lon_aw,lat_aw,100,'MarkerEdgeColor','k',...
    'MarkerFaceColor',[1    0     0]);

set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Position AWAC and Tide Gauge','fontsize',14,'fontweight','bold');
xlabel('Longitude','fontsize',14,'fontweight','bold');
ylabel('Latitude ','fontsize',14,'fontweight','bold');
legend([stg,saw], 'Tide Gauge','AWAC')
set(gcf,'PaperPositionMode','auto')
print('-dpng','-r600','maplagoon.png')
