part of geom;

class Matrix {
  static final identity = new Matrix();
  
  final data = new Float32List(6);
  
  Matrix() {
    data[0] = data[3] = 1.0;
  }

  void setIdentity() {
    data[0] = data[3] = 1.0;
    data[1] = data[2] = data[4] = data[5] = 0.0;
  }
  
  void setValues(double a, double b, double c, double d, double tx, double ty) {
    data[0] = a;
    data[1] = b;
    data[2] = c;
    data[3] = d;
    data[4] = tx;
    data[5] = ty;
  }
  
  double get a => data[0];
  void set a(double value) { data[0] = value; }
  
  double get b => data[1];
  void set b(double value) { data[1] = value; }
  
  double get c => data[2];
  void set c(double value) { data[2] = value; }
  
  double get d => data[3];
  void set d(double value) { data[3] = value; }
  
  double get tx => data[4];
  void set tx(double value) { data[4] = value; }
  
  double get ty => data[5];
  void set ty(double value) { data[5] = value; }

  void rotate(num rotation) {
    num cosR = math.cos(rotation);
    num sinR = math.sin(rotation);

    num a =  this.a;
    num b =  this.b;
    num c =  this.c;
    num d =  this.d;
    num tx = this.tx;
    num ty = this.ty;

    data[0] = a * cosR - b * sinR;
    data[1] = a * sinR + b * cosR;
    data[2] = c * cosR - d * sinR;
    data[3] = c * sinR + d * cosR;
    data[4] = tx * cosR - ty * sinR;
    data[5] = tx * sinR + ty * cosR;
  }

  void scale(num scaleX, num scaleY) {
    data[0] = this.a * scaleX;
    data[1] = this.b * scaleY;
    data[2] = this.c * scaleX;
    data[3] = this.d * scaleY;
    data[4] = this.tx * scaleX;
    data[5] = this.ty * scaleY;
  }

  void translate(num translationX, num translationY) {
    data[4] = this.tx + translationX;
    data[5] = this.ty + translationY;
  }
  
  void multiply(Matrix other) {
    num a1 =  a;
    num b1 =  b;
    num c1 =  c;
    num d1 =  d;
    num tx1 = tx;
    num ty1 = ty;
    
    num a2 =  other.a;
    num b2 =  other.b;
    num c2 =  other.c;
    num d2 =  other.d;
    num tx2 = other.tx;
    num ty2 = other.ty;
    
    data[0] = a1 * a2 + b1 * c2;
    data[1] = a1 * b2 + b1 * d2;
    data[2] = c1 * a2 + d1 * c2;
    data[3] = c1 * b2 + d1 * d2;
    data[4] = tx1 * a2 + ty1 * c2 + tx2;
    data[5] = tx1 * b2 + ty1 * d2 + ty2;
  }
  
  double transformPointX(double x, double y) => x * this.a + y * this.c + this.tx;
  
  double transformPointY(double x, double y) => x * this.b + y * this.d + this.ty;
  
}