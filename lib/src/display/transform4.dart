part of display;

class Transform4 {
  
  num get x => _transform[06];
  void set x(num value) { _transform[06] = value; }
  
  num get y => _transform[07];
  void set y(num value) { _transform[07] = value; }
  
  num get scaleX => _transform[08];
  void set scaleX(num value) { _transform[08] = value; }
  
  num get scaleY => _transform[09];
  void set scaleY(num value) { _transform[09] = value; }
  
  double get rotation => _transform[10];
  void set rotation(double value) {
    _transform[10] = value;
    _transform[11] = math.sin(value);
    _transform[12] = math.cos(value);
  }
  
  num get pivotX => _transform[13];
  void set pivotX(num value) { _transform[13] = value; }
  
  num get pivotY => _transform[14];
  void set pivotY(num value) { _transform[14] = value; }
  
  /// 00 - a
  /// 01 - b
  /// 02 - c
  /// 03 - d
  /// 04 - tx
  /// 05 - ty
  /// 06 - x
  /// 07 - y
  /// 08 - scaleX
  /// 09 - scaleY
  /// 10 - rotation
  /// 11 - rotationX
  /// 12 - rotationY
  /// 13 - pivotX
  /// 14 - pivotY
  final Float32List _transform = new Float32List(15);
  
  void setTransformIdentity() {
    _transform[0] = 1.0;
    _transform[1] = 0.0;
    _transform[2] = 0.0;
    _transform[3] = 1.0;
    _transform[4] = 0.0;
    _transform[5] = 0.0;
  }
  
  void updateTransform1(Transform4 parent) {
    if (_transform[10] == 0.0) {
      double tx = _transform[06] - _transform[13] * _transform[08];
      double ty = _transform[07] - _transform[14] * _transform[09];
      
      final pData = parent._transform;
      double a2 = pData[0];
      double b2 = pData[1];
      double c2 = pData[2];
      double d2 = pData[3];
      
      _transform[0] = _transform[08] * a2;
      _transform[1] = _transform[08] * b2;
      _transform[2] = _transform[09] * c2;
      _transform[3] = _transform[09] * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
      
    } else {
      double a = _transform[08] * _transform[11];
      double b = _transform[08] * _transform[12];
      double c = -_transform[09] * _transform[12];
      double d = _transform[09] * _transform[11];
      double tx = _transform[06] - (_transform[13] * a + _transform[14] * c);
      double ty = _transform[07] - (_transform[13] * b + _transform[14] * d);
      
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
  
  void updateTransform2(Transform4 parent) {
    final pData = parent._transform;
    double a2 =  pData[0];
    double b2 =  pData[1];
    double c2 =  pData[2];
    double d2 =  pData[3];
    
    if (_transform[10] == 0.0) {
      double tx = x - _transform[13] * _transform[08];
      double ty = y - _transform[14] * _transform[09];
      
      _transform[0] = _transform[08] * a2;
      _transform[1] = _transform[08] * b2;
      _transform[2] = _transform[09] * c2;
      _transform[3] = _transform[09] * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
      
    } else {
      double a = _transform[08] * _transform[11];
      double b = _transform[08] * _transform[12];
      double c = -_transform[09] * _transform[12];
      double d = _transform[09] * _transform[11];
      double tx =  x - (_transform[13] * a + _transform[14] * c);
      double ty =  y - (_transform[13] * b + _transform[14] * d);
      
      _transform[0] = a * a2 + b * c2;
      _transform[1] = a * b2 + b * d2;
      _transform[2] = c * a2 + d * c2;
      _transform[3] = c * b2 + d * d2;
      _transform[4] = tx * a2 + ty * c2 + pData[4];
      _transform[5] = tx * b2 + ty * d2 + pData[5];
    }
  }
  
}