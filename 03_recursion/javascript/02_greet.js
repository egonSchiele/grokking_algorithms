/**
 * Displays a message to the console
 * @param {string} name Name
 */
function greet2(name) {
  console.log("how are you, " + name + "?");
}

/**
 * Displays a message to the console
 */
function bye() {
  console.log("ok bye!");
}

/**
 * Displays a message to the console
 * @param {string} name Name
 */
function greet(name) {
  console.log("hello, " + name + "!");
  greet2(name);
  console.log("getting ready to say bye...");
  bye();
}

greet("adit");
