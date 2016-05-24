


void setup() {
  size(800, 400);
  smooth();
  background(0);
  PFont tFont = createFont("Arial Black", 50);  
  PGraphics result = txtFxBackdropText("Text Effects", tFont, color(0, 255, 0), color(255, 255, 255), 7);
  image(result, width/2 -result.width/2, height/2 - result.height/2);
}