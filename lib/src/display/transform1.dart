part of display;

class Transform1 {
  num x = 0;
  num y = 0;
  double scaleX = 1.0;
  double scaleY = 1.0;
  double _rotation = 0.0;
  double _rotationSin = 1.0;
  double _rotationCos = 0.0;
  double pivotX = 0.0;
  double pivotY = 0.0;
  
  double get rotation => _rotation;
  void set rotation(double value) {
    _rotation = value;
    _rotationSin = math.sin(value);
    _rotationCos = math.cos(value);
  }
  
  final Matrix _transform = new Matrix();
  
  void updateTransform1(Matrix parentTransform) {
    _transform.setIdentity();
    _transform.translate(-pivotX, -pivotY);
    _transform.scale(scaleX, scaleY);
    _transform.rotate(_rotation);
    _transform.translate(x, y);
    
    _transform.multiply(parentTransform);
  }
  
  void updateTransform2(Matrix parentTransform) {
    double a = 1.0;
    double d = 1.0;
    double tx = -pivotX.toDouble();
    double ty = -pivotY.toDouble();
    
    if (scaleX != 1.0) {
      a *= scaleX;
      tx *= scaleX;
    }
    if (scaleY != 1.0) {
      d *= scaleY;
      ty *= scaleY;
    }
    
    if (_rotation == 0.0) {
      _transform.setValues(a, 0.0, 0.0, d, tx + x, ty + y);
    } else {
      _transform.setValues(
          a * _rotationCos,
          a * _rotationSin,
          - d * _rotationSin,
          d * _rotationCos,
          tx * _rotationCos - ty * _rotationSin + x,
          tx * _rotationSin + ty * _rotationCos + y);
    }
    
    _transform.multiply(parentTransform);
  }
  
  void updateTransform3(Matrix parentTransform) {
      if (_rotation != 0.0) {
        _transform.setValues(scaleX, 0.0, 0.0, scaleY, x - pivotX * scaleX, y - pivotY * scaleY);
      } else {
        num a =   scaleX * _rotationCos;
        num b =   scaleX * _rotationSin;
        num c = - scaleY * _rotationSin;
        num d =   scaleY * _rotationCos;
        
        num tx =  x - (pivotX * a + pivotY * c);
        num ty =  y - (pivotX * b + pivotY * d);
        
        _transform.setValues(a, b, c, d, tx, ty);
      }
      
      _transform.multiply(parentTransform);
  }
  
  void updateTransform4(Matrix parentTransform) {
    double a, b, c, d, tx, ty;
    
    if (_rotation == 0.0) {
      a = scaleX;
      b = 0.0;
      c = 0.0;
      d = scaleY;
      tx = x - pivotX * scaleX;
      ty = y - pivotY * scaleY;
    } else {
      a = scaleX * _rotationCos;
      b = scaleX * _rotationSin;
      c = -scaleY * _rotationSin;
      d = scaleY * _rotationCos;
      tx =  x - (pivotX * a + pivotY * c);
      ty =  y - (pivotX * b + pivotY * d);
    }
    
    double a2 =  parentTransform.a;
    double b2 =  parentTransform.b;
    double c2 =  parentTransform.c;
    double d2 =  parentTransform.d;
    
    _transform.setValues(
        a * a2 + b * c2,
        a * b2 + b * d2,
        c * a2 + d * c2,
        c * b2 + d * d2,
        tx * a2 + ty * c2 + parentTransform.tx,
        tx * b2 + ty * d2 + parentTransform.ty
    );
  }
  
  void updateTransform5(Matrix parentTransform) {
    if (_rotation == 0.0) {
      double tx = x - pivotX * scaleX;
      double ty = y - pivotY * scaleY;
      
      double a2 =  parentTransform.a;
      double b2 =  parentTransform.b;
      double c2 =  parentTransform.c;
      double d2 =  parentTransform.d;
      
      _transform.setValues(
          scaleX * a2,
          scaleX * b2,
          scaleY * c2,
          scaleY * d2,
          tx * a2 + ty * c2 + parentTransform.tx,
          tx * b2 + ty * d2 + parentTransform.ty
      );
    } else {
      double a = scaleX * _rotationCos;
      double b = scaleX * _rotationSin;
      double c = -scaleY * _rotationSin;
      double d = scaleY * _rotationCos;
      double tx =  x - (pivotX * a + pivotY * c);
      double ty =  y - (pivotX * b + pivotY * d);
      
      double a2 =  parentTransform.a;
      double b2 =  parentTransform.b;
      double c2 =  parentTransform.c;
      double d2 =  parentTransform.d;
      
      _transform.setValues(
          a * a2 + b * c2,
          a * b2 + b * d2,
          c * a2 + d * c2,
          c * b2 + d * d2,
          tx * a2 + ty * c2 + parentTransform.tx,
          tx * b2 + ty * d2 + parentTransform.ty
      );
    }
  }
  
}