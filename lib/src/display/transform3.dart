part of display;

class Transform3 {
  num x = 0;
  num y = 0;
  double scaleX = 1.0;
  double scaleY = 1.0;
  double _rotation = 0.0;
  double _rotationSin = 1.0;
  double _rotationCos = 0.0;
  double pivotX = 0.0;
  double pivotY = 0.0;
  
  double a = 1.0;
  double b = 0.0;
  double c = 0.0;
  double d = 1.0;
  double tx = 0.0;
  double ty = 0.0;
  
  double get rotation => _rotation;
  void set rotation(double value) {
    _rotation = value;
    _rotationSin = math.sin(value);
    _rotationCos = math.cos(value);
  }
  
  void updateTransform1(Transform3 parent) {
    if (_rotation == 0.0) {
      double tx = x - pivotX * scaleX;
      double ty = y - pivotY * scaleY;
      
      a = scaleX * parent.a;
      b = scaleX * parent.b;
      c = scaleY * parent.c;
      d = scaleY * parent.d;
      tx = tx * parent.a + ty * parent.c + parent.tx;
      ty = tx * parent.b + ty * parent.d + parent.ty;
      
    } else {
      double a = scaleX * _rotationCos;
      double b = scaleX * _rotationSin;
      double c = -scaleY * _rotationSin;
      double d = scaleY * _rotationCos;
      double tx =  x - (pivotX * a + pivotY * c);
      double ty =  y - (pivotX * b + pivotY * d);
      
      a = a * parent.a + b * parent.c;
      b = a * parent.b + b * parent.d;
      c = c * parent.a + d * parent.c;
      d = c * parent.b + d * parent.d;
      tx = tx * parent.a + ty * parent.c + parent.tx;
      ty = tx * parent.b + ty * parent.d + parent.ty;
    }
  }
  
  void updateTransform2(Transform3 parent) {
    double a2 = parent.a;
    double b2 = parent.b;
    double c2 = parent.c;
    double d2 = parent.d;
    
    if (_rotation == 0.0) {
      double tx = x - pivotX * scaleX;
      double ty = y - pivotY * scaleY;
      
      a = scaleX * a2;
      b = scaleX * b2;
      c = scaleY * c2;
      d = scaleY * d2;
      tx = tx * a2 + ty * c2 + parent.tx;
      ty = tx * b2 + ty * d2 + parent.ty;
      
    } else {
      double a = scaleX * _rotationCos;
      double b = scaleX * _rotationSin;
      double c = -scaleY * _rotationSin;
      double d = scaleY * _rotationCos;
      double tx =  x - (pivotX * a + pivotY * c);
      double ty =  y - (pivotX * b + pivotY * d);
      
      a = a * a2 + b * c2;
      b = a * b2 + b * d2;
      c = c * a2 + d * c2;
      d = c * b2 + d * d2;
      tx = tx * a2 + ty * c2 + parent.tx;
      ty = tx * b2 + ty * d2 + parent.ty;
    }
  }
  
}