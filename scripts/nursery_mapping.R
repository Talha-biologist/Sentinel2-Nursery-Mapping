# Project: Forest Nursery Monitoring using Sentinel-2
# Author: Talha (UVAS)
# Method: Remote Sensing & Machine Learning (Random Forest)

# -------------------------------------------------------
# 1. Load Required Libraries
# -------------------------------------------------------
library(raster)       # For handling satellite raster data
library(sf)           # For vector data (Study Area shapefile)
library(randomForest) # For Supervised Classification
library(ggplot2)      # For NDVI plotting
library(RStoolbox)    # For Remote Sensing tools

# -------------------------------------------------------
# 2. Data Pre-processing (Sentinel-2)
# -------------------------------------------------------
# Define Study Area: Pattoki Forest Nursery
# Coordinates: 31°1' N, 73°50' E
aoi <- st_read("data/pattoki_boundary.shp")

# Load Sentinel-2 Bands (10m Resolution)
# B4 = Red, B8 = NIR, B3 = Green
s2_stack <- stack(list.files("data/sentinel_bands/", pattern = ".tif", full.names = T))

# Crop to Area of Interest
s2_cropped <- crop(s2_stack, aoi)

# -------------------------------------------------------
# 3. Spectral Indices Calculation
# -------------------------------------------------------
# Calculate Normalized Difference Vegetation Index (NDVI)
# Formula: (NIR - Red) / (NIR + Red)
ndvi <- (s2_cropped[[4]] - s2_cropped[[3]]) / (s2_cropped[[4]] + s2_cropped[[3]])

# Calculate NDWI (Water Index) for moisture monitoring
ndwi <- (s2_cropped[[2]] - s2_cropped[[4]]) / (s2_cropped[[2]] + s2_cropped[[4]])

plot(ndvi, main="NDVI Map of Forest Nursery")

# -------------------------------------------------------
# 4. Supervised Classification (Random Forest)
# -------------------------------------------------------
# Load Training Data (Ground Truth Points)
training_sites <- st_read("data/training_points.shp")

# Extract spectral values for training
train_vals <- extract(s2_cropped, training_sites)
training_data <- data.frame(Class = training_sites$Class, train_vals)

# Train Random Forest Model
rf_model <- randomForest(as.factor(Class) ~ ., data = training_data, ntree = 500)
print(rf_model) # Check Confusion Matrix and OOB Error

# Predict Classifications (Map Generation)
classified_map <- predict(s2_cropped, rf_model)

# -------------------------------------------------------
# 5. Phenology Analysis (Time Series)
# -------------------------------------------------------
# Extract mean NDVI values over time to track growth seasons
# (Code assumes a list of NDVI rasters 'ndvi_ts')
# ggplot code for seasonal trends would go here.