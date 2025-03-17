# swbHYRB

## Overview
swbHYRB is an example implementation of the Soil-Water-Balance (SWB) model for the Headwater of the Yellow River (HYRB). This example runs the SWB model for the period 2010-2011, with a temporal resolution of 1 month and a spatial resolution of 1 km.

## Input Data
### Raster Data (Located in `test_data/cs`)
The model requires the following raster input datasets:
- **FLOW_DIRECTION**: `d8_HYRB_1km_utm47n.asc`
- **HYDROLOGIC_SOILS_GROUP**: `res_soil_0-5cm-HYRB-utm47n-1km.asc`
- **LAND_USE**: `clcd_v01_2020_HYRB_1km_utm47n_re.asc`
- **AVAILABLE_WATER_CONTENT**: `res_water_0-5cm-HYRB-utm47n-1km.asc`
- **Precipitation**: `pre_2010_2011_HYRB_utm47n_1km.nc`
- **Maximum Temperature**: `tmax_2010_2011_HYRB_utm47n_1km.nc`
- **Minimum Temperature**: `tmin_2010_2011_HYRB_utm47n_1km.nc`

### Table Data (Located in `test_data/tables`)
- **Land Use Lookup Table**: `Landuse_lookup.txt`
- **Irrigation Lookup Table**: `Irrigation_lookup_CDL.txt`

## Model Execution
- **Control File**: `central_sands_swb2.ctl`
- **Execution Command**: Run the model using `run_swb.bat`
- **Log Files**: Stored in the `logfile` folder
- **Model Output**: Stored in the `output` folder
  - The key **groundwater recharge** data is saved as: `HYRB_net_infiltration__2010-01-01_to_2010-01-24__314_by_386.nc`
  - Additional intermediate outputs are provided in `.nc` format

## Notes
- The original SWB model was designed for daily simulations. In this example, each recorded "day" in the output actually represents a full month.
- The model operates with **inches** for length and **Fahrenheit** for temperature. Since the input data is in **millimeters** and **Celsius**, necessary conversions are handled in the control file. Users must manually convert the output data as needed.
