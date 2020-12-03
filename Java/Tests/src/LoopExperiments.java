import java.util.Scanner;

public class LoopExperiments {

	public static void main(String[] args) {

		String s = "";
		char myChar ='b';
		int j = 0;
		for (int i = 0; i < 2; i++) {
			j = 0;
			do { 
				s += myChar;
				j++;
			} while (j < 3);
			if (i == 0)
				myChar = 'c';
			else if (i == 1)
				myChar = 'd';
			else myChar = 'e';
		}
		System.out.println(myChar);
		System.out.println(j);
		System.out.println(s);
	
	}
	}
