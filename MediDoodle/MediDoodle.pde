import java.util.*;



Vector<Point> punkte = new Vector<Point>();
Vector<Polygon2> polys = new Vector<Polygon2>();
Point poi = null;

Polygon2 p2 = new Polygon2();

int coloringMode=0;
boolean help = true;

void setup(){
  //size(500,500);
  fullScreen(P2D);
  colorMode(RGB);
  smooth();
  
  
}



void drawPolygon2(Polygon2 p){
  if(p.points == null){
    p.calculateFill();
  }
  for(int i=0; i<p.points.size()-1; i++){
    line(p.points.get(i).x, p.points.get(i).y, p.points.get(i+1).x, p.points.get(i+1).y);
  }
  if(coloringMode == 1){
    for(int i=0; i<p.basePoints.size(); i++){
      ellipse(p.basePoints.get(i).x,p.basePoints.get(i).y,5,5);
    }
  }
}

void draw(){
  background(128);
  
  
  if(punkte.size()<3){
    stroke(255,0,0);
  }else{
    stroke(0,255,0);
  }
  strokeWeight(3);
  for(int i=0; i<punkte.size(); i++){
    line(punkte.get(i).x, punkte.get(i).y, punkte.get((i+1) % punkte.size()).x, punkte.get((i+1) % punkte.size()).y);
  }
  
  stroke(0,0,0);
  strokeWeight(1);
  for(int i=0; i<polys.size(); i++){
    if(coloringMode == 1){
      stroke(polys.get(i).col);
      fill(polys.get(i).col);
    }
    drawPolygon2(polys.get(i));
  }
  if(help){
    drawHelp();
  }else{
    poi = null;
    fill(255);
    for(int i=0; i<polys.size(); i++){
      poi = polys.get(i).getClosestPoint(mouseX, mouseY);
      if(poi != null){
        ellipse(poi.x, poi.y, 10, 10);
        break;
      }
    }
  } 
}

void drawHelp(){
  fill(255);
  rect(50,50,400,200);
  
  fill(0);
  text("Help: ", 60 , 70);
  
  text("Click with mouse to add points to a new polygon \n"+
    "ENTER or SPACE: Add Polygon to MediDoodle \n"+
    "C: Toggle Coloring Mode for easy distinction of different polygons \n"+
    "S: Save Image to Disk \n"+
    "H: Toggle this help screen \n"+
    "Z: Undo (remove last added Polygon) \n" + 
    "ESC: End Programm", 60 , 85);
  
  fill(255);
}

void keyPressed() {
  println("Key: " + keyCode);
  
  // ENTER or SPACE
  if(keyCode == 32 || keyCode == 10){
    if(punkte.size()>2){
      Polygon2 p = new Polygon2();
      p.col = color(millis()%255,(int)(Math.random()*255),(int)(Math.random()*255));
      for(int i=0; i<punkte.size(); i++){
        p.addBasePoint(punkte.get(i).x, punkte.get(i).y);
      }
      polys.add(p);
      punkte = new Vector<Point>();
    }
  }
  // BACKSPACE, ENTF
  else if(keyCode == 8 || keyCode == 127){
    //Löscht aktuelle Punkte
    punkte = new Vector<Point>();
  }
  // c
  else if(keyCode == 67 ){
    //Löscht aktuelle Punkte
    coloringMode = (coloringMode+1)%2;
  }
  // s
  else if(keyCode == 83){
    //Speichert das Bild
    save("MediDoodeling_"+millis()+".png");
  }
  // h
  else if(keyCode == 72){
    //Zeigt die Hilfe
    help = !help;
  }
  // Z
  else if(keyCode == 90){
    //UNDO last poly
    polys.remove(polys.size()-1);
  }
}

void mousePressed(){
  if(poi != null) {
    println("Add existing");
    punkte.add(poi);
  }else{
    println("Addng new one");
    Point pu = new Point();
    pu.x = mouseX;
    pu.y = mouseY;
    punkte.add(pu);
  }
}