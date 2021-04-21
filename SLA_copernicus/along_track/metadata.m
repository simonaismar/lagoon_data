% ncdisp('nrt_med_j3_phy_assim_l3_20190331_20190421.nc')
% Source:
%            /home/simo/Dropbox/research/CNR/IAS/dati mareografo/copernicus/dataset-duacs-nrt-medsea-j3-phy-assim-l3_1616748100438/nrt_med_j3_phy_assim_l3_20190331_20190421.nc
% Format:
%            classic
% Global Attributes:
%            Conventions                    = 'CF-1.6'
%            Metadata_Conventions           = 'Unidata Dataset Discovery v1.0'
%            cdm_data_type                  = 'Swath'
%            comment                        = 'Sea surface height measured by altimeters referenced to the [1993, 2012] period; with additional corrections; the proposed sla is already corrected for dac, ocean_tide and lwe; [uncorrected sla]=[sla from product]+[dac]+[ocean_tide]-[lwe]'
%            contact                        = 'servicedesk.cmems@mercator-ocean.eu'
%            creator_email                  = 'servicedesk.cmems@mercator-ocean.eu'
%            creator_name                   = 'CMEMS - Sea Level Thematic Assembly Center'
%            creator_url                    = 'http://marine.copernicus.eu'
%            date_created                   = '2019-04-20T23:15:39Z'
%            date_issued                    = '2019-04-20T23:15:39Z'
%            date_modified                  = '2019-04-20T23:15:39Z'
%            geospatial_lat_max             = 44.743
%            geospatial_lat_min             = 31.7633
%            geospatial_lat_resolution      = 0.047921
%            geospatial_lat_units           = 'degrees_north'
%            geospatial_lon_max             = 359.971
%            geospatial_lon_min             = 0.003079
%            geospatial_lon_resolution      = 0.032926
%            geospatial_lon_units           = 'degrees_east'
%            geospatial_vertical_max        = 0
%            geospatial_vertical_min        = 0
%            geospatial_vertical_positive   = 'down'
%            geospatial_vertical_resolution = 'point'
%            geospatial_vertical_units      = 'm'
%            history                        = '2019-04-20T23:15:39Z: Creation'
%            institution                    = 'CLS, CNES'
%            keywords                       = 'Oceans > Ocean Topography > Sea Surface Height'
%            keywords_vocabulary            = 'NetCDF COARDS Climate and Forecast Standard Names'
%            license                        = 'http://marine.copernicus.eu/web/27-service-commitments-and-licence.php'
%            platform                       = 'Jason-3'
%            processing_level               = 'L3'
%            product_version                = '2019'
%            project                        = 'COPERNICUS MARINE ENVIRONMENT MONITORING SERVICE (CMEMS)'
%            references                     = 'http://marine.copernicus.eu'
%            software_version               = '18.4.0_DUACS_DT2018_baseline'
%            source                         = 'Jason-3 measurements'
%            ssalto_duacs_comment           = 'Jason-3 is the reference mission used for the altimeter inter-calibration processing'
%            standard_name_vocabulary       = 'NetCDF Climate and Forecast (CF) Metadata Convention Standard Name Table v37'
%            summary                        = 'SSALTO/DUACS Near-Real-Time Level-3 sea surface height measured by Jason-3 altimetry observations over Mediterranean Sea.'
%            time_coverage_duration         = 'P9H56M2.479276S'
%            time_coverage_end              = '2019-03-31T10:39:22Z'
%            time_coverage_resolution       = 'P1S'
%            time_coverage_start            = '2019-03-31T00:43:20Z'
%            title                          = 'NRT Jason-3 Mediterranean Sea Along track SSALTO/DUACS Sea Surface Height L3 product'
% Dimensions:
%            time = 450
% Variables:
%     time          
%            Size:       450x1
%            Dimensions: time
%            Datatype:   double
%            Attributes:
%                        axis          = 'T'
%                        calendar      = 'gregorian'
%                        long_name     = 'Time of measurement'
%                        standard_name = 'time'
%                        units         = 'days since 1950-01-01 00:00:00'
%     longitude     
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int32
%            Attributes:
%                        add_offset    = 0
%                        long_name     = 'Longitude of measurement'
%                        scale_factor  = 1e-06
%                        standard_name = 'longitude'
%                        units         = 'degrees_east'
%     latitude      
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int32
%            Attributes:
%                        add_offset    = 0
%                        long_name     = 'Latitude of measurement'
%                        scale_factor  = 1e-06
%                        standard_name = 'latitude'
%                        units         = 'degrees_north'
%     cycle         
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        coordinates = 'longitude latitude'
%                        long_name   = 'Cycle the measurement belongs to'
%                        units       = '1'
%     track         
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        coordinates = 'longitude latitude'
%                        long_name   = 'Track in cycle the measurement belongs to'
%                        units       = '1'
%     dac           
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        _FillValue   = 32767
%                        add_offset   = 0
%                        comment      = 'The sla in this file is already corrected for the dac; the uncorrected sla can be computed as follows: [uncorrected sla]=[sla from product]+[dac]; see the product user manual for details'
%                        coordinates  = 'longitude latitude'
%                        long_name    = 'Dynamic Atmospheric Correction'
%                        scale_factor = 0.0001
%                        units        = 'm'
%     ocean_tide    
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int32
%            Attributes:
%                        _FillValue   = 2147483647
%                        add_offset   = 0
%                        comment      = 'The sla in this file is already corrected for the ocean_tide; the uncorrected sla can be computed as follows: [uncorrected sla]=[sla from product]+[ocean_tide]; see the product user manual for details'
%                        coordinates  = 'longitude latitude'
%                        long_name    = 'Ocean tide model'
%                        scale_factor = 0.0001
%                        units        = 'm'
%     flag          
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        _FillValue  = 32767
%                        comment     = 'The origin of the data is determined by the types of geophysical data records (GDR) used in computation of the SLA: 1 for the Interim GDR (IGDR) or Short Time Critical (STC) and 0 for Operational GDR (OGDR) or Near Real Time (NRT).'
%                        coordinates = 'longitude latitude'
%                        long_name   = 'Data origin'
%                        meaning     = 'OGDR_or_NRT, IGDR_or_STC'
%                        units       = '1'
%                        values      = [0  1]
%     sla_unfiltered
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        _FillValue    = 32767
%                        add_offset    = 0
%                        comment       = 'The sea level anomaly is the sea surface height above mean sea surface height; the uncorrected sla can be computed as follows: [uncorrected sla]=[sla from product]+[dac]+[ocean_tide]-[lwe]; see the product user manual for details'
%                        coordinates   = 'longitude latitude'
%                        long_name     = 'Sea level anomaly not-filtered not-subsampled with dac, ocean_tide and lwe correction applied'
%                        scale_factor  = 0.001
%                        standard_name = 'sea_surface_height_above_sea_level'
%                        units         = 'm'
%     sla_filtered  
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        _FillValue    = 32767
%                        add_offset    = 0
%                        comment       = 'The sea level anomaly is the sea surface height above mean sea surface height; the uncorrected sla can be computed as follows: [uncorrected sla]=[sla from product]+[dac]+[ocean_tide]-[lwe]; see the product user manual for details'
%                        coordinates   = 'longitude latitude'
%                        long_name     = 'Sea level anomaly filtered not-subsampled with dac, ocean_tide and lwe correction applied'
%                        scale_factor  = 0.001
%                        standard_name = 'sea_surface_height_above_sea_level'
%                        units         = 'm'
%     mdt           
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        _FillValue    = 32767
%                        add_offset    = 0
%                        comment       = 'The mean dynamic topography is the sea surface height above geoid; it is used to compute the absolute dynamic tyopography adt=sla+mdt'
%                        coordinates   = 'longitude latitude'
%                        long_name     = 'Mean dynamic topography'
%                        scale_factor  = 0.001
%                        standard_name = 'sea_surface_height_above_geoid'
%                        units         = 'm'
%     lwe           
%            Size:       450x1
%            Dimensions: time
%            Datatype:   int16
%            Attributes:
%                        _FillValue   = 32767
%                        add_offset   = 0
%                        comment      = 'The sla in this file is already corrected for the lwe; the uncorrected sla can be computed as follows: [uncorrected sla]=[sla from product]-[lwe]; see the product user manual for details'
%                        coordinates  = 'longitude latitude'
%                        long_name    = 'Long wavelength error'
%                        scale_factor = 0.001
%                        units        = 'm'
