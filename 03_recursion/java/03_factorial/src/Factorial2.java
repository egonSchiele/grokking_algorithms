public class Factorial2 {
    public static void main(String[] args) {
        Factorial2 factorial2 = new Factorial2();
        System.out.println("The factorial of 5 is " + factorial2.getFactorial(5));
    }

    public int getFactorial(int number) {
        if (isZeroOrOne(number)) {
            return 1;
        }

        return number * getFactorial(number - 1);
    }

    public boolean isZeroOrOne(int number) {
        if (number > 1) {
            return false;
        }
        return true;
    }
}
