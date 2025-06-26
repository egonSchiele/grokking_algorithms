use std::fs;
use std::path::Path;

fn printnames(dir: &Path) {
    let entries = match fs::read_dir(dir) {
        Ok(entries) => entries,
        Err(_) => {
            return;
        }
    };

    let mut entries: Vec<_> = entries.filter_map(|e| e.ok()).collect();
    entries.sort_by_key(|e| e.file_name());

    for entry in entries {
        let path = entry.path();
        let file_type = match entry.file_type() {
            Ok(ft) => ft,
            Err(_) => {
                continue;
            }
        };

        if file_type.is_file() {
            println!("{}", entry.file_name().to_string_lossy());
        } else if file_type.is_dir() {
            printnames(&path);
        }
    }
}

fn main() {
    printnames(Path::new("pics"));
}
