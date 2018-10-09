package tests;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import blackjack.Blackjack;
import blackjack.Card;


/**
 * Please put your own test cases into this file, so they can be tested
 * on the server.
*/

public class StudentTests {
	
	public void cardEvaluationDriver() {
		Random randomGenerator = new Random(1L);
		Blackjack tester = new Blackjack(randomGenerator, 1);
		ArrayList <Card> cards = new ArrayList<Card>();
		//tester.getCardEvaluation(cards);
	}
	
	public static void main(String[]args) {
		
	}
}