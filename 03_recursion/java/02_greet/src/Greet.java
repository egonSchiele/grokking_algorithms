public class Greet {

    private static void greet2(String name) {
        System.out.println("how are you, " + name + "?");
    }

    private static void bye() {
        System.out.println("ok bye!");
    }

    private static void greet(String name) {
        System.out.println("hello, " + name + "!");
        greet2(name);
        System.out.println("getting ready to say bye...");
        bye();
    }

    public static void main(String[] args) {
        greet("adit");
    }
}