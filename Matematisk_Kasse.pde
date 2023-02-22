import java.lang.Math. *;


PVector [] Punkter = new PVector [5];
PVector [] ProjekteredePunkter = new PVector [5];
color c1 = #EFCA08;
color c2 = #00A6A6;
color c3 = #ffffff;
float angle = 25;

void setup () {
  size (400, 400);

  //lav funktion der tager planets parameter fremstilling og parameter fremstillingen for hvert hjørne og løser for s og t i planet tjek word dokument der hedder tissemand

  Punkter [0] = new PVector (0.0, 0.0, 1.0);
  Punkter [1] = new PVector (1.0, 0.0, 1.0);
  Punkter [2] = new PVector (1.0, 1.0, 1.0);
  Punkter [3] = new PVector (0.0, 1.0, 1.0);
  Punkter [4] = new PVector (0.5, 0.5, 0.0);
  //Punkter [5] = new PVector (1.0, 0.0, 1.0);
  //Punkter [6] = new PVector (1.0, 1.0, 1.0);
  //Punkter [7] = new PVector (0.0, 1.0, 1.0);
}

void draw () {
  background (0);
  translate ((width/2), (height/2));

  for (int j = 0; j < 5; j++) {
    ProjekteredePunkter [j] = calcpoint (Punkter, j);
    
    
  }

    rotateY (angle);
    connect (0,4, ProjekteredePunkter, c2);
    connect (1,4, ProjekteredePunkter, c2);
    connect (2,4, ProjekteredePunkter, c2);
    connect (3,4, ProjekteredePunkter, c2);
    connect (0,1, ProjekteredePunkter, c1);
    connect (1,2, ProjekteredePunkter, c1);
    connect (2,3, ProjekteredePunkter, c1);
    connect (3,0, ProjekteredePunkter, c1);
    
    angle = angle + 0.1;


  //for (int i = 0; i < 4; i++) {
  // connect(i, (i+1) % 4, ProjekteredePunkter);
  //  connect(i+4, ((i+1) % 4)+4, ProjekteredePunkter);
  //  connect(i, i+4, ProjekteredePunkter);


  //}
}
PVector calcpoint (PVector[] Punkter, int index) {
  PVector E = Punkter [index];
  PVector P = new PVector (0, 4, 3);
  PVector Q = new PVector (0, 3, (9.0/4.0));
  PVector e_r = new PVector (-(1), 0, 0);
  PVector e_q = new PVector (0, -(3.0/5.0), (4.0/5.0));

  float s = (((P.x-E.x)*Q.y+(E.y-P.y)*Q.x+E.x*P.y-E.y*P.x)*e_q.z+((E.x-P.x)*Q.z+(P.z-E.z)*Q.x-E.x*P.z+E.z*P.x)*e_q.y+((P.y-E.y)*Q.z+(E.z-P.z)*Q.y+E.y*P.z-E.z*P.y)*e_q.x)
    /(((P.x-E.x)*e_q.y+(E.y-P.y)*e_q.x)*e_r.z+((E.x-P.x)*e_q.z+(P.z-E.z)*e_q.x)*e_r.y+((P.y-E.y)*e_q.z+(E.z-P.z)*e_q.y)*e_r.x);

  float t = -(((P.x-E.x)*Q.y+(E.y-P.y)*Q.x+E.x*P.y-E.y*P.x)*e_r.z+((E.x-P.x)*Q.z+(P.z-E.z)*Q.x-E.x*P.z+E.z*P.x)*e_r.y+((P.y-E.y)*Q.z+(E.z-P.z)*Q.y+E.y*P.z-E.z*P.y)*e_r.x)
    /(((P.x-E.x)*e_q.y+(E.y-P.y)*e_q.x)*e_r.z+((E.x-P.x)*e_q.z+(P.z-E.z)*e_q.x)*e_r.y+((P.y-E.y)*e_q.z+(E.z-P.z)*e_q.y)*e_r.x);
   
  println ("s: " + s);
  println ("t: " + t);
  
  return new PVector(s, t);
}



void connect(int i, int j, PVector[] ProjekteredePunkter, color farver) {    
  float scale = 480;
  PVector a = ProjekteredePunkter[i];
  PVector b = ProjekteredePunkter[j];
  strokeWeight(15);
  stroke(farver);
  //point (a.x*scale, a.y*scale);
  strokeWeight (5);
  line(a.x*scale, a.y*scale, b.x*scale, b.y*scale);

}

void Rotate (PVector [] ProjekteredePunkter, int yaw, int pitch, int roll) {


  
  
  
  
}
