library("neonUtilities")
library("feather")


soil_phys_chem_prop_periodic_without_asking <- loadByProduct(dpID = "DP1.10086.001", check.size = FALSE)
soil_phys_chem_prop_periodic$sls_soilpH[1:3,1:14]
