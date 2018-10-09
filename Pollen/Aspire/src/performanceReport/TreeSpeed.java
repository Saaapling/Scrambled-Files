package performanceReport;

import java.util.Random;
import java.util.TreeMap;

import tree.PolymorphicBST;

/**
 * Provides examples on how to get timing information. 
 * Use this example as a starting point while developing your own
 * timing experiments (those associated with the report).  Your
 * report should be in the file performanceReport.docx.
 * @author cmsc132
 *
 */
public class TreeSpeed {

	public static void main(String[] args) {
		timePolymorphicTree(100);
		timePolymorphicTree(500);
		timePolymorphicTree(1000);
		timePolymorphicTree(2500);
		timePolymorphicTree(5000);
		timeTreeMap(100);
		timeTreeMap(500);
		timeTreeMap(1000);
		timeTreeMap(2500);
		timeTreeMap(5000);
	}
	 
	private static void timePolymorphicTree(int x){
		Random r;
		long time;
		PolymorphicBST<Integer,Integer> myTree;

		// Build tree with 5000 random numbers between 1 and 500000
		r = new Random(100L); 
		time = System.nanoTime();
		myTree = new PolymorphicBST<Integer,Integer>();
		for (int i = 1; i<x; i++) {
			int v = r.nextInt(500000); 
			myTree.put(v, i);
		}
		time = System.nanoTime() - time;
		System.out.println("PolymorphicBST Time(msec) = "+time);

		// Build tree with 5000 numbers in sequence
		time = System.nanoTime();
		myTree = new PolymorphicBST<Integer,Integer>();
		for (int i = 1; i<x; i++) {
			myTree.put(i, i);
		}
		time = System.nanoTime() - time;
		System.out.println("PolymorphicBST Time(msec) = "+time);
	}

	private static void timeTreeMap(int x){
		Random r;
		long time;
		TreeMap<Integer,Integer> myTree;

		// Build tree with 5000 random numbers between 1 and 500000
		r = new Random(100L); 
		time = System.nanoTime();
		myTree = new TreeMap<Integer,Integer>();
		for (int i = 1; i<x; i++) {
			int v = r.nextInt(500000); 
			myTree.put(v, i);
		}
		time = System.nanoTime() - time;
		System.out.println("TreeMap Time(msec) = "+time);

		// Build tree with 5000 numbers in sequence
		time = System.nanoTime();
		myTree = new TreeMap<Integer,Integer>();
		for (int i = 1; i<x; i++) {
			myTree.put(i, i);
		}
		time = System.nanoTime() - time;
		System.out.println("TreeMap Time(msec) = "+time);
	}
}
