package junitExample;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class JUnitExample3FixingStaticProblem {

	/* Following method will be executed before each test */
	@Before
	public void beforeEachTest() {
		ComputeNames.names.clear();
	}
	
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
