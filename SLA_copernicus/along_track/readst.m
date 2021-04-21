function []=readst(filename,var1,var2,var3,var4,outname)

% function to chain-read netcdf altimetry copernicus and plot the satellite tracks
% filename= sting containing name of the .nc file: 'namefile.nc'
% var*= name of the variables that we want to extract from the .nc file
% example: var1='sla_filtered';var2='time'; var3='longitude';var4='latitude';
% (for this we need to read the nc metadata first) 
% outname: name of the output figure and .mat file. String format 

sla_filtered=ncread(filename,var1);
time_tmp=ncread(filename,var2);
longitude=ncread(filename,var3);
latitude=ncread(filename,var4);
time = double(time_tmp + datenum('01-01-1950 00:00:00'));

%data={sla_filtered,time,longitude,latitude};

clear var* filename time_tmp
save(outname) 

%cd ('/home/simo/Dropbox/research/CNR/IAS/dati mareografo/cool maps')
%load('map.mat', 'med_coastline')
%load('gebco_Med.mat')
%cd('/home/simo/Dropbox/research/CNR/IAS/dati mareografo/copernicus/dataset-duacs-nrt-medsea-j3-phy-assim-l3_1616748100438')
[latm,lonm]=meshgrid(LAT,LON);
latm=latm';
lonm=lonm';

% plot
ah=figure;

set(ah,'PaperUnits','inches',...
'PaperOrientation','portrait',...
'PaperSize',[8 8],...
'Paperposition',[0.5 0.5 9.5 3],...
'PaperType','<custom>',...
'Position',[50 50 900 800],'visible','on');%[x y width height]
plot(med_coastline(:,1),med_coastline(:,2),'color',...
'k','linewidth',1);

axis([5 20 35 48]); dasp(41.5);


hold on
p=scatter(longitude,latitude,'Filled','MarkerFaceColor','k');

set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title(outname,'fontsize',14,'fontweight','bold');
xlabel('Longitude','fontsize',14,'fontweight','bold');
ylabel('Latitude','fontsize',14,'fontweight','bold');
set(gcf, 'PaperPositionMode', 'auto');
print('-dpng','-r600',outname)
close all
