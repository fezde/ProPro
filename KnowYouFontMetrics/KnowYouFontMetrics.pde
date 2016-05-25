size(600,400);
background(125);

PVector textPos = new PVector(20,100);
String text = "Äll I know iß good;";

PFont font = createFont("Arial Black",50);
textSize(50);

fill(0);
text(text, textPos.x, textPos.y);

strokeWeight(3);

stroke(0);
line(textPos.x, 0, textPos.x, height);
line(0, textPos.y, width, textPos.y);

stroke(0,200,0);
float y = textPos.y - textAscent();
line(0, y, width, y);

stroke(255,0,0);
y = textPos.y + textDescent();
line(0, y, width, y);

stroke(0,255,255);
y = textPos.y - 50;
line(0, y, width, y);

stroke(0,0,255);
y = textPos.x + textWidth(text);
line(y, 0, y, height);

textSize(20);
fill(0);
text("Text Position", 30, 300);
fill(255,0,0);
text("Text Position + Descent", 30, 220);
fill(0,200,0);
text("Text Position - Ascent", 30, 240);
fill(0,255,255);
text("Text Position - Size", 30, 260);
fill(0,0,255);
text("Text Position + width", 30, 280);

textAlign(RIGHT);
fill(125);
stroke(125);
rect(300,height-40, 600,100);
fill(0);
text("© http://fez.world",width-10, height-10);

save("FontMetricsCheatSheet.png");