// Created by Rebecca Fiebrink 2015
//
//  Changes:
//  [Brizo] Sep/2016 - added radius, radiusSqr, c, sqrDistanceToPoint(), 
//colorAsMoving(), moved color initialization to initColor()

public class Example {
   int x, y;
   int r, g, b, a;
   int c;  //  class
   boolean isTesting;
   float radius;
   float radiusSqr;
   
   public Example(int x, int y, int c, boolean isTesting) {
      this.x = x;
      this.y = y;
      this.isTesting = isTesting;
      
      radius = 10;
      radiusSqr = radius*radius;
      
      a = (isTesting ? 130 : 255);
      
      this.c = c;
      
     //Set color according to class
     initColor();
   }
   
   public void draw() {
       noStroke();
       fill(r,g,b,a);
       if (isTesting) {
         ellipse(x, y, radius/2., radius/2.);
       } else {
         ellipse(x, y, radius, radius);

       }
   }

   public void initColor() {
     a = (this.isTesting ? 130 : 255);
     if (this.c == 1) {
       r = 255;
       g = 0;
       b = 0;
     } else if (this.c == 2) {
       r = 0;
       g = 164;
       b = 255;
     } else if (this.c == 3) {
       r = 0;
       g = 232;
       b = 124;
     } else if (this.c ==4) {
       r = 232;
       g = 224;
       b = 0;
     } else if (this.c ==5) {
       r= 232;
       g = 0;
       b= 200;
     } else if (this.c ==6) {
       r= 37;
       g= 3;
       b=  232;
     } else if (this.c ==7) {
       r = 255;
       g = 148;
       b = 3;
     } else if (this.c ==8) {
       r = 255;
       g = 255;
       b = 255;
     } else {
       r = 235;
       g = 255;
       b = 136;
     } 
   }

   public void colorAsMoving() {
       a = 125;
       r = 255;
       g = 255;
       b = 255;
   }

   //  returns square of the distance of this point to (p_x,p_y)
   public float sqrDistanceToPoint(int p_x, int p_y) {
       return (p_x-x)*(p_x-x) + (p_y-y)*(p_y-y);
   }
}
