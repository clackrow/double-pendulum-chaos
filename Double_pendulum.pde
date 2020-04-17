Pendulum p;
Pendulum p2;
PGraphics c;

float a = random(PI/4, PI/8);
float b = a + PI/10000000;

boolean secondPendulum = true;

void setup() {
  size(1000, 600);
  c = createGraphics(width, height);
  c.beginDraw();
  c.background(255);
  c.endDraw();
  p = new Pendulum(a);
  p2 = new Pendulum(b);
}

void draw() {
  image(c, 0, 0);
  strokeWeight(3);
  translate(width/2, height/2);

  p.math(10, 10);
  p.show(255);
  p.plot(255, true);

  if (secondPendulum) {
    p2.math(10, 10);
    p2.show(140);
    p2.plot(140, false);
  }
}
