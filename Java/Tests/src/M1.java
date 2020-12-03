public class M1{
private int value;
public M1(){
	this(0);
}
public M1(int v){
	this (v,v+1);
}
public M1(int v, int v2){
	this (v, v2, v+v2);
}
public M1(int v, int v2, int v3){
	value = v + v2 + v3;
}
public static void main(String[] args){
		M1  x = new M1();
		M1  y = new M1();
		System.out.println(x.value);
		System.out.println(y.value);
}}
