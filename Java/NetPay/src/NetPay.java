import java.util.Scanner;

public class NetPay {
	
	static final double FEDERAL_TAX_PERCENT = 10.00;
	static final double STATE_TAX_PERCENT = 4.5;
	static final double SS_PERCENT = 6.2;
	static final double MEDICARE_PERCENT = 1.45;
	static final double PAY_PER_HOUR = 7.25;

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Enter in how many hours per week were worked");
		int hrsPerWeek = scan.nextInt();
		
		double grossPay = (hrsPerWeek * PAY_PER_HOUR);
		
		//Deductions
		double fedTaxDeduction = (FEDERAL_TAX_PERCENT * grossPay)/100;
		double stateTaxDeduction = (STATE_TAX_PERCENT * grossPay)/100;
		double ssDeduction = (SS_PERCENT * grossPay)/100;
		double medicareDeduction = (MEDICARE_PERCENT * grossPay)/100;
		
		double netPay = grossPay - (fedTaxDeduction + stateTaxDeduction +
				ssDeduction + medicareDeduction);
		
		System.out.println("Hours Per Week: \t\t" + hrsPerWeek);
		System.out.println("Gross Pay: \t\t\t" + grossPay);
		System.out.println("Net Pay: \t\t\t" + netPay);
		System.out.println();
		System.out.println("Deductions");
		System.out.println("Federal: \t\t\t" + fedTaxDeduction);
		System.out.println("State: \t\t\t\t" + stateTaxDeduction);
		System.out.println("Social Security: \t\t" + ssDeduction);
		System.out.println("Medicare: \t\t\t" + medicareDeduction);

	}

}
