library("neonUtilities")
library("feather")

soil_phys_chem_prop_periodic <- loadByProduct(dpID = "DP1.10086.001")
soil_phys_chem_prop_periodic$sls_soilpH[1:3,1:14]
