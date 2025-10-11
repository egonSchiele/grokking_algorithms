import java.io.File;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Deque;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Create a File object for the "pics" directory in the current working directory
        File file = new File(System.getProperty("user.dir"), "pics");

        // Print all file names using iterative approach
        printAllNamesFiles(file);

        // Print all file names using recursive approach
        printAllNamesFilesWithRec(file);
    }

    /**
     * Iteratively prints the names of all files in the given directory and its subdirectories.
     * Uses a stack (Deque) for breadth-first traversal.
     */
    public static void printAllNamesFiles(File dir) {
        // Initialize the stack with all files and directories in the starting directory
        Deque<File> filesAndDirs = new ArrayDeque<>(List.of(dir.listFiles()));

        // Continue until there are no more files/directories to process
        while (!filesAndDirs.isEmpty()) {
            // Get the next file or directory from the stack
            File someFileOrDir = filesAndDirs.pop();

            if (someFileOrDir.isFile()) {
                // If it is a file, print its name
                System.out.println(someFileOrDir.getName());
            } else if (someFileOrDir.isDirectory()){
                // If it is a directory, add its contents to the stack
                filesAndDirs.addAll(Arrays.asList((someFileOrDir.listFiles())));
            }
        }
    }

    /**
     * Recursively prints the names of all files in the given directory and its subdirectories.
     * Uses depth-first traversal.
     */
    public static void printAllNamesFilesWithRec(File dir) {
        // Get all files and directories in the current directory
        File[] filesAndDirs = dir.listFiles();

        // Iterate through each file/directory
        for (File someFileOrDir : filesAndDirs) {
            if (someFileOrDir.isFile()) {
                // If it is a file, print its name
                System.out.println(someFileOrDir.getName());
            } else if (someFileOrDir.isDirectory()) {
                // If it is a directory, recursively process its contents
                printAllNamesFilesWithRec(someFileOrDir);
            }
        }
    }
}