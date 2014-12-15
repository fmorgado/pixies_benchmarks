library pixies_benchmarks.bench.matrix3D;

import 'dart:math' as math;

import 'package:pixies_benchmarks/benchmark.dart';
import 'package:pixies_benchmarks/display.dart';
import 'package:pixies_benchmarks/geom.dart';

void main() {
  //_runAll();
  _runPerspective();
}

void _runAll() {
  _runIdentity();
  _runMultiply();
  _runUpdate();
  _runPerspective();
}

void _runPerspective() {
  final random = new math.Random();
  final depth = random.nextDouble() * 2000 + 9000;
  final scale = random.nextDouble() * 4 + 8;
  
  new BenchmarkSet('Perspective')
    ..add(new _Perspective1Bench(depth, scale))
    ..add(new _Perspective2Bench(depth, scale))
    ..add(new _Perspective3Bench(depth, scale))
    ..add(new _Perspective4Bench(depth, scale))
    ..report()
    ..report()
    ..report()
    ..report();
}

void _runUpdate() {
  final sprite = new Sprite3D();
  sprite.setRandomValues();
  
  _runUpdateOn('Update w/  Rotation', sprite);
  
  sprite.rotationX = sprite.rotationY = sprite.rotationZ = 0.0;
  _runUpdateOn('Update w/o Rotation', sprite);
}

void _runUpdateOn(String name, Sprite3D sprite) {
  new BenchmarkSet(name)
    ..add(new _Update1Bench(sprite))
    ..add(new _Update2Bench(sprite))
    ..report()
    ..report()
    ..report();
}

void _runMultiply() {
  final m1 = new Matrix3D.random();
  final m2 = new Matrix3D.random();
  
  new BenchmarkSet('Multiply')
    ..add(new _Multiply1Bench(m1, m2))
    ..add(new _Multiply2Bench(m1, m2))
    ..add(new _Multiply3Bench(m1, m2))
    ..add(new _Multiply4Bench(m1, m2))
    ..report()
    ..report()
    ..report()
    ..report();
}

void _runIdentity() {
  final matrix = new Matrix3D.random();
  
  new BenchmarkSet('Identity')
    ..add(new _Identity1Bench(matrix))
    ..add(new _Identity2Bench(matrix))
    ..report()
    ..report()
    ..report()
    ..report();
}

class _Identity1Bench extends Benchmark {
  final Matrix3D matrix;
  _Identity1Bench(this.matrix): super('1');
  void run() {
    matrix.setIdentity();
  }
}
class _Identity2Bench extends Benchmark {
  final Matrix3D matrix;
  _Identity2Bench(this.matrix): super('2');
  void run() {
    matrix.setIdentity2();
  }
}

class _Multiply1Bench extends Benchmark {
  final Matrix3D m1;
  final Matrix3D m2;
  _Multiply1Bench(this.m1, this.m2): super('1');
  void run() {
    m1.multiply(m2);
  }
}
class _Multiply2Bench extends Benchmark {
  final Matrix3D m1;
  final Matrix3D m2;
  _Multiply2Bench(this.m1, this.m2): super('2');
  void run() {
    m1.multiply2(m2);
  }
}
class _Multiply3Bench extends Benchmark {
  final Matrix3D m1;
  final Matrix3D m2;
  _Multiply3Bench(this.m1, this.m2): super('3');
  void run() {
    m1.multiply3(m2);
  }
}
class _Multiply4Bench extends Benchmark {
  final Matrix3D m1;
  final Matrix3D m2;
  _Multiply4Bench(this.m1, this.m2): super('4');
  void run() {
    m1.multiply4(m2);
  }
}

class _Update1Bench extends Benchmark {
  final Sprite3D sprite;
  _Update1Bench(this.sprite): super('1');
  void run() {
    sprite.updateTransform3D();
  }
}
class _Update2Bench extends Benchmark {
  final Sprite3D sprite;
  _Update2Bench(this.sprite): super('2');
  void run() {
    sprite.updateTransform3D_2();
  }
}

class _Perspective1Bench extends Benchmark {
  final Matrix3D matrix = new Matrix3D.identity();
  final double depth;
  final double scale;
  _Perspective1Bench(this.depth, this.scale): super('1');
  void run() {
    matrix.applyPerspective(depth, scale);
  }
}

class _Perspective2Bench extends Benchmark {
  final Matrix3D matrix = new Matrix3D.identity();
  final Matrix3D perspective = new Matrix3D.identity();
  final double depth;
  final double scale;
  _Perspective2Bench(this.depth, this.scale): super('2');
  void run() {
    perspective.data[10] = 1.0 / depth;   // 1 / 10000
    perspective.data[14] = scale / depth; // 10 / 10000
    matrix.multiply(perspective);
  }
}

class _Perspective3Bench extends Benchmark {
  final Matrix3D matrix = new Matrix3D.identity();
  final Matrix3D perspective = new Matrix3D.identity();
  final double depth;
  final double scale;
  _Perspective3Bench(this.depth, this.scale): super('3');
  void run() {
    perspective.setPerspective(depth, scale);
    matrix.multiply(perspective);
  }
}

class _Perspective4Bench extends Benchmark {
  final Matrix3D matrix = new Matrix3D.identity();
  final double depth;
  final double scale;
  _Perspective4Bench(this.depth, this.scale): super('4');
  void run() {
    matrix.applyPerspective2(depth, scale);
  }
}
