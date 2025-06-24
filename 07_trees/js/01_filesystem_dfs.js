import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __path = path.dirname(__filename);

function printnames(dir) {
  for (const file of fs.readdirSync(dir).sort()) {
    const fullPath = path.join(dir, file);
    if (fs.statSync(fullPath).isFile()) {
      console.log(file);
    } else {
      printnames(fullPath);
    }
  }
}

printnames(path.join(__path, "pics"));
