package blackjack;
import java.util.*;

public class Blackjack implements BlackjackEngine {

	private int account, bet, numberOfDecks, gameStatus;
	private Random randomGenerator;
	private ArrayList<Card> cardDeck, playerCards, dealerCards;

	/**
	 * Constructor you must provide.  Initializes the player's account 
	 * to 200 and the initial bet to 5.  Feel free to initialize any other
	 * fields. Keep in mind that the constructor does not define the 
	 * deck(s) of cards.
	 * @param randomGenerator
	 * @param numberOfDecks
	 */

	public Blackjack(Random randomGenerator, int numberOfDecks) {
		this.numberOfDecks = numberOfDecks;
		this.randomGenerator = randomGenerator;
		account = 200;
		bet = 5;
	}

	public int getNumberOfDecks() {
		return numberOfDecks;
	}

	public void createAndShuffleGameDeck() {
		//Creates the deck
		cardDeck=new ArrayList<Card>();
		for (int i = 0; i < numberOfDecks; i++) {
			for (CardSuit suit:CardSuit.values()) {
				for (CardValue value:CardValue.values()) {
					cardDeck.add(new Card(value, suit));
				}
			}
		}
		//Shuffles the deck
		Collections.shuffle(cardDeck, randomGenerator);
	}

	public Card[] getGameDeck() {
		return cardDeck.toArray(new Card[cardDeck.size()]);
	}

	public void deal() {
		playerCards = new ArrayList<Card>();
		dealerCards = new ArrayList<Card>();
		gameStatus = 8;

		createAndShuffleGameDeck();							//Card 1 (Player, Face-Up)
		playerCards.add(cardDeck.get(0));
		cardDeck.remove(0);

		dealerCards.add(cardDeck.get(0));					//Card 2 (Dealer, Face-Down)
		cardDeck.remove(0);
		dealerCards.get(0).setFaceDown();

		playerCards.add(cardDeck.get(0));					//Card 3 (Player, Face-Up)
		cardDeck.remove(0);

		dealerCards.add(cardDeck.get(0));					//Card 4 (Dealer, Face-Up)
		cardDeck.remove(0);

		account -= bet;
	}

	public Card[] getDealerCards() {
		return dealerCards.toArray(new Card[dealerCards.size()]);
	}

	public int[] getDealerCardsTotal() {
		return getCardTotal(dealerCards);
	}

	public int getDealerCardsEvaluation() {
		return getCardEvaluation(dealerCards);
	}

	public Card[] getPlayerCards() {
		return playerCards.toArray(new Card[playerCards.size()]);
	}

	public int[] getPlayerCardsTotal() {
		return getCardTotal(playerCards);
	}

	public int getPlayerCardsEvaluation() {
		return getCardEvaluation(playerCards);
	}

	public void playerHit() {
		playerCards.add(cardDeck.get(0));
		cardDeck.remove(0);
		if (getCardEvaluation(playerCards) == 3) {
			gameStatus = 6;	
		}
	}

	public void playerStand() {
		boolean end = false;

		//Dealing card for the dealer
		dealerCards.get(0).setFaceUp();
		while (getDealerCardsTotal()!=null && getDealerCardsTotal()[getDealerCardsTotal().length-1]<16) {
			dealerCards.add(cardDeck.get(0));
			cardDeck.remove(0);
		}

		//If the dealer busts
		if (getDealerCardsEvaluation() == 3) {
			gameStatus = 7;
			end=true;
		}

		//What if blackjack??
		if (getPlayerCardsEvaluation() == 4) {
			if (getDealerCardsEvaluation() == 4) {
				gameStatus = 1;										//Player and Dealer have Blackjack, Draw
				account += bet;
			}else {
				gameStatus = 7;										//Player Blackjack, player wins
				account += (bet*2);
			}
		}else {
			if (getDealerCardsEvaluation() == 4) {
				gameStatus = 6;										//Dealer Blackjack, player loses
			}
		}
		
		//Comparing dealer and player hands
		if (!end && gameStatus == 8) {
			int dealerHand = getDealerCardsTotal()[getDealerCardsTotal().length-1];
			int playerHand = getPlayerCardsTotal()[getPlayerCardsTotal().length-1];
			if (dealerHand>playerHand) {							//Dealer Wins
				gameStatus = 6;
			}else if (dealerHand<playerHand) {						//Player Wins
				gameStatus = 7;
				account += (bet*2);
			}else {													//Draw
				gameStatus = 1;
				account += bet;
			}
		}
	}

	public int getGameStatus() {
		return gameStatus;
	}

	public void setBetAmount(int amount) {
		bet = amount;
	}

	public int getBetAmount() {
		return bet;
	}

	public void setAccountAmount(int amount) {	
		account = amount;
	}

	public int getAccountAmount() {
		return account;
	}

	//Creates a integer possibility array for a generic hand (dealer or player)
	private int[] getCardTotal(ArrayList<Card> cards) {
		//Add all the possible values to cardValues
		int[] values = {0,0};
		boolean acePresent = false;

		//Generates the possible sums for the cards
		for (Card current : cards) {
			if (current.getValue().getValue().equals("1")) {
				if (!acePresent) {							//If there has not been dealt an ACE
					values[0] += 1;
					values[1] += 11;
					acePresent=true;
				}else {
					values[0] += 1;
				}
			}else {
				values[0] += current.getValue().getIntValue();
				values[1] += current.getValue().getIntValue();
			}
		}

		if (values[0] > 21) {								//0 Possibilities
			return null;
		}
		if (values[1] > 21 || (values[0] == values[1])) {	//1 Possibility
			return new int[] {values[0]};
		}
		return values;										//2 Possibilities
	}

	//Evaluates a generic hand (dealer or player)
	private int getCardEvaluation(ArrayList<Card> cards) {
		int[] values = getCardTotal(cards);
		if (values == null) 								//Bust
			return 3;
		if (values[values.length-1] ==21) {
			if (cards.size() == 2) {
				return 4;									//Blackjack
			}else {
				return 5;									//Has 21
			}
		}
		return 2;											//Less than 21
	}
	/* Feel Free to add any private methods you might need */
}