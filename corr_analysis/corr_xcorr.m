%% Correlations and Time Lags
% input all the dataseries detrended and smoothed (no daily cycle)
% output correlations, timelags, lagged correlation and timelag plots

%load in_correlations.mat
close all
clear 
clc
%% correlation, xcross salinity and temperature by the tide gauge

% load data
cd ../tide_gauge/salinity
load('saltemp_proc.mat', 'salinity1_sm')
load('saltemp_proc.mat', 'temperature1_sm')
load('saltemp_proc.mat', 'time1')
cd ../../corr_analysis
% correlation
R_st = corr(salinity1_sm,temperature1_sm, 'rows','complete'); 
%isOK=isfinite(salinity1_nm) & isfinite(temperature1_nm); % both rows finite (neither NaN)

% time lag
ind=isnan(salinity1_sm); 
[C_st,lag]=xcorr(salinity1_sm(~ind),temperature1_sm(~ind),'coeff');
[M_st,I]=max(abs(C_st));
timelag_st=lag(I)*2/24; % in days

% plot lag
figure;stem(lag, C_st);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Salinity&Temperature','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xsaltemp.png')

clear lag I
close

%%  correlation salinity/temp and ssh awac

% load data
cd ../AWAC
load('awac_proc.mat', 'residual_ssh_sm')
load('awac_proc.mat', 'timen')
cd ../corr_analysis

% correlation
% find overlapping series
% ----------------------------------
% salc=salinity1_sm(1:99); % uncomment off github
% tempc=temperature1_sm(1:99); % uncomment off github
% ----------------------------------

% resample residual ssh to have the same delta time
timed_ssh_sm=residual_ssh_sm(3:4:end);
temp_time=timen(3:4:end);

% ----------------------------------
% this is the index of the stardt/end of the overlapping series
indol=length(timed_ssh_sm);% comment off github 
salc=salinity1_sm(1:indol);  % comment off github
tempc=temperature1_sm(1:indol); % comment off github
% ----------------------------------

% in the resampled time series 28th January 08:00:00 is at index 861

clear indol % comment off github
indol=1; % this is the index of the stardt/end of the overlapping series

%sshc=timed_ssh_sm(861:end); % uncomment off github % 861 is the index of the starting time

sshc=timed_ssh_sm(indol:end); % comment off github
R_ss = corr(sshc,salc,'rows','complete');   %  -0.4573
R_sht = corr(sshc,tempc,'rows','complete'); %  0.6559

% time lag
[C_ss,lag1]=xcorr(sshc,salc,'coeff');
[M_ss,I]=max(abs(C_ss));
timelag_ss=lag1(I)*2/24; % in days

[C_sht,lag]=xcorr(sshc,tempc,'coeff');
[M_sht,I]=max(abs(C_sht));
timelag_sht=lag(I)*2/24; % in days

% plot lag
figure;stem(lag, C_ss);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Salinity&SHH AWAC','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xsalSSHa.png')
%
figure;stem(lag1, C_sht);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Temperature&SHH Tide Gauge','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xtempSSHa.png')

close
clear temp_time I lag*

%% Hs and ssh awac

% load data
cd ../AWAC/waves/   
load('awac_wave_proc.mat', 'hss')
% rename time
time_awac=timen; clear timen
cd ..
load('awac_proc.mat', 'timen')
cd ../corr_analysis/

% correlation
%uncomment line below if using the real dataset off github
%sshus=residual_ssh_sm(1:2:end); % ssh undersampled smoothed
sshus=residual_ssh_sm; % comment off github
R_hs = corr(sshus,hss, 'rows','complete'); 

% time lag
hssf= fillmissing(hss,'linear');
sshusf= fillmissing(sshus,'linear');
[C_hs,lag]=xcorr(sshusf,hssf,'coeff');
[M_hs,I]=max(abs(C_hs));
timelag_hs=(lag(I)/2)*24; % in days

% plot lag
figure;stem(lag, C_hs);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Hs&SHH AWAC','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xHsSSHa.png')

close
clear I lag timed_ssh_sm temp_time
%% salinity and ssh tide

% load data 
cd ../tide_gauge
% tide '28-Jan-2021 15:00:00' to '18-Mar-2021 09:30:00' timen (0. hrs)
% salinity '28-Jan-2021 08:00:00' to '19-Feb-2021 10:22:37' time1 (2 hrs)
% rename ssh and time from AWAC
ssh_awac=residual_ssh_sm;
time_wave=timen;
clear residual_ssh_sm timen
load('tidelagoon_proc.mat', 'residual_ssh_sm')
load('tidelagoon_proc.mat', 'timen')
cd ../corr_analysis/
% correlation
% common time 
timed_ssh_sm=residual_ssh_sm(3:4:end);
temp_time=timen(3:4:end);
sshtu= residual_ssh_sm(3:4:length(residual_ssh_sm));% ssh tide gauge undersampled
salc2=salinity1_sm(1:length(temp_time)); % comment off github
%salc2=salinity1_sm(5:266); % uncomment off github
%ssh_tidec=sshtu(1:262); % uncomment off github
ssh_tidec=sshtu(1:length(salc2)); % comment off github

R_sst = corr(salc2,ssh_tidec, 'rows','complete'); 

% time lag
[C_sst,lag]=xcorr(salc2,ssh_tidec,'coeff');
[M_sst,I]=max(abs(C_sst));
timelag_sst=lag(I)*2/24; % in days

% plot lag
figure;stem(lag, C_sst);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('Salinity&SHH Tide Gauge','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xsalshht.png')
close 
clear I lag 

%% ssh tide & sla

% load data
% tide '28-Jan-2021 15:00:00' to '18-Mar-2021 09:30:00' 
% sla '01-Nov-2018' to '31-Mar-2019' 
cd ../SLA_copernicus/gridded/
load('read_data_l4.mat', 'sla_tide')
load('read_data_l4.mat', 'sla_awac')
load('read_data_l4.mat', 'final_time')
cd ../../corr_analysis/

% sla_tidec=sla_tide(89:138); % uncomment off github
sla_tidec=sla_tide(1:length(residual_ssh_sm)); %comment off github

%tmp=[timen(1:48:end);timen(end)];
%stc=[residual_ssh_sm(1:48:end);residual_ssh_sm(end)];  % uncomment off github
stc=residual_ssh_sm; % comment off github
R_slat = corr(stc,squeeze(sla_tidec), 'rows','complete'); %0.5662

% time lag
[C_slat,lag]=xcorr(stc,squeeze(sla_tidec),'coeff');
[M_slat,I]=max(abs(C_slat));
timelag_slat=lag(I); % in days

%plot lag
figure;stem(lag, C_slat);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('SLA&SHH Tide Gauge','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xslashht.png')

close
clear I lag

%% ssh awac & sla

% awac '17-Nov-2020 15:00:00' to '05-Feb-2021 12:30:00' timen_awac
% sla '01-Nov-2018' to '31-Mar-2019' final_time

% correlation
%sla_awacc=sla_awac(17:97); % uncomment off github
sla_awacc=sla_awac(1:length(ssh_awac)); % comment off github

%sac=[ssh_awac(1:48:end);ssh_awac(end)]; % uncomment off github
sac=[ssh_awac]; % comment off github

R_slaa = corr(sac,squeeze(sla_awacc), 'rows','complete'); 

% time lag
[C_slaa,lag]=xcorr(sac,squeeze(sla_awacc),'coeff');
[M_slaa,I]=max(abs(C_slaa));
timelag_slaa=lag(I); % in days

% plot lag
figure;stem(lag, C_slaa);grid on;
set(gca,'fontsize',14)
set(gca,'fontweight','bold')
title('SLA&SHH AWAC','fontsize',14,'fontweight','bold');
xlabel('Lag','fontsize',14,'fontweight','bold');
ylabel('Corr Coeff','fontsize',14,'fontweight','bold');
set(gcf,'PaperPositionMode','auto')
%print('-dpng','-r600','xslashha.png')


%save out_correlations


