##works in Mac
find.ij <- function(ostype = .Platform$OS.type){

  if (ostype == "windows"){
    if(!file.exists("c:\\Program Files\\ImageJ\\ij.jar") || !file.exists("c:\\Program Files\\ImageJ\\jre\\bin\\java.exe")) {
      warning("ij.jar or java were not found in the common install location on your system; When you run run.ij, specify the path to ImageJ directory or try installing ImageJ bundled with Java to C:\\Program Files\\ ")
      return("ImageJ not found")
    } else return("C:\\Program Files\\ImageJ\\")
  } else {
      unix.check <- Sys.info()["sysname"]
      if(unix.check=="Linux") {
        warning("Specify the path to the directory that contains ImageJ.app and ij.jar")
        return("ImageJ not found")
      } else {
        imagej <- system("mdfind -name ImageJ | grep 'ImageJ.app'", intern = TRUE)
      if(length(imagej) != 0){ 
        return(imagej) 
      } else {
        warning("ImageJ.app was not found in the common install location on your system; When you run run.ij, specify the path to ImageJ.app")
        return("ImageJ not found")
      }
    }
  }
}
