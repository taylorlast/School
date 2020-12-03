
public class StatDriver {

	public static void main(String[] args) {
		double[] data1 = {};
		double[] data2 = { 25 };
		float[] data3 = {};
		float[] data4 = { 25 };
		int[] data5 = {};
		int[] data6 = { 50 };
		long[] data7 = {};
		long[] data8 = { 12 };
		Stat stat1 = new Stat();
		stat1.append(data1);
		stat1.append(data2);
		stat1.append(data3);
		stat1.append(data4);
		stat1.append(data5);
		stat1.append(data6);
		stat1.append(data7);
		stat1.append(data8);
		data1 = null;
		stat1.append(data1);
		System.out.println("stat1 data = " + stat1.toString());
		System.out.println("stat1 min = " + stat1.min());
		System.out.println("stat1 max = " + stat1.max());
		System.out.println("stat1 average = " + stat1.average());
		System.out.println("stat1 mode = " + stat1.mode());
		System.out.println("stat1 variance = " + stat1.variance());
		System.out.println("stat1 standard deviation = " + stat1.standardDeviation() + "\n");
	}

}
