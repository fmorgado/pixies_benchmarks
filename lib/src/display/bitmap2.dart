part of display;

class Bitmap2 extends Transform2 {
  
  final Float32List _vertices = new Float32List(8);
  
  int width = 100;
  int height = 100;
  
  void setRandomSize() {
    final random = new math.Random();
    width = random.nextInt(100);
    height = random.nextInt(100);
  }
  
  void updateVertices(Transform2 parent) {
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
}
