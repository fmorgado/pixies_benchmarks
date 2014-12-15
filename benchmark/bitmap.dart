library pixies_benchmarks.bench.bitmap;

import 'package:pixies_benchmarks/benchmark.dart';
import 'package:pixies_benchmarks/display.dart';
import 'package:pixies_benchmarks/geom.dart';

void main() {
  //_runBitmaps('w/o Rotation', 0.0);
  //_runBitmaps('w/  Rotation', 45.7);
  print('###########################################################');
  //_runBitmaps('w/o Rotation', 0.0);
  _runBitmaps('w/o Rotation', 0.0);
  _runBitmaps('w/o Rotation', 0.0);
  //_runBitmaps('w/  Rotation', 45.7);
  _runBitmaps('w/  Rotation', 45.7);
  _runBitmaps('w/  Rotation', 45.7);
}

void _runBitmaps(String name, double rotation) {
  final o1 = new Bitmap1();
  o1.rotation = rotation;
  final p1 = new Matrix();
  p1.setIdentity();
  
  final o2 = new Bitmap2();
  o2.rotation = rotation;
  final p2 = new Transform2();
  p2.setTransformIdentity();
  
  final o3 = new Bitmap3();
  o3.rotation = rotation;
  final p3 = new Transform3();
  
  final o4 = new Bitmap4();
  o4.rotation = rotation;
  final p4 = new Transform4();
  p4.setTransformIdentity();
  
  new BenchmarkSet('Bitmap  $name')
      //..add(new _Bitmap_1_1Bench(o1, p1))
      //..add(new _Bitmap_1_2Bench(o1, p1))
      //..add(new _Bitmap_1_3Bench(o1, p1))
      //..add(new _Bitmap_1_4Bench(o1, p1))
    ..add(new _Bitmap_2_1Bench(o2, p2))
    ..add(new _Bitmap_3_1Bench(o3, p3))
    ..add(new _Bitmap_3_2Bench(o3, p3))
    ..add(new _Bitmap_4_1Bench(o4, p4))
    ..add(new _Bitmap_4_2Bench(o4, p4))
    ..report();
}

class _Bitmap_1_1Bench extends Benchmark {
  final Bitmap1 o;
  final Matrix p;
  _Bitmap_1_1Bench(this.o, this.p): super('1 1');
  void run() {
    o.updateVertices1(p);
  }
}
class _Bitmap_1_2Bench extends Benchmark {
  final Bitmap1 o;
  final Matrix p;
  _Bitmap_1_2Bench(this.o, this.p): super('1 2');
  void run() {
    o.updateVertices2(p);
  }
}
class _Bitmap_1_3Bench extends Benchmark {
  final Bitmap1 o;
  final Matrix p;
  _Bitmap_1_3Bench(this.o, this.p): super('1 3');
  void run() {
    o.updateVertices3(p);
  }
}
class _Bitmap_1_4Bench extends Benchmark {
  final Bitmap1 o;
  final Matrix p;
  _Bitmap_1_4Bench(this.o, this.p): super('1 4');
  void run() {
    o.updateVertices4(p);
  }
}
class _Bitmap_2_1Bench extends Benchmark {
  final Bitmap2 o;
  final Transform2 p;
  _Bitmap_2_1Bench(this.o, this.p): super('2 1');
  void run() {
    o.updateVertices(p);
  }
}
class _Bitmap_3_1Bench extends Benchmark {
  final Bitmap3 o;
  final Transform3 p;
  _Bitmap_3_1Bench(this.o, this.p): super('3 1');
  void run() {
    o.updateVertices1(p);
  }
}
class _Bitmap_3_2Bench extends Benchmark {
  final Bitmap3 o;
  final Transform3 p;
  _Bitmap_3_2Bench(this.o, this.p): super('3 2');
  void run() {
    o.updateVertices2(p);
  }
}
class _Bitmap_4_1Bench extends Benchmark {
  final Bitmap4 o;
  final Transform4 p;
  _Bitmap_4_1Bench(this.o, this.p): super('4 1');
  void run() {
    o.updateVertices1(p);
  }
}
class _Bitmap_4_2Bench extends Benchmark {
  final Bitmap4 o;
  final Transform4 p;
  _Bitmap_4_2Bench(this.o, this.p): super('4 2');
  void run() {
    o.updateVertices2(p);
  }
}
