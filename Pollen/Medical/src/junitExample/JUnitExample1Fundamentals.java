
package junitExample;

import static org.junit.Assert.*;
import org.junit.Test;

public class JUnitExample1Fundamentals {
	
	/* We need @Test to identify the method as a test */
	@Test
	public void oneMaximum() { 
		int expectedResults = 20; 
		assertEquals(expectedResults,  AuxMath.maximum(10, 20)); 
	} 

	@Test
	public void twoMinimum() { 
		int expectedResults = 5; 
		assertTrue(expectedResults==AuxMath.minimum(30, 5)); 
	}

	/* Beware: if you don't place assertion it does not fail! */
	@Test
	public void missingAssertionWrong() {
		int expectedResults = 30;
		int result = AuxMath.minimum(30, 5);
		/* MISSING ASSERTION: this is wrong but it passes :) */
	}
	
	/* Multiple assertions OK */
	@Test
	public void multipleAssertions() { 
		int expectedResults = 5; 
		assertTrue(expectedResults==AuxMath.minimum(30, 5));
		assertFalse(10==AuxMath.maximum(20, 10));
	}
	
	/* Checking an exception is thrown */
	@Test(expected = NumberFormatException.class)
	public void invalidParsing() {
		String value = "ShouldBeANumber"; // try "10"
		Integer.parseInt(value);
	}
	
	/* We can have private methods that support tests */
}