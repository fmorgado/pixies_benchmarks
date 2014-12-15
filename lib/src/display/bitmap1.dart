part of display;

class Bitmap1 extends Transform1 {
  
  final Float32List _vertices = new Float32List(8);
  
  int width = 100;
  int height = 100;
  
  void setRandomSize() {
    final random = new math.Random();
    width = random.nextInt(100);
    height = random.nextInt(100);
  }
  
  void updateVertices1(Matrix parentMatrix) {
    updateTransform5(parentMatrix);
    
    final width = this.width.toDouble();
    final height = this.height.toDouble();
    _vertices[0] = _transform.transformPointX(0.0, 0.0);
    _vertices[1] = _transform.transformPointY(0.0, 0.0);
    _vertices[2] = _transform.transformPointX(width, 0.0);
    _vertices[3] = _transform.transformPointY(width, 0.0);
    _vertices[4] = _transform.transformPointX(width, height);
    _vertices[5] = _transform.transformPointY(width, height);
    _vertices[6] = _transform.transformPointX(0.0, height);
    _vertices[7] = _transform.transformPointY(0.0, height);
  }
  
  void updateVertices2(Matrix parentMatrix) {
    updateTransform5(parentMatrix);
    
    final width = this.width.toDouble();
    final height = this.height.toDouble();
    
    final a = _transform.a;
    final b = _transform.b;
    final c = _transform.c;
    final d = _transform.d;
    final tx = _transform.tx;
    final ty = _transform.ty;
    
    _vertices[0] = tx;
    _vertices[1] = ty;
    _vertices[2] = width * a + tx;
    _vertices[3] = width * b + ty;
    _vertices[4] = width * a + height * c + tx;
    _vertices[5] = width * b + height * d + ty;
    _vertices[6] = height * c + tx;
    _vertices[7] = height * d + ty;
  }
  
  void updateVertices3(Matrix parentMatrix) {
    updateTransform5(parentMatrix);
    
    final widthA = _transform.a * width;
    final widthB = _transform.b * width;
    final heightC = _transform.c * height;
    final heightD = _transform.d * height;
    final tx = _transform.tx;
    final ty = _transform.ty;
    
    _vertices[0] = tx;
    _vertices[1] = ty;
    _vertices[2] = widthA + tx;
    _vertices[3] = widthB + ty;
    _vertices[4] = widthA + heightC + tx;
    _vertices[5] = widthB + heightD + ty;
    _vertices[6] = heightC + tx;
    _vertices[7] = heightD + ty;
  }
  
  void updateVertices4(Matrix parentMatrix) {
    updateTransform5(parentMatrix);
    
    final tx = _transform.tx;
    final ty = _transform.ty;
    final widthATx = _transform.a * width + tx;
    final widthBTy = _transform.b * width + ty;
    final heightC = _transform.c * height;
    final heightD = _transform.d * height;
    
    _vertices[0] = tx;
    _vertices[1] = ty;
    _vertices[2] = widthATx;
    _vertices[3] = widthBTy;
    _vertices[4] = widthATx + heightC;
    _vertices[5] = widthBTy + heightD;
    _vertices[6] = heightC + tx;
    _vertices[7] = heightD + ty;
  }
}
