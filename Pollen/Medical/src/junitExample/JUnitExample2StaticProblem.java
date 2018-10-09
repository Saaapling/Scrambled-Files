package junitExample;

import static org.junit.Assert.*;
import org.junit.Test;

public class JUnitExample2StaticProblem {
	
	@Test
	public void oneNames() {
		ComputeNames.generateNames("test", 2, 3);
		System.out.println(ComputeNames.names);
		assertEquals(ComputeNames.names.toString(), "[test2.txt, test3.txt]");
	} 
	
	/* Why does it fails if it is the same test as above? */
	@Test
	public void twoNames() {
		ComputeNames.generateNames("test", 2, 3);
		System.out.println(ComputeNames.names);
		assertEquals(ComputeNames.names.toString(), "[test2.txt, test3.txt]");
	} 
}
