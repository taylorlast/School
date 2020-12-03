public class OverloadTest{

public static void aMethod(int x){
  System.out.println("This is version 1");
}
public static void aMethod(double x){
  System.out.println("This is version 2");
}

public static void main(String[] args) {
  aMethod(4.0);
}
}
