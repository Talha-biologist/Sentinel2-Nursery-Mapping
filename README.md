# Monitoring Forest Nurseries: A Remote Sensing Approach using Sentinel-2

![R](https://img.shields.io/badge/Language-R-blue?style=for-the-badge&logo=r)
![Sentinel-2](https://img.shields.io/badge/Data-Sentinel--2-success?style=for-the-badge&logo=satellite)
![Status](https://img.shields.io/badge/Status-Completed-orange?style=for-the-badge)

> **Researcher:** Talha (BS Biological Sciences, UVAS)  
> **Focus:** Remote Sensing | GIS | Ecological Modeling  
> **Status:** Completed (Winter 2026 Application Portfolio)

## 📌 Project Overview
Forest nurseries are critical for large-scale afforestation but are difficult to monitor manually over vast areas. This project utilizes **Sentinel-2 (Level-2A)** satellite imagery to automate the mapping and health monitoring of the **Pattoki Forest Nursery** (Punjab, Pakistan).

Using **Machine Learning (Random Forest)** and spectral indices, we successfully distinguished nursery boundaries from surrounding agricultural land and tracked seasonal phenology.

## 🔍 Key Objectives
1.  **Mapping:** Precise delineation of nursery extent using 10m resolution satellite data.
2.  **Health Monitoring:** Using **NDVI** (Normalized Difference Vegetation Index) to assess vegetative health.
3.  **Phenology Tracking:** Analyzing temporal spectral signatures to identify peak growth periods (Monsoon/Spring).

## 🛠️ Methodology & Tech Stack
* **Data Source:** Sentinel-2 MSI (Level-2A), obtained via Copernicus Open Access Hub.
* **Study Area:** Pattoki Forest Nursery ($31^{\circ}1'N, 73^{\circ}50'E$).
* **Tools:**
    * **R:** `raster`, `sf`, `randomForest`, `ggplot2` for image processing and classification.
    * **QGIS:** Used for ground-truthing and validation sample collection.
* **Algorithm:**
    * **Random Forest Classifier:** Trained on spectral bands (Blue, Green, Red, NIR) to classify pixels into *Nursery*, *Bare Soil*, and *Vegetation* classes.
    * **Indices:** NDVI for vegetation density and NDWI for moisture content.

## 📊 Visualizations & Maps
High-resolution outputs from the remote sensing analysis are available in the `maps/` directory:

* **[Study_Area_Location.png](maps/study_area.png):** Geographical overview of the study site (Pattoki Forest Nursery).
* **[Nursery_Classification_Map.pdf](maps/Nursery_Classification_Map.pdf):** Final supervised classification map delineating the boundaries of the nursery against surrounding agricultural land.
* **[Phenology_NDVI_TimeSeries.tif](maps/Phenology_NDVI_TimeSeries.tif):** Temporal analysis of NDVI signatures, identifying peak growth periods during the Monsoon and Spring seasons.
* **[Land_Cover_Statistics.pdf](maps/Land_Cover_Statistics.pdf):** Quantitative breakdown of land cover classes (Nursery vs. Vegetation vs. Soil) derived from the Random Forest model.

## 📂 Repository Structure
## ⚠️ Usage Policy
**Status:** Unpublished Research.
* **Code:** Available for educational review.
* **Data/Maps:** The specific classification maps and ground-truth datasets are proprietary and may not be used without permission.

---
### 📬 Contact
**Talha** Final Year BS Biological Sciences | UVAS, Lahore  
📧 [Ta357026@gmail.com]