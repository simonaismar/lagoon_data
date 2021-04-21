% ncdisp('dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc')
% Source:
%            /home/simo/Dropbox/research/CNR/IAS/dati mareografo/copernicus/dataset-duacs-nrt-medsea-merged-allsat-phy-l4_1616766981739.nc
% Format:
%            classic
% Global Attributes:
%            Conventions                    = 'CF-1.6'
%            Metadata_Conventions           = 'Unidata Dataset Discovery v1.0'
%            cdm_data_type                  = 'Grid'
%            comment                        = 'Sea Surface Height measured by Altimetry and derived variables'
%            contact                        = 'servicedesk.cmems@mercator-ocean.eu'
%            creator_email                  = 'servicedesk.cmems@mercator-ocean.eu'
%            creator_name                   = 'CMEMS - Sea Level Thematic Assembly Center'
%            creator_url                    = 'http://marine.copernicus.eu'
%            date_created                   = '2019-06-16T23:31:00Z'
%            date_issued                    = '2019-06-16T23:31:00Z'
%            date_modified                  = '2019-06-16T23:31:00Z'
%            geospatial_lat_max             = 45.9375
%            geospatial_lat_min             = 36.0625
%            geospatial_lat_resolution      = 0.125
%            geospatial_lat_units           = 'degrees_north'
%            geospatial_lon_max             = 14.9375
%            geospatial_lon_min             = 0.0625
%            geospatial_lon_resolution      = 0.125
%            geospatial_lon_units           = 'degrees_east'
%            geospatial_vertical_max        = 0
%            geospatial_vertical_min        = 0
%            geospatial_vertical_positive   = 'down'
%            geospatial_vertical_resolution = 'point'
%            geospatial_vertical_units      = 'm'
%            history                        = '2019-06-16 23:31:00Z: Creation'
%            institution                    = 'CLS, CNES'
%            keywords                       = 'Oceans > Ocean Topography > Sea Surface Height'
%            keywords_vocabulary            = 'NetCDF COARDS Climate and Forecast Standard Names'
%            license                        = 'http://marine.copernicus.eu/web/27-service-commitments-and-licence.php'
%            platform                       = 'Cryosat-2, Jason-3, OSTM/Jason-2 Long Repeat Orbit, Sentinel-3A, Sentinel-3B'
%            processing_level               = 'L4'
%            product_version                = '2019'
%            project                        = 'COPERNICUS MARINE ENVIRONMENT MONITORING SERVICE (CMEMS)'
%            references                     = 'http://marine.copernicus.eu'
%            software_version               = '18.4.0_DUACS_DT2018_baseline'
%            source                         = 'Altimetry measurements'
%            ssalto_duacs_comment           = 'Jason-3 is the reference mission used for the altimeter inter-calibration processing'
%            standard_name_vocabulary       = 'NetCDF Climate and Forecast (CF) Metadata Convention Standard Name Table v37'
%            summary                        = 'SSALTO/DUACS Near-Real-Time Level-4 sea surface height and derived variables measured by multi-satellite altimetry observations over Mediterranean Sea.'
%            time_coverage_duration         = 'P1D'
%            time_coverage_end              = '2019-06-17T00:00:00Z'
%            time_coverage_resolution       = 'P1D'
%            time_coverage_start            = '2019-06-17T00:00:00Z'
%            title                          = 'NRT merged all satellites Mediterranean Sea Gridded SSALTO/DUACS Sea Surface Height L4 product and derived variables'
%            History                        = 'Translated to CF-1.0 Conventions by Netcdf-Java CDM (CFGridWriter2)
%                                             Original Dataset = dataset-duacs-nrt-medsea-merged-allsat-phy-l4; Translation Date = 2021-03-26T13:56:21.811Z'
% Dimensions:
%            time      = 151
%            latitude  = 80
%            longitude = 120
% Variables:
%     adt      
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue    = -2147483647
%                        comment       = 'The absolute dynamic topography is the sea surface height above geoid; the adt is obtained as follows: adt=sla+mdt where mdt is the mean dynamic topography; see the product user manual for details'
%                        coordinates   = 'time latitude longitude '
%                        grid_mapping  = 'crs'
%                        long_name     = 'Absolute dynamic topography'
%                        scale_factor  = 0.0001
%                        standard_name = 'sea_surface_height_above_geoid'
%                        units         = 'm'
%     time     
%            Size:       151x1
%            Dimensions: time
%            Datatype:   single
%            Attributes:
%                        axis                = 'T'
%                        calendar            = 'gregorian'
%                        long_name           = 'Time'
%                        standard_name       = 'time'
%                        units               = 'days since 1950-01-01 00:00:00'
%                        _CoordinateAxisType = 'Time'
%     latitude 
%            Size:       80x1
%            Dimensions: latitude
%            Datatype:   single
%            Attributes:
%                        axis                = 'Y'
%                        bounds              = 'lat_bnds'
%                        long_name           = 'Latitude'
%                        standard_name       = 'latitude'
%                        units               = 'degrees_north'
%                        valid_max           = 45.9375
%                        valid_min           = 30.0625
%                        _CoordinateAxisType = 'Lat'
%     longitude
%            Size:       120x1
%            Dimensions: longitude
%            Datatype:   single
%            Attributes:
%                        axis                = 'X'
%                        bounds              = 'lon_bnds'
%                        long_name           = 'Longitude'
%                        standard_name       = 'longitude'
%                        units               = 'degrees_east'
%                        valid_max           = 36.9375
%                        valid_min           = -5.9375
%                        _CoordinateAxisType = 'Lon'
%     ugos     
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue    = -2147483647
%                        coordinates   = 'time latitude longitude '
%                        grid_mapping  = 'crs'
%                        long_name     = 'Absolute geostrophic velocity: zonal component'
%                        scale_factor  = 0.0001
%                        standard_name = 'surface_geostrophic_eastward_sea_water_velocity'
%                        units         = 'm/s'
%     vgos     
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue    = -2147483647
%                        coordinates   = 'time latitude longitude '
%                        grid_mapping  = 'crs'
%                        long_name     = 'Absolute geostrophic velocity: meridian component'
%                        scale_factor  = 0.0001
%                        standard_name = 'surface_geostrophic_northward_sea_water_velocity'
%                        units         = 'm/s'
%     vgosa    
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue    = -2147483647
%                        comment       = 'The geostrophic velocity anomalies are referenced to the [1993, 2012] period'
%                        coordinates   = 'time latitude longitude '
%                        grid_mapping  = 'crs'
%                        long_name     = 'Geostrophic velocity anomalies: meridian component'
%                        scale_factor  = 0.0001
%                        standard_name = 'surface_geostrophic_northward_sea_water_velocity_assuming_sea_level_for_geoid'
%                        units         = 'm/s'
%     err      
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue   = -2147483647
%                        comment      = 'The formal mapping error represents a purely theoretical mapping error. It mainly traduces errors induced by the constellation sampling capability and consistency with the spatial/temporal scales considered, as described in Le Traon et al (1998) or Ducet et al (2000)'
%                        coordinates  = 'time latitude longitude '
%                        grid_mapping = 'crs'
%                        long_name    = 'Formal mapping error'
%                        scale_factor = 0.0001
%                        units        = 'm'
%     sla      
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue    = -2147483647
%                        comment       = 'The sea level anomaly is the sea surface height above mean sea surface; it is referenced to the [1993, 2012] period; see the product user manual for details'
%                        coordinates   = 'time latitude longitude '
%                        grid_mapping  = 'crs'
%                        long_name     = 'Sea level anomaly'
%                        scale_factor  = 0.0001
%                        standard_name = 'sea_surface_height_above_sea_level'
%                        units         = 'm'
%     ugosa    
%            Size:       120x80x151
%            Dimensions: longitude,latitude,time
%            Datatype:   int32
%            Attributes:
%                        _FillValue    = -2147483647
%                        comment       = 'The geostrophic velocity anomalies are referenced to the [1993, 2012] period'
%                        coordinates   = 'time latitude longitude '
%                        grid_mapping  = 'crs'
%                        long_name     = 'Geostrophic velocity anomalies: zonal component'
%                        scale_factor  = 0.0001
%                        standard_name = 'surface_geostrophic_eastward_sea_water_velocity_assuming_sea_level_for_geoid'
%                        units         = 'm/s'
