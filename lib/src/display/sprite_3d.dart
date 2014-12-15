part of display;

class Sprite3D {
  final _matrix = new Matrix3D.identity();
  
  num pivotX = 0.0;
  num pivotY = 0.0;
  num rotationX = 0.0;
  num rotationY = 0.0;
  num rotationZ = 0.0;
  num offsetX = 0.0;
  num offsetY = 0.0;
  num offsetZ = 0.0;
  num perspectiveDepth = 10000;
  num perspectiveScale = 10;
  
  void setRandomValues() {
    final random = new math.Random();
    pivotX = random.nextInt(100);
    pivotY = random.nextInt(100);
    rotationX = random.nextDouble();
    rotationY = random.nextDouble();
    rotationZ = random.nextDouble();
    offsetX = random.nextInt(100);
    offsetY = random.nextInt(100);
    offsetZ = random.nextInt(100);
    perspectiveScale = random.nextDouble() * 10 + 5;
    perspectiveDepth = random.nextDouble() * 2000 + 9000;
  }
  
  void updateTransform3D() {
    _matrix.setIdentity();
    _matrix.translateXY(-pivotX, -pivotY);
    _matrix.rotateX(rotationX);
    _matrix.rotateY(rotationY);
    _matrix.rotateZ(rotationZ);
    _matrix.translate(offsetX + pivotX, offsetY + pivotY, offsetZ);
    _matrix.applyPerspective(perspectiveDepth, perspectiveScale);
  }
  
  void updateTransform3D_2() {
    _matrix.setIdentity();
    _matrix.translateXY(-pivotX, -pivotY);
    if (rotationX != 0.0) _matrix.rotateX(rotationX);
    if (rotationY != 0.0) _matrix.rotateY(rotationY);
    if (rotationZ != 0.0) _matrix.rotateZ(rotationZ);
    _matrix.translate(offsetX + pivotX, offsetY + pivotY, offsetZ);
    
    _matrix.applyPerspective(perspectiveDepth, perspectiveScale);
  }
  
}
