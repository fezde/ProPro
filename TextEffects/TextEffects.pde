


void setup() {
  size(800, 400);
  smooth();
  PFont tFont = createFont("WOBBLES_.ttf", 50);  
  PGraphics result = txtFxBackdropText("Äüch mit Ömlautß", tFont, color(0, 255, 0), color(255, 255, 255), 7);
  image(result, 10, 10);
}