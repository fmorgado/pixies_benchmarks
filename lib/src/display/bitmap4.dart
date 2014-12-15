part of display;

class Bitmap4 extends Transform4 {
  
  final Float32List _vertices = new Float32List(8);
  
  int width = 100;
  int height = 100;
  
  void setRandomSize() {
    final random = new math.Random();
    width = random.nextInt(100);
    height = random.nextInt(100);
  }
  
  void updateVertices1(Transform4 parent) {
    updateTransform2(parent);
    
    final widthA = _transform[0] * width;
    final widthB = _transform[1] * width;
    final heightC = _transform[2] * height;
    final heightD = _transform[3] * height;
    final tx = _transform[4];
    final ty = _transform[5];
    
    _vertices[0] = tx;
    _vertices[1] = ty;
    _vertices[2] = widthA + tx;
    _vertices[3] = widthB + ty;
    _vertices[4] = widthA + heightC + tx;
    _vertices[5] = widthB + heightD + ty;
    _vertices[6] = heightC + tx;
    _vertices[7] = heightD + ty;
  }
  
  void updateVertices2(Transform4 parent) {
    updateTransform2(parent);
    
    final widthA = _transform[0] * width;
    final widthB = _transform[1] * width;
    final heightC = _transform[2] * height;
    final heightD = _transform[3] * height;
    
    _vertices[0] = _transform[4];
    _vertices[1] = _transform[5];
    _vertices[2] = widthA + _transform[4];
    _vertices[3] = widthB + _transform[5];
    _vertices[4] = widthA + heightC + _transform[4];
    _vertices[5] = widthB + heightD + _transform[5];
    _vertices[6] = heightC + _transform[4];
    _vertices[7] = heightD + _transform[5];
  }
}
