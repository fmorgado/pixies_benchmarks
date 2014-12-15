library pixies_benchmarks.bench.transform;

import 'package:pixies_benchmarks/benchmark.dart';
import 'package:pixies_benchmarks/display.dart';
import 'package:pixies_benchmarks/geom.dart';

void main() {
  _runTransformBench('w/o Rotation', 0.0);
  _runTransformBench('w/  Rotation', 45.7);
  print('###########################################################');
  _runTransformBench('w/o Rotation', 0.0);
  _runTransformBench('w/o Rotation', 0.0);
  _runTransformBench('w/o Rotation', 0.0);
  _runTransformBench('w/  Rotation', 45.7);
  _runTransformBench('w/  Rotation', 45.7);
  _runTransformBench('w/  Rotation', 45.7);
}

void _runTransformBench(String name, double rotation) {
  final o1 = new Transform1();
  o1.rotation = rotation;
  final p1 = new Matrix();
  
  final o2 = new Transform2();
  o2.rotation = rotation;
  final p2 = new Transform2();
  p2.setTransformIdentity();
  
  final o3 = new Transform3();
  o3.rotation = rotation;
  final p3 = new Transform3();
  
  final o4 = new Transform4();
  o4.rotation = rotation;
  final p4 = new Transform4();
  
  new BenchmarkSet('Transform  $name')
    //..add(new _Transform_1_1Bench(o1, p1))
    //..add(new _Transform_1_2Bench(o1, p1))
    //..add(new _Transform_1_3Bench(o1, p1))
    ..add(new _Transform_1_4Bench(o1, p1))
    ..add(new _Transform_1_5Bench(o1, p1))
    ..add(new _Transform_2_1Bench(o2, p2))
    ..add(new _Transform_2_2Bench(o2, p2))
    ..add(new _Transform_3_1Bench(o3, p3))
    ..add(new _Transform_3_2Bench(o3, p3))
    ..add(new _Transform_4_1Bench(o4, p4))
    ..add(new _Transform_4_2Bench(o4, p4))
    ..report();
}

class _Transform_1_1Bench extends Benchmark {
  final Transform1 o;
  final Matrix p;
  _Transform_1_1Bench(this.o, this.p): super('1 1');
  void run() {
    o.updateTransform1(p);
  }
}
class _Transform_1_2Bench extends Benchmark {
  final Transform1 o;
  final Matrix p;
  _Transform_1_2Bench(this.o, this.p): super('1 2');
  void run() {
    o.updateTransform2(p);
  }
}
class _Transform_1_3Bench extends Benchmark {
  final Transform1 o;
  final Matrix p;
  _Transform_1_3Bench(this.o, this.p): super('1 3');
  void run() {
    o.updateTransform3(p);
  }
}
class _Transform_1_4Bench extends Benchmark {
  final Transform1 o;
  final Matrix p;
  _Transform_1_4Bench(this.o, this.p): super('1 4');
  void run() {
    o.updateTransform4(p);
  }
}
class _Transform_1_5Bench extends Benchmark {
  final Transform1 o;
  final Matrix p;
  _Transform_1_5Bench(this.o, this.p): super('1 5');
  void run() {
    o.updateTransform5(p);
  }
}
class _Transform_2_1Bench extends Benchmark {
  final Transform2 o;
  final Transform2 p;
  _Transform_2_1Bench(this.o, this.p): super('2 1');
  void run() {
    o.updateTransform1(p);
  }
}
class _Transform_2_2Bench extends Benchmark {
  final Transform2 o;
  final Transform2 p;
  _Transform_2_2Bench(this.o, this.p): super('2 2');
  void run() {
    o.updateTransform2(p);
  }
}
class _Transform_3_1Bench extends Benchmark {
  final Transform3 o;
  final Transform3 p;
  _Transform_3_1Bench(this.o, this.p): super('3 1');
  void run() {
    o.updateTransform1(p);
  }
}
class _Transform_3_2Bench extends Benchmark {
  final Transform3 o;
  final Transform3 p;
  _Transform_3_2Bench(this.o, this.p): super('3 2');
  void run() {
    o.updateTransform1(p);
  }
}
class _Transform_4_1Bench extends Benchmark {
  final Transform4 o;
  final Transform4 p;
  _Transform_4_1Bench(this.o, this.p): super('4 1');
  void run() {
    o.updateTransform1(p);
  }
}
class _Transform_4_2Bench extends Benchmark {
  final Transform4 o;
  final Transform4 p;
  _Transform_4_2Bench(this.o, this.p): super('4 2');
  void run() {
    o.updateTransform2(p);
  }
}
