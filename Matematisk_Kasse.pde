import java.lang.Math. *;

//constructer vores PVectorer
PVector [] Punkter = new PVector [6];
PVector [] ProjekteredePunkter = new PVector [6];
PVector [] RoterZ = new PVector [6];
PVector [] RoterX = new PVector [6];


// Laver farver variabler
color c1 = #EFCA08;
color c2 = #00A6A6;
color c3 = #ffffff;

//laver rotations variabler
float anglez = 1;
float anglex = 1;


void setup () {
  
  //laver vores vindue
  size (400, 400);
  translate ((width/2), (height/2));

  //Fylder vores Punkter PVector array med Punkterne for vores figur
  Punkter [0] = new PVector (-1.0, -1.0, 0.0);
  Punkter [1] = new PVector (1.0, -1.0, 0.0);
  Punkter [2] = new PVector (1.0, 1.0, 0.0);
  Punkter [3] = new PVector (-1.0, 1.0, 0.0);
  Punkter [4] = new PVector (0.0, 0.0, -1.0);
  Punkter [5] = new PVector (0.0, 0.0, 1.0);
}

void draw () {
  background (0);
  
  //roterer vores Punkter på z aksen
  for (int i = 0; i < 6; i++) {
    RoterZ [i] = RotateZ (Punkter, i, anglez);
  }
  // roterer vores z roteret punkter på x aksen 
  for (int i = 0; i < 6; i++) {
    RoterX [i] = RotateX (RoterZ, i, anglex);
  }
  
  //udregner hvad projektions punkterne er for vores punkter
  for (int j = 0; j < 6; j++) {
    ProjekteredePunkter [j] = calcpoint (RoterX, j);
  }

  translate ((width/2), (height/2));

//tegner streger mellem vores punkter og farver dem

  connect (0, 4, ProjekteredePunkter, c2);
  connect (1, 4, ProjekteredePunkter, c2);
  connect (2, 4, ProjekteredePunkter, c2);
  connect (3, 4, ProjekteredePunkter, c2);

  connect (0, 5, ProjekteredePunkter, c2);
  connect (1, 5, ProjekteredePunkter, c2);
  connect (2, 5, ProjekteredePunkter, c2);
  connect (3, 5, ProjekteredePunkter, c2);

  connect (0, 1, ProjekteredePunkter, c1);
  connect (1, 2, ProjekteredePunkter, c1);
  connect (2, 3, ProjekteredePunkter, c1);
  connect (3, 0, ProjekteredePunkter, c1);

//ændre vores z rotation hver gang den kører
  anglez = anglez + 0.03;
}




//funktion til at udregne projektions punkterne
PVector calcpoint (PVector[] Punkter, int index) {
 
  //Punktet vi vil projektere
  PVector E = Punkter [index];
  
  //øjets position
  PVector P = new PVector (0, 4, 3);
  //Centrum af billed planet
  PVector Q = new PVector (0, 3, (9.0/4.0));
  //retnings vektoreer
  PVector e_r = new PVector (-(1), 0, 0);
  PVector e_q = new PVector (0, -(3.0/5.0), (4.0/5.0));


  //hitler mode formel til at udregne s... se word dokument for udledning
  float s = (((P.x-E.x)*Q.y+(E.y-P.y)*Q.x+E.x*P.y-E.y*P.x)*e_q.z+((E.x-P.x)*Q.z+(P.z-E.z)*Q.x-E.x*P.z+E.z*P.x)*e_q.y+((P.y-E.y)*Q.z+(E.z-P.z)*Q.y+E.y*P.z-E.z*P.y)*e_q.x)
    /(((P.x-E.x)*e_q.y+(E.y-P.y)*e_q.x)*e_r.z+((E.x-P.x)*e_q.z+(P.z-E.z)*e_q.x)*e_r.y+((P.y-E.y)*e_q.z+(E.z-P.z)*e_q.y)*e_r.x);

  //hitler mode formel til at udregne t... se word dokument for udledning
  float t = -(((P.x-E.x)*Q.y+(E.y-P.y)*Q.x+E.x*P.y-E.y*P.x)*e_r.z+((E.x-P.x)*Q.z+(P.z-E.z)*Q.x-E.x*P.z+E.z*P.x)*e_r.y+((P.y-E.y)*Q.z+(E.z-P.z)*Q.y+E.y*P.z-E.z*P.y)*e_r.x)
    /(((P.x-E.x)*e_q.y+(E.y-P.y)*e_q.x)*e_r.z+((E.x-P.x)*e_q.z+(P.z-E.z)*e_q.x)*e_r.y+((P.y-E.y)*e_q.z+(E.z-P.z)*e_q.y)*e_r.x);

  println ("s: " + s);
  println ("t: " + t);

  return new PVector(s, t);
}

//rotations matrix for z rotation
PVector RotateZ (PVector [] Punkter, int i, float angle) {
  PVector v = Punkter [i];
  float x, y, z;
  x=v.x*cos(angle)+v.y*(-sin(angle));
  y=v.x*sin(angle)+v.y*cos(angle);
  z=v.z;
  return new PVector(x, y, z);
}

//rotations matrix for x rotation
PVector RotateX (PVector [] Punkter, int i, float anglex) {
  PVector v = Punkter [i];
  float x, y, z;
  x=v.x;
  y=v.y*cos(anglex)+v.z*(-sin(anglex));
  z=v.y*sin(anglex)+v.z*cos(anglex);
  return new PVector(x, y, z);
}


//funktion der gør det nemmere at lave linjer mellem 2 PVector
void connect(int i, int j, PVector[] ProjekteredePunkter, color farver) {
  float scale = 300;
  PVector a = ProjekteredePunkter[i];
  PVector b = ProjekteredePunkter[j];
  stroke(farver);
  strokeWeight (5);
  line(a.x*scale, a.y*scale, b.x*scale, b.y*scale);
}
