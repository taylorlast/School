public class Coin
{	
   public boolean face;
   public static int h = 0; 
   public static int t = 0; 

   public Coin(){
java.util.Random r =
    new java.util.Random();
face = r.nextBoolean();
if(face) 
    h++;
else 
    t++; 
   }
}

