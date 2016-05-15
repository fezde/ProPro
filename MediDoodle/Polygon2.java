
import java.util.*;

class Polygon2{

  /**
  * Die Außenpunkte des Polygons
  **/
  Vector<Point> basePoints;
  
  Vector<Point> points;
  
  float minRad = 100;
  float maxRad = 1;
  
  int col=0;
  
  public Polygon2(){
    basePoints = new Vector<Point>();
  }
  
  /**
  * Fügt einen basePoint hinzu
  **/
  public void addBasePoint(Point p){
    this.basePoints.add(p);
  }
  public void addBasePoint(float x, float y){
    Point p = new Point(x,y);
    this.basePoints.add(p);
  }
  
  public Point getClosestPoint(float x, float y){
    for(int i=0; i<basePoints.size(); i++){
      float rad = (float)Math.sqrt(((x - basePoints.get(i).x)*(x - basePoints.get(i).x))+((y - basePoints.get(i).y)*(y - basePoints.get(i).y)));
      if(rad < 10) {
        
        return basePoints.get(i);
      }
    }
    return null;
  }
  
  
  
  /**
  * Berechnet alle Punkte (zum Zeichnen verwendete Punkte)
  **/
  public void calculateFill(){
    this.points = new Vector<Point>();
    
    // Den letzten basePoint brauchen wir doppelt, damit wir richtig zeichnen können
    //this.points.add(this.basePoints.get(this.basePoints.size()-1));
    
    // Jetzt hole die basePoints rein
    for(int i=0; i<this.basePoints.size(); i++){
      this.points.add(this.basePoints.get(i));
    }
    // Den letzten basePoint brauchen wir doppelt, damit wir richtig zeichnen können
    this.points.add(this.basePoints.get(0));
    
    // berechnen max und min abstand
    for(int i=0;i<points.size()-1; i++){
       Point n1 = points.get(i);
       Point n2 = points.get(i+1);
       
       float dist = (float)Math.sqrt(((n2.x - n1.x)*(n2.x - n1.x))+((n2.y - n1.y)*(n2.y - n1.y)));
       dist /= 12;
       if(dist < minRad){
          minRad = dist;
       }
       if(dist > maxRad){
         maxRad = dist;
       }
    }
    
    // Hier beginnt die Berechnung
    int currentPointIdx = 0;
    for(int i=0;i<1000;i++){
      Point neu = new Point();
      Point current = points.get(currentPointIdx);
      
      //Die nächste beiden
      int nextOffset = 1;
      float dist = 0;
      while(dist<12){
        if(currentPointIdx+nextOffset+1 > points.size()-1){
          return;
        }
        Point n1 = points.get(currentPointIdx+nextOffset);
        Point n2 = points.get(currentPointIdx+nextOffset+1);
        
        
        // Berechne neuen Punkt
        float alpha = (float)Math.atan((n2.y - n1.y) / (n2.x - n1.x));
        //float rad = (float)Math.sqrt(((o2_x - o1_x)*(o2_x - o1_x))+((o2_y - o1_y)*(o2_y - o1_y)));
        float rad = (float)Math.random()*(maxRad-minRad) + minRad;
        
        
        if(n1.x > n2.x){
          neu.x = n1.x - (float)Math.cos(alpha) * rad;
          neu.y = n1.y - (float)Math.sin(alpha) * rad;
        }else{
          neu.x = n1.x + (float)Math.cos(alpha) * rad;
          neu.y = n1.y + (float)Math.sin(alpha) * rad;
        }
        dist = (float)Math.sqrt(((neu.x - current.x)*(neu.x - current.x))+((neu.y - current.y)*(neu.y - current.y)));
        nextOffset++;
        //System.out.println("Next Offset: " + nextOffset);
      }
      this.points.add(neu);
      currentPointIdx++;
    }
  }
}