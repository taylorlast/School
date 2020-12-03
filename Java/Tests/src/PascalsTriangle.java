
public class PascalsTriangle {

	public static void main(String[] args) {
		
		int [][]array = new int[10][];

		for (int i = 0; i < array.length; i++) {
			array [i] = new int[i+1];
			
			for (int j = 0; j < array[i].length; j++) {
				
				// At a particular i, j value. Need to assign an appropriate value to triange[i][j]
				if (j == 0 || j == array[i].length - 1) {
					array [i][j] = 1;
					System.out.print(array[i][j] + " ");
				}
				
				else {
					array[i][j] = array[i-1][j] + array[i-1][j-1];
					System.out.print(array[i][j] + " ");
				}
			}
			System.out.println();
		}
	}

}
