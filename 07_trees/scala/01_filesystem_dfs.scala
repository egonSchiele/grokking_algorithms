import java.io.File

def printNames(dir: String): Unit = {
  // loop through every file and folder in the current folder
  val files = new File(dir).listFiles().sorted
  for(file <- files) {
    if(file.isFile) {
      // if it is a file, print out the name
      println(file.getName)
    } else {
      // if it is a folder, call this function recursively on it
      // to look for files and folders
      printNames(file.getPath)
    }
  }
}

// Uncomment to run:
// printNames("pics")

