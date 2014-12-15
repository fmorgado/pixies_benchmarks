part of geom;

class Matrix3D {
  final Float32List data = new Float32List(16);

  /// Identity matrix.
  Matrix3D.identity() {
    setIdentity();
  }
  
  Matrix3D.random() {
    setRandomValues();
  }
  
  void setRandomValues() {
    final random = new math.Random();
    setValues(
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble()
    );
  }

  /// Sets the matrix with specified values.
  void setValues(double arg0, double arg1, double arg2,
                 double arg3, double arg4, double arg5,
                 double arg6, double arg7, double arg8,
                 double arg9, double arg10, double arg11,
                 double arg12, double arg13, double arg14, double arg15) {
    data[0] = arg0;
    data[1] = arg1;
    data[2] = arg2;
    data[3] = arg3;
    data[4] = arg4;
    data[5] = arg5;
    data[6] = arg6;
    data[7] = arg7;
    data[8] = arg8;
    data[9] = arg9;
    data[10] = arg10;
    data[11] = arg11;
    data[12] = arg12;
    data[13] = arg13;
    data[14] = arg14;
    data[15] = arg15;
  }
  
  void setIdentity() {
    data[0] =
      data[5] =
      data[10] =
      data[15] = 1.0;
    data[1] =
      data[2] =
      data[3] =
      data[4] =
      data[6] =
      data[7] =
      data[8] =
      data[9] =
      data[11] =
      data[12] =
      data[13] =
      data[14] = 0.0;
  }
  
  void setIdentity2() {
    data[0] = 1.0;
    data[1] = 0.0;
    data[2] = 0.0;
    data[3] = 0.0;
    data[4] = 0.0;
    data[5] = 1.0;
    data[6] = 0.0;
    data[7] = 0.0;
    data[8] = 0.0;
    data[9] = 0.0;
    data[10] = 1.0;
    data[11] = 0.0;
    data[12] = 0.0;
    data[13] = 0.0;
    data[14] = 0.0;
    data[15] = 1.0;
  }
  
  void setTranslationXY(num x, num y) {
    data[03] = x;
    data[07] = y;
  }
  
  void setTranslation(num x, num y, num z) {
    data[03] = x;
    data[07] = y;
    data[11] = z;
  }
  
  void translateXY(num x, num y) {
    data[03] += x;
    data[07] += y;
  }
  
  void translate(num x, num y, num z) {
    data[03] += x;
    data[07] += y;
    data[11] += z;
  }
  
  void preTranslateXY(num x, num y) {
    data[03] += data[00] * x + data[04] * y;
    data[07] += data[01] * x + data[05] * y;
    data[11] += data[02] * x + data[06] * y;
  }
  
  void preTranslate(num x, num y, num z) {
    data[03] += data[00] * x + data[04] * y + data[08] * z;
    data[07] += data[01] * x + data[05] * y + data[09] * z;
    data[11] += data[02] * x + data[06] * y + data[10] * z;
  }
  
  void scaleX(double value) {
    data[0] *= value;
    data[1] *= value;
    data[2] *= value;
    data[3] *= value;
  }
  
  /// Scale the Y axis by [value].
  void scaleY(double value) {
    data[4] *= value;
    data[5] *= value;
    data[6] *= value;
    data[7] *= value;
  }
  
  void scaleXY(double x, double y) {
    data[0] *= x;
    data[1] *= x;
    data[2] *= x;
    data[3] *= x;
    data[4] *= y;
    data[5] *= y;
    data[6] *= y;
    data[7] *= y;
  }
  
  /// Scale the Z axis by [value].
  void scaleZ(double value) {
    data[8] *= value;
    data[9] *= value;
    data[10] *= value;
    data[11] *= value;
  }

  /// Scale this matrix by x,y,z
  void scale(double x, double y, double z) {
    data[0] *= x;
    data[1] *= x;
    data[2] *= x;
    data[3] *= x;
    data[4] *= y;
    data[5] *= y;
    data[6] *= y;
    data[7] *= y;
    data[8] *= z;
    data[9] *= z;
    data[10] *= z;
    data[11] *= z;
  }
  
  void rotateX(num angle) {
    num cos = math.cos(angle);
    num sin = math.sin(angle);
    num m01 = data[04];
    num m11 = data[05];
    num m21 = data[06];
    num m31 = data[07];
    num m02 = data[08];
    num m12 = data[09];
    num m22 = data[10];
    num m32 = data[11];
    
    data[04] = m01 * cos + m02 * sin;
    data[05] = m11 * cos + m12 * sin;
    data[06] = m21 * cos + m22 * sin;
    data[07] = m31 * cos + m32 * sin;
    data[08] = m02 * cos - m01 * sin;
    data[09] = m12 * cos - m11 * sin;
    data[10] = m22 * cos - m21 * sin;
    data[11] = m32 * cos - m31 * sin;
  }
  
  void rotateY(num angle) {
    num cos = math.cos(angle);
    num sin = math.sin(angle);
    num m00 = data[00];
    num m10 = data[01];
    num m20 = data[02];
    num m30 = data[03];
    num m02 = data[08];
    num m12 = data[09];
    num m22 = data[10];
    num m32 = data[11];
    
    data[00] = m00 * cos + m02 * sin;
    data[01] = m10 * cos + m12 * sin;
    data[02] = m20 * cos + m22 * sin;
    data[03] = m30 * cos + m32 * sin;
    data[08] = m02 * cos - m00 * sin;
    data[09] = m12 * cos - m10 * sin;
    data[10] = m22 * cos - m20 * sin;
    data[11] = m32 * cos - m30 * sin;
  }
  
  void rotateZ(num angle) {
    num cos = math.cos(angle);
    num sin = math.sin(angle);
    num m00 = data[00];
    num m10 = data[01];
    num m20 = data[02];
    num m30 = data[03];
    num m01 = data[04];
    num m11 = data[05];
    num m21 = data[06];
    num m31 = data[07];

    data[00] = m00 * cos + m01 * sin;
    data[01] = m10 * cos + m11 * sin;
    data[02] = m20 * cos + m21 * sin;
    data[03] = m30 * cos + m31 * sin;
    data[04] = m01 * cos - m00 * sin;
    data[05] = m11 * cos - m10 * sin;
    data[06] = m21 * cos - m20 * sin;
    data[07] = m31 * cos - m30 * sin;
  }
  
  void setRotationX(double radians) {
    double cos = math.cos(radians);
    double sin = math.sin(radians);
    data[0] = 1.0;
    data[1] = 0.0;
    data[2] = 0.0;
    data[4] = 0.0;
    data[5] = cos;
    data[6] = -sin;
    data[8] = 0.0;
    data[9] = sin;
    data[10] = cos;
    data[12] = 0.0;
    data[13] = 0.0;
    data[14] = 0.0;
  }
  
  void setRotationY(double radians) {
    double cos = math.cos(radians);
    double sin = math.sin(radians);
    data[0] = cos;
    data[1] = 0.0;
    data[2] = sin;
    data[3] = 0.0;
    
    data[4] = 0.0;
    data[5] = 1.0;
    data[6] = 0.0;
    
    data[8] = -sin;
    data[9] = 0.0;
    data[10] = cos;
    
    data[12] = 0.0;
    data[13] = 0.0;
    data[14] = 0.0;
  }
  
  void setRotationZ(double radians) {
    double cos = math.cos(radians);
    double sin = math.sin(radians);
    data[0] = cos;
    data[1] = -sin;
    data[2] = 0.0;
    data[3] = 0.0;
    
    data[4] = sin;
    data[5] = cos;
    data[6] = 0.0;
    
    data[8] = 0.0;
    data[9] = 0.0;
    data[10] = 1.0;
    
    data[12] = 0.0;
    data[13] = 0.0;
    data[14] = 0.0;
    data[15] = 1.0;
  }
  
  void multiply(Matrix3D other) {
    num v00 = data[00];
    num v01 = data[04];
    num v02 = data[08];
    num v03 = data[12];
    num v10 = data[01];
    num v11 = data[05];
    num v12 = data[09];
    num v13 = data[13];
    num v20 = data[02];
    num v21 = data[06];
    num v22 = data[10];
    num v23 = data[14];
    num v30 = data[03];
    num v31 = data[07];
    num v32 = data[11];
    num v33 = data[15];
    
    final oData = other.data;
    num o00 = oData[00];
    num o01 = oData[04];
    num o02 = oData[08];
    num o03 = oData[12];
    num o10 = oData[01];
    num o11 = oData[05];
    num o12 = oData[09];
    num o13 = oData[13];
    num o20 = oData[02];
    num o21 = oData[06];
    num o22 = oData[10];
    num o23 = oData[14];
    num o30 = oData[03];
    num o31 = oData[07];
    num o32 = oData[11];
    num o33 = oData[15];
    
    data[00] = v00 * o00 + v01 * o10 + v02 * o20 + v03 * o30;
    data[01] = v10 * o00 + v11 * o10 + v12 * o20 + v13 * o30;
    data[02] = v20 * o00 + v21 * o10 + v22 * o20 + v23 * o30;
    data[03] = v30 * o00 + v31 * o10 + v32 * o20 + v33 * o30;
    data[04] = v00 * o01 + v01 * o11 + v02 * o21 + v03 * o31;
    data[05] = v10 * o01 + v11 * o11 + v12 * o21 + v13 * o31;
    data[06] = v20 * o01 + v21 * o11 + v22 * o21 + v23 * o31;
    data[07] = v30 * o01 + v31 * o11 + v32 * o21 + v33 * o31;
    data[08] = v00 * o02 + v01 * o12 + v02 * o22 + v03 * o32;
    data[09] = v10 * o02 + v11 * o12 + v12 * o22 + v13 * o32;
    data[10] = v20 * o02 + v21 * o12 + v22 * o22 + v23 * o32;
    data[11] = v30 * o02 + v31 * o12 + v32 * o22 + v33 * o32;
    data[12] = v00 * o03 + v01 * o13 + v02 * o23 + v03 * o33;
    data[13] = v10 * o03 + v11 * o13 + v12 * o23 + v13 * o33;
    data[14] = v20 * o03 + v21 * o13 + v22 * o23 + v23 * o33;
    data[15] = v30 * o03 + v31 * o13 + v32 * o23 + v33 * o33;
  }
  
  void multiply2(Matrix3D other) {
    num v00 = data[00];
    num v01 = data[04];
    num v02 = data[08];
    num v03 = data[12];
    num v10 = data[01];
    num v11 = data[05];
    num v12 = data[09];
    num v13 = data[13];
    num v20 = data[02];
    num v21 = data[06];
    num v22 = data[10];
    num v23 = data[14];
    num v30 = data[03];
    num v31 = data[07];
    num v32 = data[11];
    num v33 = data[15];
    
    num o00 = other.data[00];
    num o01 = other.data[04];
    num o02 = other.data[08];
    num o03 = other.data[12];
    num o10 = other.data[01];
    num o11 = other.data[05];
    num o12 = other.data[09];
    num o13 = other.data[13];
    num o20 = other.data[02];
    num o21 = other.data[06];
    num o22 = other.data[10];
    num o23 = other.data[14];
    num o30 = other.data[03];
    num o31 = other.data[07];
    num o32 = other.data[11];
    num o33 = other.data[15];
    
    data[00] = v00 * o00 + v01 * o10 + v02 * o20 + v03 * o30;
    data[01] = v10 * o00 + v11 * o10 + v12 * o20 + v13 * o30;
    data[02] = v20 * o00 + v21 * o10 + v22 * o20 + v23 * o30;
    data[03] = v30 * o00 + v31 * o10 + v32 * o20 + v33 * o30;
    data[04] = v00 * o01 + v01 * o11 + v02 * o21 + v03 * o31;
    data[05] = v10 * o01 + v11 * o11 + v12 * o21 + v13 * o31;
    data[06] = v20 * o01 + v21 * o11 + v22 * o21 + v23 * o31;
    data[07] = v30 * o01 + v31 * o11 + v32 * o21 + v33 * o31;
    data[08] = v00 * o02 + v01 * o12 + v02 * o22 + v03 * o32;
    data[09] = v10 * o02 + v11 * o12 + v12 * o22 + v13 * o32;
    data[10] = v20 * o02 + v21 * o12 + v22 * o22 + v23 * o32;
    data[11] = v30 * o02 + v31 * o12 + v32 * o22 + v33 * o32;
    data[12] = v00 * o03 + v01 * o13 + v02 * o23 + v03 * o33;
    data[13] = v10 * o03 + v11 * o13 + v12 * o23 + v13 * o33;
    data[14] = v20 * o03 + v21 * o13 + v22 * o23 + v23 * o33;
    data[15] = v30 * o03 + v31 * o13 + v32 * o23 + v33 * o33;
  }
  
  void multiply3(Matrix3D other) {
    num v00 = data[00];
    num v01 = data[04];
    num v02 = data[08];
    num v03 = data[12];
    num v10 = data[01];
    num v11 = data[05];
    num v12 = data[09];
    num v13 = data[13];
    num v20 = data[02];
    num v21 = data[06];
    num v22 = data[10];
    num v23 = data[14];
    num v30 = data[03];
    num v31 = data[07];
    num v32 = data[11];
    num v33 = data[15];
    
    final oData = other.data;
    data[00] = v00 * oData[00] + v01 * oData[01] + v02 * oData[02] + v03 * oData[03];
    data[01] = v10 * oData[00] + v11 * oData[01] + v12 * oData[02] + v13 * oData[03];
    data[02] = v20 * oData[00] + v21 * oData[01] + v22 * oData[02] + v23 * oData[03];
    data[03] = v30 * oData[00] + v31 * oData[01] + v32 * oData[02] + v33 * oData[03];
    data[04] = v00 * oData[04] + v01 * oData[05] + v02 * oData[06] + v03 * oData[07];
    data[05] = v10 * oData[04] + v11 * oData[05] + v12 * oData[06] + v13 * oData[07];
    data[06] = v20 * oData[04] + v21 * oData[05] + v22 * oData[06] + v23 * oData[07];
    data[07] = v30 * oData[04] + v31 * oData[05] + v32 * oData[06] + v33 * oData[07];
    data[08] = v00 * oData[08] + v01 * oData[09] + v02 * oData[10] + v03 * oData[11];
    data[09] = v10 * oData[08] + v11 * oData[09] + v12 * oData[10] + v13 * oData[11];
    data[10] = v20 * oData[08] + v21 * oData[09] + v22 * oData[10] + v23 * oData[11];
    data[11] = v30 * oData[08] + v31 * oData[09] + v32 * oData[10] + v33 * oData[11];
    data[12] = v00 * oData[12] + v01 * oData[13] + v02 * oData[14] + v03 * oData[15];
    data[13] = v10 * oData[12] + v11 * oData[13] + v12 * oData[14] + v13 * oData[15];
    data[14] = v20 * oData[12] + v21 * oData[13] + v22 * oData[14] + v23 * oData[15];
    data[15] = v30 * oData[12] + v31 * oData[13] + v32 * oData[14] + v33 * oData[15];
  }
  
  void multiply4(Matrix3D other) {
    num v00 = data[00];
    num v01 = data[04];
    num v02 = data[08];
    num v03 = data[12];
    num v10 = data[01];
    num v11 = data[05];
    num v12 = data[09];
    num v13 = data[13];
    num v20 = data[02];
    num v21 = data[06];
    num v22 = data[10];
    num v23 = data[14];
    num v30 = data[03];
    num v31 = data[07];
    num v32 = data[11];
    num v33 = data[15];
    
    data[00] = v00 * other.data[00] + v01 * other.data[01] + v02 * other.data[02] + v03 * other.data[03];
    data[01] = v10 * other.data[00] + v11 * other.data[01] + v12 * other.data[02] + v13 * other.data[03];
    data[02] = v20 * other.data[00] + v21 * other.data[01] + v22 * other.data[02] + v23 * other.data[03];
    data[03] = v30 * other.data[00] + v31 * other.data[01] + v32 * other.data[02] + v33 * other.data[03];
    data[04] = v00 * other.data[04] + v01 * other.data[05] + v02 * other.data[06] + v03 * other.data[07];
    data[05] = v10 * other.data[04] + v11 * other.data[05] + v12 * other.data[06] + v13 * other.data[07];
    data[06] = v20 * other.data[04] + v21 * other.data[05] + v22 * other.data[06] + v23 * other.data[07];
    data[07] = v30 * other.data[04] + v31 * other.data[05] + v32 * other.data[06] + v33 * other.data[07];
    data[08] = v00 * other.data[08] + v01 * other.data[09] + v02 * other.data[10] + v03 * other.data[11];
    data[09] = v10 * other.data[08] + v11 * other.data[09] + v12 * other.data[10] + v13 * other.data[11];
    data[10] = v20 * other.data[08] + v21 * other.data[09] + v22 * other.data[10] + v23 * other.data[11];
    data[11] = v30 * other.data[08] + v31 * other.data[09] + v32 * other.data[10] + v33 * other.data[11];
    data[12] = v00 * other.data[12] + v01 * other.data[13] + v02 * other.data[14] + v03 * other.data[15];
    data[13] = v10 * other.data[12] + v11 * other.data[13] + v12 * other.data[14] + v13 * other.data[15];
    data[14] = v20 * other.data[12] + v21 * other.data[13] + v22 * other.data[14] + v23 * other.data[15];
    data[15] = v30 * other.data[12] + v31 * other.data[13] + v32 * other.data[14] + v33 * other.data[15];
  }
  
  void applyPerspective2(double depth, double scale) {
    num v08 = data[08];
    num v09 = data[09];
    num v10 = data[10];
    num v11 = data[11];
    
    num o10 = 1.0 / depth;
    num o14 = scale / depth;
    
    data[08] = v08 * o10;
    data[09] = v09 * o10;
    data[10] = v10 * o10;
    data[11] = v11 * o10;
    data[12] += v08 * o14;
    data[13] += v09 * o14;
    data[14] += v10 * o14;
    data[15] += v11 * o14;
  }
  
  void applyPerspective(double depth, double scale) {
    num o10 = 1.0 / depth;
    num o14 = scale / depth;
    
    data[12] += data[08] * o14;
    data[13] += data[09] * o14;
    data[14] += data[10] * o14;
    data[15] += data[11] * o14;
    data[08] *= o10;
    data[09] *= o10;
    data[10] *= o10;
    data[11] *= o10;
  }
  
  void setPerspective(num depth, num scale) {
    data[0] =
      data[5] =
      data[15] = 1.0;
    data[1] =
      data[2] =
      data[3] =
      data[4] =
      data[6] =
      data[7] =
      data[8] =
      data[9] =
      data[11] =
      data[12] =
      data[13] = 0.0;
    data[10] = 1.0 / depth;   // 1 / 10000
    data[14] = scale / depth; // 10 / 10000
  }
}

