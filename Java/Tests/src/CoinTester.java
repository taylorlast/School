public class CoinTester
{
   public static void 
main(String[] args){
	   
Coin c = new Coin(); 
for(int i = 0; i < 5; i++)
{
	c = new Coin(); 
	System.out.println(c.face); 
    }
System.out.println(c.h);
System.out.println(c.t);
}
   }