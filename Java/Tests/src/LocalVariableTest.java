
public class LocalVariableTest {

	public int value = 1; 
	public int methodOne(){
		int value = 2;
		this.value = 3000;
		return this.value;  //Which value variable does this refer to?
		}
	public int methodTwo() {
	value = 3;
	return value;
	}
}
