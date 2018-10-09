package junitExample;
import java.util.ArrayList;

public class ComputeNames {
	public static ArrayList<String> names = new ArrayList<String>();

	public static void generateNames(String baseName, int startNumber, int endNumber) {
		for (int i = startNumber; i <= endNumber; i++) {
			names.add(baseName + i + ".txt");
		}
	}
}
