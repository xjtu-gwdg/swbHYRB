%% SWB example of the Headwater of the Yellow River Basin

! Grid definition: projected coordinates are Wisconsin Transverse Mercator (83/91), meters
!      nx    ny     xll          yll     resolution
GRID  386   314   212287.95301   3636060.8716    1000
BASE_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs

%% Define methods
-----------------

INTERCEPTION_METHOD              BUCKET
EVAPOTRANSPIRATION_METHOD        HARGREAVES
RUNOFF_METHOD                    CURVE_NUMBER
SOIL_MOISTURE_METHOD             FAO-56_TWO_STAGE
PRECIPITATION_METHOD             GRIDDED
GROWING_DEGREE_DAY_METHOD        MODIFIED_GROWING_DEGREE_DAY
FOG_METHOD                       NONE
FLOW_ROUTING_METHOD              NONE
IRRIGATION_METHOD                FAO-56
ROOTING_DEPTH_METHOD             DYNAMIC
CROP_COEFFICIENT_METHOD          FAO-56
DIRECT_RECHARGE_METHOD           NONE
SOIL_STORAGE_MAX_METHOD          CALCULATED
AVAILABLE_WATER_CONTENT_METHOD   GRIDDED

GROWING_SEASON 133 268 TRUE


%% define location, projection, and conversions for weather data
----------------------------------------------------------------

PRECIPITATION NETCDF pre_2010_2011_HYRB_utm47n_1km.nc
PRECIPITATION_GRID_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs
PRECIPITATION_NETCDF_Z_VAR              prcp
PRECIPITATION_SCALE_FACTOR              0.003937008
PRECIPITATION_MISSING_VALUES_CODE       -32768.0
PRECIPITATION_MISSING_VALUES_OPERATOR   <=
PRECIPITATION_MISSING_VALUES_ACTION     zero

TMAX NETCDF tmax_2010_2011_HYRB_utm47n_1km.nc
TMAX_GRID_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs
TMAX_SCALE_FACTOR                0.18
TMAX_ADD_OFFSET                  32
TMAX_MISSING_VALUES_CODE         -32768.0
TMAX_MISSING_VALUES_OPERATOR     <=
TMAX_MISSING_VALUES_ACTION       mean

TMIN NETCDF tmin_2010_2011_HYRB_utm47n_1km.nc
TMIN_GRID_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs
TMIN_SCALE_FACTOR                0.18
TMIN_ADD_OFFSET                  32
TMIN_MISSING_VALUES_CODE         -32768.0
TMIN_MISSING_VALUES_OPERATOR     <=
TMIN_MISSING_VALUES_ACTION       mean

INITIAL_CONTINUOUS_FROZEN_GROUND_INDEX CONSTANT 100.0
UPPER_LIMIT_CFGI 83.
LOWER_LIMIT_CFGI 55.

%% specify location and projection for input GIS grids
------------------------------------------------------

FLOW_DIRECTION ARC_GRID d8_HYRB_1km_utm47n.asc
FLOW_DIRECTION_PROJECTION_DEFINITION  +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs

HYDROLOGIC_SOILS_GROUP ARC_GRID res_soil_0-5cm-HYRB-utm47n-1km.asc
HYDROLOGIC_SOILS_GROUP_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs

LAND_USE ARC_GRID clcd_v01_2020_HYRB_1km_utm47n_re.asc
LANDUSE_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs

AVAILABLE_WATER_CONTENT ARC_GRID res_water_0-5cm-HYRB-utm47n-1km.asc
AVAILABLE_WATER_CONTENT_PROJECTION_DEFINITION +proj=utm +zone=47 +datum=WGS84 +units=m +no_defs +type=crs


%% specify location and names for all lookup tables
---------------------------------------------------

LAND_USE_LOOKUP_TABLE Landuse_lookup_CDL.txt
IRRIGATION_LOOKUP_TABLE Irrigation_lookup_CDL.txt

%% initial conditions for soil moisture and snow storage amounts
%% may be specified as grids, but using a constant amount and
%% allowing the model to "spin up" for a year is also acceptable.

INITIAL_PERCENT_SOIL_MOISTURE CONSTANT 100.0
INITIAL_SNOW_COVER_STORAGE CONSTANT 2.0

# POTATOES
% DUMP_VARIABLES COORDINATES 561167. 445224.

# RYE
% DUMP_VARIABLES COORDINATES 546094., 438492.

# EVERGREEN FOREST
% DUMP_VARIABLES COORDINATES 556791. 457569.

# WINTER WHEAT
% DUMP_VARIABLES COORDINATES 568129. 458340.

# DEC FOREST
% DUMP_VARIABLES COORDINATES 553927. 459454.

# SWEET CORN
% DUMP_VARIABLES COORDINATES 555602. 434644.

# SOYBEANS
% DUMP_VARIABLES COORDINATES 558663. 432949.

# SUGAR BEETS
% DUMP_VARIABLES COORDINATES 570741. 445112.


OUTPUT ENABLE bare_soil_evaporation crop_et snowmelt soil_storage delta_soil_storage
OUTPUT ENABLE growing_season growing_degree_day

%% start and end date may be any valid dates in SWB version 2.0
%% remember to allow for adequate model spin up; running the
%% model for just a month or two will give questionable results

START_DATE 01/01/2010
END_DATE   01/24/2010
