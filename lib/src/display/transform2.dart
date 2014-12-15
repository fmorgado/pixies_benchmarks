part of display;

class Transform2 {
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
  
  final Float32List _transform = new Float32List(6);
  
  void setTransformIdentity() {
    _transform[0] = 1.0;
    _transform[1] = 0.0;
    _transform[2] = 0.0;
    _transform[3] = 1.0;
    _transform[4] = 0.0;
    _transform[5] = 0.0;
  }
  
  void updateTransform1(Transform2 parent) {
    if (_rotation == 0.0) {
      double tx = x - pivotX * scaleX;
      double ty = y - pivotY * scaleY;
      
      final pData = parent._transform;
      double a2 =  pData[0];
      double b2 =  pData[1];
      double c2 =  pData[2];
      double d2 =  pData[3];
      
      _transform[0] = scaleX * a2;
      _transform[1] = scaleX * b2;
      _transform[2] = scaleY * c2;
      _transform[3] = scaleY * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
      
    } else {
      double a = scaleX * _rotationCos;
      double b = scaleX * _rotationSin;
      double c = -scaleY * _rotationSin;
      double d = scaleY * _rotationCos;
      double tx =  x - (pivotX * a + pivotY * c);
      double ty =  y - (pivotX * b + pivotY * d);
      
      final pData = parent._transform;
      double a2 =  pData[0];
      double b2 =  pData[1];
      double c2 =  pData[2];
      double d2 =  pData[3];
      
      _transform[0] = a * a2 + b * c2;
      _transform[1] = a * b2 + b * d2;
      _transform[2] = c * a2 + d * c2;
      _transform[3] = c * b2 + d * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
    }
  }
  
  void updateTransform2(Transform2 parent) {
    final pData = parent._transform;
    double a2 =  pData[0];
    double b2 =  pData[1];
    double c2 =  pData[2];
    double d2 =  pData[3];
    
    if (_rotation == 0.0) {
      double tx = x - pivotX * scaleX;
      double ty = y - pivotY * scaleY;
      
      _transform[0] = scaleX * a2;
      _transform[1] = scaleX * b2;
      _transform[2] = scaleY * c2;
      _transform[3] = scaleY * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
      
    } else {
      double a = scaleX * _rotationCos;
      double b = scaleX * _rotationSin;
      double c = -scaleY * _rotationSin;
      double d = scaleY * _rotationCos;
      double tx =  x - (pivotX * a + pivotY * c);
      double ty =  y - (pivotX * b + pivotY * d);
      
      _transform[0] = a * a2 + b * c2;
      _transform[1] = a * b2 + b * d2;
      _transform[2] = c * a2 + d * c2;
      _transform[3] = c * b2 + d * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
    }
  }
  
}