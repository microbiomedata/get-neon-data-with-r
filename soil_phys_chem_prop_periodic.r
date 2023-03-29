library("neonUtilities")
library("feather")

load_without_asking <- function (dpID, site = "all", startdate = NA, enddate = NA, package = "basic", 
    release = "current", timeIndex = "all", tabl = "all", check.size = TRUE, 
    nCores = 1, forceParallel = FALSE, token = NA_character_, 
    avg = NA) 
{
    if (!package %in% c("basic", "expanded")) {
        stop(paste(package, "is not a valid package name. Package must be basic or expanded", 
            sep = " "))
    }
    if (regexpr("DP[1-4]{1}[.][0-9]{5}[.]00[1-2]{1}", dpID)[1] != 
        1) {
        stop(paste(dpID, "is not a properly formatted data product ID. The correct format is DP#.#####.00#", 
            sep = " "))
    }
    if (substring(dpID, 5, 5) == 3 & dpID != "DP1.30012.001") {
        stop(paste(dpID, "is a remote sensing data product and cannot be loaded directly to R with this function. Use the byFileAOP() function to download locally.", 
            sep = " "))
    }
    if (dpID %in% c("DP1.00033.001", "DP1.00042.001")) {
        stop(paste(dpID, "is a phenological image product, data are hosted by Phenocam.", 
            sep = " "))
    }
    if (dpID == "DP4.00200.001") {
        stop("The bundled eddy covariance data product cannot be stacked and loaded directly from download.\nTo use these data, download with zipsByProduct() and then stack with stackEddy().")
    }
    temppath <- file.path(tempdir(), paste("zips", format(Sys.time(), 
        "%Y%m%d%H%M%S"), sep = ""))
    dir.create(temppath)
    zipsByProduct(dpID = dpID, site = site, startdate = startdate, 
        enddate = enddate, package = package, release = release, 
        avg = avg, timeIndex = timeIndex, tabl = tabl, check.size = check.size, 
        savepath = temppath, load = TRUE, token = token)
    if (length(list.files(temppath)) == 0) {
        return(invisible())
    }
    out <- stackByTable(filepath = paste(temppath, "/filesToStack", 
        substr(dpID, 5, 9), sep = ""), savepath = "envt", folder = TRUE, 
        nCores = nCores, saveUnzippedFiles = FALSE, check.size = FALSE)
    unlink(temppath, recursive = T)
    return(out)
}
soil_phys_chem_prop_periodic_without_asking <- load_without_asking(dpID = "DP1.10086.001")
soil_phys_chem_prop_periodic$sls_soilpH[1:3,1:14]
