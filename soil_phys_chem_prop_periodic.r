library("neonUtilities")
library("feather")

path = 'sls_soilpH.feather'

soil_phys_chem_prop_periodic_without_asking <- loadByProduct(dpID = "DP1.10086.001", check.size = FALSE)
soil_phys_chem_prop_periodic_without_asking$sls_soilpH[1:3,1:14]

write_feather(soil_phys_chem_prop_periodic_without_asking$sls_soilpH, path)
