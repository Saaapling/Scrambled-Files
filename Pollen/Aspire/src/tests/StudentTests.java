package tests;

import org.junit.*;

import tree.PlaceKeysValuesInArrayLists;
import tree.PolymorphicBST;

public class StudentTests{
	
	@Test
	public void listBasics() {
		String answer = "";
		
		PolymorphicBST<Integer,String> ptree = new PolymorphicBST<Integer,String>();
		ptree.put(25, "25");
		ptree.put(17, "17");
		ptree.put(35, "35");
		ptree.put(32, "32");
		ptree.put(40, "40");
		ptree.put(13, "13");
		ptree.put(11, "11");
		ptree.put(19, "19");
		ptree.put(37, "37");
		ptree.put(45, "45");
		ptree.put(10, "10");
		ptree.put(12, "12");
		ptree.put(5, "5");
		ptree.put(2, "2");
		ptree.put(41, "41");
		
		answer += ptree.toString();
		answer += "\nSize: " + ptree.size();
		answer += "\nHeight: " + ptree.height();
		
		ptree.remove(25);
		answer += "\n" + ptree.toString();
		ptree.remove(12);
		answer += "\n" + ptree.toString();
		ptree.remove(40);
		answer += "\n" + ptree.toString();
		
		answer += "\nSize: " + ptree.size();
		answer += "\nHeight: " + ptree.height();
		System.out.println(answer);
	}
	
	@Test
	public void subMap() {
		String answer = "";
		
		PolymorphicBST<Integer,String> ptree = new PolymorphicBST<Integer,String>();
		ptree.put(25, "25");
		ptree.put(17, "17");
		ptree.put(35, "35");
		ptree.put(32, "32");
		ptree.put(40, "40");
		ptree.put(13, "13");
		ptree.put(10, "10");
		ptree.put(11, "11");
		ptree.put(19, "19");
		ptree.put(37, "37");
		ptree.put(45, "45");
		ptree.put(12, "12");
		ptree.put(5, "5");
		ptree.put(2, "2");
		ptree.put(41, "41");
		ptree.put(25, "Twenty Five");

		answer += ptree.toString();
		answer += "\nSize: " + ptree.size();
		answer += "\nHeight: " + ptree.height();
		
		PlaceKeysValuesInArrayLists<Integer, String> task = new PlaceKeysValuesInArrayLists<Integer, String>();
		ptree.rightRootLeftTraversal(task);
		answer += "\n" + task.getValues().toString();
		
		PolymorphicBST<Integer, String> subTree = ptree.subMap(11, 40);
		answer += "\n\n" + subTree.toString();
		answer += "\nSize: " + subTree.size();
		answer += "\nHeight: " + subTree.height();
		
		ptree.clear();
		ptree.put(5, "5");
		ptree.put(3, "3");
		ptree.put(7, "7");
		answer += "\n\n\n" + ptree.toString();
		answer += "\nSize: " + ptree.size();
		answer += "\nHeight: " + ptree.height();
		
		subTree = ptree.subMap(5, 7);
		answer += "\n\n" + subTree.toString();
		answer += "\nSize: " + subTree.size();
		answer += "\nHeight: " + subTree.height() + "\n";
		
		task = new PlaceKeysValuesInArrayLists<Integer, String>();
		ptree.rightRootLeftTraversal(task);
		answer += task.getValues().toString();
		
		//System.out.println(answer);
	}
}