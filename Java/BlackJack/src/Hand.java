/* ******************************************************
* Hand.java
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
 * 
 * @author ghyzel
 *
 */
public class Hand {
	
	/**
	 * The cards in the hand
	 */
	private Card [] cards;
	
	/**
	 * Creates an empty hand
	 */
	public Hand() {
		//Initializing an empty array. 
		//Calling cards.length on this array would return 0
		cards = new Card[0];		
	}

	/**
	 * Adds Card c to the hand
	 * 
	 * @param c card to be added
	 */
	public void addCard(Card c) {
		// Creates a new array and populates it with the instance variable array
		// Puts a card in the last spot of the new array since it's null then assigns it to instance variable.
		Card [] newCards = new Card [cards.length + 1];
		for (int i = 0; i < cards.length; i++) {
			newCards[i] = cards[i];
		}
		newCards[newCards.length-1] = c;
		cards = newCards;
	}
	
	/**
	 * @return number of cards in the hand
	 */
	public int size() {
		return cards.length;
	}
	
	/**
	 * Returns an array of all the cards in the hand
	 * 
	 * @return the cards in the hand
	 */
	public Card[] getCards() {
		// populates new array and returns that array of cards.
		Card [] array = new Card[cards.length];
		for (int i = 0; i < cards.length; i++) {
			array[i] = cards[i];
		}
		return array;
	}
	
	/**
	 * Empties the hand, and returns an array containing the discarded cards.
	 * 
	 * @return the discarded cards
	 */
	public Card[] emptyHand() {
		// creates a new array and empties that array.
		Card [] array = new Card[cards.length];
		for (int i = 0; i < cards.length; i++) {
			array[i] = cards[i];
		}
		cards = new Card[0];
		return array;
	}
	
	/**
	 * Returns a String representation of the hand
	 * 
	 * E.g.
	 * 
	 * "Empty Hand"
	 * "1. ACE OF SPADES\n2. QUEEN OF HEARTS"
	 * 
	 * @return a String representing the hand
	 */
	@Override
	public String toString() {
		if (cards.length == 0) {
			return "Empty Hand"; 
		}
		else
		{
			String str = "";
			// count is for the number before the card.
			int count = 1;
			for(int i = 0; i < cards.length; i++) {
				str = str + count + ". " + cards[i].toString() + "\n";
				count++;
			}
			System.out.println(str);
			return str;
		}
	}
}
