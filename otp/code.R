library(opentripplanner)
# Path to a folder containing the OTP.jar file, change to where you saved the file.
path_data <- file.path("C:\\Project_R_Tool\\OpenStripPlanner","otp")
path_otp <- file.path(path_data,"otp.jar")
# Build Graph and start OTP
log1 <- otp_build_graph(otp = path_otp, dir = path_data)
log2 <- otp_setup(otp = path_otp, dir = path_data)
otpcon <- otp_connect()


# Import a bunch of points
block_centroids<-fread("C:\\Project_R_Tool\\OpenStripPlanner\\otp\\block_lat_lon.csv",colClasses=c(ID="character"))

# Call otpConnect() to define a connection called otpcon
otpcon <- otp_connect()

# create a matrix to contain OD travel time matrix
toPlace   = block_centroids[rep(seq(1, nrow(block_centroids)), times = nrow(block_centroids)),]
fromPlace = block_centroids[rep(seq(1, nrow(block_centroids)), each  = nrow(block_centroids)),]


routes <- otp_plan(otpcon = otpcon,
                   fromPlace = fromPlace,
                   toPlace = toPlace,
                   get_geometry = FALSE,
                   ncores=3)
