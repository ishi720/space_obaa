Star stars[];
int STARS = 700;//星の数
int x, vx, x1, x2, y1, y2, z, vz, t, vt, u, vu, flag;
float a, b, c, d, e, f, g, h, i, j;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  x2=300;
  y2=250;
  x1=-150;
  y1=y2;

  x=0;
  vx=15;

  z=0;
  vz=15;

  t=0;
  vt=15;

  u=0;
  vu=15;


  stars = new Star[STARS];
  for ( int i =0; i < STARS; i++) {
    stars[i] = new Star( random( width ), random( height ), random( 10 ));
  }

  frameRate( 100 );
  smooth();
  fill(255, 42, 140);
}


void draw() {
  background(0);
  starfield();

  image();//おばぁ画像表示
  if (y2<0) {
    y2=0;
  }//おばぁ上の限界
  if (y2>350) {
    y2=350;
  }//おばぁ下の限界
  noStroke();
  image();//入れ歯画像表示
  if (y1<0) {
    y1=0;
  }//入れ歯上の限界
  if (y1>350) {
    y1=350;
  }//入れ歯下の限界
  if (flag == 1)
    x1= x1+65;//入れ歯横の自動移動
  if (x1>700) {
    x1=-150;
  }//入れ歯が画面外に出たら初期位置へ
  if (x1==-150) {
    flag = 0;
  }//初期位置へ行ったらスタンバイ
  if (x1==-150) {
    y1=y2;
  }//スタンバイ時のおばぁと入れ歯のy移動を同じに
  if (x1==150) {
    flag = 1;
  }//おばぁの位置へ行ったら入れ歯の横移動



  if (x==1500) {
    x=0;
  }//煎餅が画面外に出たら戻ってくる
  if (z==1500) {
    z=0;
  }
  if (t==1500) {
    t=0;
  }
  if (u==1500) {
    u=0;
  }


  if ((a-x>=x1-50 && a-x<=x1+50 && e>=y1 && e<=y1+100)
    ||(x==0)) {
    a=random(700, 1500);
    x=0;
  }//煎餅と入れ歯当たり判定

  if (a-x>=0 && a-x<=200 && e>=y2-130 &&
    e<=y2+110) {
    background(random(0, 255));
    PFont font = createFont
      ("MS-Gothic", 60, true);//おばぁと煎餅当たり判定
    textFont(font);
    text("GAME OVER", 170, 220);
  }//GAME OVER表示

  if (x==0) {
    e=random(0, 360);
  }

  if ((b-z>=x1-50 && b-z<=x1+50 && f>=y1 && f<=y1+100)
    ||(z==0)) {
    b=random(700, 1500);
    z=0;
  }

  if (b-z>=0 && b-z<=200 && f>=y2-130 &&
    f<=y2+110) {
    background(random(0, 255));
    PFont font = createFont
      ("MS-Gothic", 60, true);
    textFont(font);
    text("GAME OVER", 170, 220);
  }

  if (z==0) {
    f=random(0, 360);
  }

  if ((c-t>=x1-50 && c-t<=x1+50 && g>=y1 && g<=y1+100)
    ||(t==0)) {
    c=random(700, 1500);
    t=0;
  }

  if (c-t>=0 && c-t<=200 && g>=y2-130 &&
    g<=y2+110) {
    background(random(0, 255));
    PFont font = createFont
      ("MS-Gothic", 60, true);
    textFont(font);
    text("GAME OVER", 170, 220);
  }

  if (t==0) {
    g=random(0, 360);
  }

  if ((d-u>=x1-50 && d-u<=x1+50 && h>=y1 && h<=y1+100)
    ||(u==0)) {
    d=random(700, 1500);
    u=0;
  }

  if (d-u>=0 && d-u<=200 && h>=y2-130 &&
    h<=y2+110) {
    background(random(0, 255));
    PFont font = createFont
      ("MS-Gothic", 60, true);
    textFont(font);
    text("GAME OVER", 170, 220);
  }

  if (u==0) {
    h=random(0, 360);
  }

  x += vx;
  z += vz;
  t += vt;
  u += vu;


  PImage senbei;
  senbei = loadImage("senbei.bmp");//煎餅画像指定
  image(senbei, a-x, e, 50, 50);//煎餅画像貼り付け位置・大きさ指定

  PImage senbei2;
  senbei2 = loadImage("senbei.bmp");
  image(senbei2, b-z, f, 50, 50);

  PImage senbei3;
  senbei3 = loadImage("senbei.bmp");
  image(senbei3, c-t, g, 50, 50);

  PImage senbei4;
  senbei4 = loadImage("senbei.bmp");
  image(senbei4, d-u, h, 50, 50);



  delay(1);
}
void starfield() {
  strokeWeight( 2 );
  for ( int i =0; i < STARS; i++) {
    stroke( stars[i].z * 25 );
    point( stars[i].x, stars[i].y );

    stars[i].x -= stars[i].z;
    if (stars[i].x < 0) {
      stars[i] = new Star( width, random( height ), sqrt(random( 100 )));
    }
  }
}

void keyPressed() { //キー入力
  if (keyCode==UP) {
    y2=y2-30;
  }//上を押すとおばぁが上に
  if (keyCode==UP&&x1==50) {
    y1=y1-30;
  }//入れ歯横移動中は入れ歯は上移動しない
  if (keyCode==DOWN) {
    y2=y2+30;
  }//下を押すとおばぁが下に
  if (keyCode==DOWN&&y1==50) {
    y1=y1+30;
  }//入れ歯横移動中は入れ歯は下移動しない
  if (keyCode==' ') {
    if (x1==-150) x1 = 150;
    flag =1;
  }//入れ歯発射
}


void image() {
  PImage b;
  b = loadImage("obaa.JPG");//おばぁ画像指定
  image(b, 0, y2-80, 200, 200);//おばぁ画像貼り付け位置・大きさ指定
  PImage c;
  c = loadImage("ireba.bmp");//入れ歯画像指定
  image(c, x1, y1+50, 50, 50);//入れ歯画像貼り付け位置・大きさ指定
}
class Star {//星の座標の定義
  float x, y, z;
  Star( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
