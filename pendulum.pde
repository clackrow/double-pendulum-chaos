class Pendulum {
  float a1;
  float a2;
  float a1_v = 0;
  float a2_v = 0;
  float a1_a = 0;
  float a2_a = 0;

  float g = 0.3;

  float x1, y1, x2, y2;

  float px2, py2 = -1;


  Pendulum(float angle) {
    a1 = angle;
    a2 = PI;
  }

  void math(float mass1, float mass2) {
    float r1 = 100;
    float r2 = 50;
    float m1 = mass1;
    float m2 = mass2;
    x1 = r1*sin(a1);
    y1 = r1*cos(a1);

    x2 = x1 + r2*sin(a2);
    y2 = y1 + r2*cos(a2);

    a1_v += a1_a;
    a2_v += a2_a;
    a1 += a1_v;
    a2 += a2_v;


    float u1 = -g*(2*m1 + m2)*sin(a1) ;
    float u2 = - m2*g*sin(a1 - 2*a2);
    float u3 = -2*sin(a1 - a2)*m2;
    float u4 = (a2_v*a2_v*r2 + a1_v*a1_v*r1*cos(a1-a2));
    float d = r1*(2*m1 + m2 - m2*cos(2*a1 - 2* a2));
    a1_a = (u1 + u2 + u3*u4)/d;

    float t1 = 2*sin(a1 - a2);
    float t2 = a1_v*a1_v*r1*(m1+m2);
    float t3 = g*(m1+m2)*cos(a1);
    float t4 = a2_v*a2_v*r2*cos(a1-a2);
    float n = r2*(2*m1 + m2 - m2*cos(2*a1 - 2*a2));
    a2_a = (t1 * (t2 + t3 + t4))/n;
  }

  void show(float alfa) { 
    stroke(0, alfa);
    line(0, 0, x1, y1);
    fill(0, alfa);
    ellipse(x1, y1, 10, 10);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 10, 10);
  }

  void plot(float alfa, boolean rgb) {

    if (rgb) {
      float r = 255*sin(a2);
      float g = 255*cos(a2);
      float b = -255*sin(a2);
      c.stroke(r, g, b, alfa);
    } else {
      c.stroke(130, alfa);
    }

    c.beginDraw();
    c.translate(width/2, height/2);
    c.strokeWeight(2);
    if (frameCount > 1) {
      c.line(px2, py2, x2, y2);
    }
    c.endDraw();

    px2 = x2;
    py2 = y2;
  }
}
