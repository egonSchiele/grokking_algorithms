import org.junit.Assert;
import org.junit.Test;

public class Factorial2Test {
    @Test
    public void testIsZeroOrOne() {
        Factorial2 factorial2 = new Factorial2();

        Assert.assertEquals(true, factorial2.isZeroOrOne(0));
        Assert.assertEquals(true, factorial2.isZeroOrOne(1));
        Assert.assertEquals(false, factorial2.isZeroOrOne(5));
    }

    @Test
    public void testFactorial() {
        Factorial2 factorial2 = new Factorial2();

        Assert.assertEquals(120, factorial2.getFactorial(5));
    }
}
