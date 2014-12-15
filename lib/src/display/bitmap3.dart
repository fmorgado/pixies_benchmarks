part of display;

class Bitmap3 extends Transform3 {
  
  final Float32List _vertices = new Float32List(8);
  
  int width = 100;
  int height = 100;
  
  void setRandomSize() {
    final random = new math.Random();
    width = random.nextInt(100);
    height = random.nextInt(100);
  }
  
  void updateVertices1(Transform3 parent) {
    updateTransform2(parent);
    
    final widthA = a * width;
    final widthB = b * width;
    final heightC = c * height;
    final heightD = d * height;
    
    _vertices[0] = tx;
    _vertices[1] = ty;
    _vertices[2] = widthA + tx;
    _vertices[3] = widthB + ty;
    _vertices[4] = widthA + heightC + tx;
    _vertices[5] = widthB + heightD + ty;
    _vertices[6] = heightC + tx;
    _vertices[7] = heightD + ty;
  }
  
  double v1x = 0.0;
  double v1y = 0.0;
  double v2x = 0.0;
  double v2y = 0.0;
  double v3x = 0.0;
  double v3y = 0.0;
  double v4x = 0.0;
  double v4y = 0.0;
  
  void updateVertices2(Transform3 parent) {
    updateTransform2(parent);
    
    final widthA = a * width;
    final widthB = b * width;
    final heightC = c * height;
    final heightD = d * height;
    
    v1x = tx;
    v1y = ty;
    v2x = widthA + tx;
    v2y = widthB + ty;
    v3x = widthA + heightC + tx;
    v3y = widthB + heightD + ty;
    v4x = heightC + tx;
    v4y = heightD + ty;
  }
}
