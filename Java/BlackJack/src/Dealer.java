/* ******************************************************
* Dealer.java
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
 * The Dealer in your game of BlackJack. Draws until he/she gets 17 points or has 5 cards.
 *
 */
public class Dealer {
	/**
	 * The dealers hand
	 */
	Hand hand;
	
	/**
	 * Construct a new dealer with an empty hand
	 */
	public Dealer() {
		hand = new Hand();
	}
	
	/**
	 * Dealer draws a card if his hand is worth less than 17 points and has less than 5 cards in in his hand.
	 * 
	 * @param deck
	 * @return
	 */
	public Card playTurn(Deck deck) {
		// checks to see if the value of the dealer's hand is less than 17 and if they have 5 or less cards.
		if (BlackJack.getValueOfHand(hand) < 17 && hand.getCards().length < 5) {
			Card c = deck.draw();
			hand.addCard(c);
			return c;
		}
			return null;
	}
	
	/**
	 * A method to check if the dealer has busted
	 * @return boolean true if the dealer has busted
	 */
	public boolean busted() {
		// if hand is greater than 21, the player busts
		if (BlackJack.getValueOfHand(hand) > 21) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/**
	 * A method to check if the dealer will draw a card.
	 * @return
	 */
	public boolean isDone() {
		if (BlackJack.getValueOfHand(hand) < 17 && hand.getCards().length < 5) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/**
	 * Returns the dealers cards to the deck
	 * @param d Deck to return the cards to
	 */
	public void returnCardstoDeck(Deck d) {
		// adds cards to bottom so it doesn't discard them then it discards the hand.
		for (int i = 0; i < hand.getCards().length; i++) {
			d.addToBottom(hand.getCards()[i]);
		}
		hand.emptyHand();
	}
	/**
	 * @return Hand the dealer's hand
	 */
	public Hand getHand() {
		return hand;
	}
}

