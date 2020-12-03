/* ******************************************************
* BlackJack.java
* Author: Taylor Last
* Submission Date: [4/29/19]
*
* Purpose: Creates a game of blackjack using object-oriented programming.
* Draws a hand for the player and draws a hand for the dealer. If the player
* busts, the dealer wins and if the dealer busts, the player wins. If neither bust,
* the higher valued hand wins.
*
* Statement of Academic Honesty:
*
* The following code represents my own work. I have neither
* received nor given inappropriate assistance. I have not copied
* or modified code from any source other than the course webpage
* or the course textbook. I recognize that any unauthorized
* assistance or plagiarism will be handled in accordance with
* the University of Georgia's Academic Honesty Policy and the
* policies of this course. I recognize that my work is based
* on an assignment created by the Department of Computer
* Science at the University of Georgia. Any publishing
* or posting of source code for this project is strictly
* prohibited unless you have written consent from the Department
* of Computer Science at the University of Georgia.
*/
//*******************************************************

/**
 * Class representing a single player blackjack game
 */
public class BlackJack {
	
	private Deck deck;
	private Dealer dealer;
	private Player player;


	/**
	 * Constructs and prepares for a new game of BlackJack.
	 * Creates player, dealer and deck objects then shuffles
	 * the deck and gives both the dealer and player two cards.
	 */
	public BlackJack() {
		player = new Player();
		dealer = new Dealer();
		deck = new Deck();
		
		Hand playerHand = player.getHand();
		Hand dealerHand = dealer.getHand();
		
		deck.shuffle();
		
		// Deals the cards.
		playerHand.addCard(deck.draw());
		playerHand.addCard(deck.draw());
		
		dealerHand.addCard(deck.draw());
		dealerHand.addCard(deck.draw());
	}
	/**
	 * Restarts in a few steps
	 * 1. The Player and dealer return their cards to the deck.
	 * 2. The deck is shuffled.
	 * 3. Both the player and the dealer receive two cards drawn form the top of the deck.
	 */
	public void restart() {
		player.returnCardstoDeck(deck);
		dealer.returnCardstoDeck(deck);
		
		deck.shuffle();
		
		Hand playerHand = player.getHand();
		Hand dealerHand = dealer.getHand();
		
		// deals the new cards.
		playerHand.addCard(deck.draw());
		playerHand.addCard(deck.draw());
		
		dealerHand.addCard(deck.draw());
		dealerHand.addCard(deck.draw());
	}
	/**
	 * Returns the value of a card in a standard game of Blackjack based on the type of the card
	 * ex. An Ace would return 1, a 2 would return 2... 
	 * @param c card whose value is extracted
	 * @return value of the card
	 */
	public static int getValueOfCard(Card c) {
		//returns the value of each card.
		if (c.getType() == Card.Type.ACE) {
			return 1;
		}
		else if (c.getType() == Card.Type.TWO) {
			return 2;
		}
		else if (c.getType() == Card.Type.THREE) {
			return 3;
		}
		else if (c.getType() == Card.Type.FOUR) {
			return 4;
		}
		else if (c.getType() == Card.Type.FIVE) {
			return 5;
		}
		else if (c.getType() == Card.Type.SIX) {
			return 6;
		}
		else if (c.getType() == Card.Type.SEVEN) {
			return 7;
		}
		else if (c.getType() == Card.Type.EIGHT) {
			return 8;
		}
		else if (c.getType() == Card.Type.NINE) {
			return 9;
		}
		else if (c.getType() == Card.Type.TEN) {
			return 10;
		}
		else if (c.getType() == Card.Type.JACK) {
			return 10;
		}
		else if (c.getType() == Card.Type.QUEEN) {
			return 10;
		}
		else if (c.getType() == Card.Type.KING) {
			return 10;
		}
		else {
			return -1;
		}
		
	}
	/**
	 * Returns the maximum value of the hand that does not result in a bust
	 * @param h Hand whose value is returned
	 * @return value of h
	 */
	public static int getValueOfHand(Hand h) {
		Card[] cards = h.getCards();
		int sum = 0;
		for (int i = 0; i < cards.length; i++) {
			// if the card is not an ace, the value is added (Aces added later)
			if (cards[i].getType() != Card.Type.ACE) {
				sum += BlackJack.getValueOfCard(cards[i]);
			}
		}
		for (int i = 0; i < cards.length; i++) {
			// If the value is an ace and 11 busts, then 1 is added.
			if (cards[i].getType() == Card.Type.ACE && sum > 10) {
				sum++;
			}
			// If the value is an ace and 11 doesn't bust, then 11 is added.
			if (cards[i].getType() == Card.Type.ACE && sum <= 10) {
				sum+=11;
			}
		}
		return sum;
	}

	/**
	 * @return Deck used to play
	 */
	public Deck getDeck() {
		return deck;
	}
	
	/**
	 * @return Dealer of the game
	 */
	public Dealer getDealer() {
		return dealer;
	}
	
	/**
	 * @return Player playing the blackjack game
	 */
	public Player getPlayer() {
		return player;
	}

}
