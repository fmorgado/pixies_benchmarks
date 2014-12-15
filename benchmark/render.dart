library pixies_benchmarks.bench.render;

import 'dart:typed_data';
import 'package:pixies_benchmarks/benchmark.dart';
import 'package:pixies_benchmarks/geom.dart';

void main() {
  _runRender();
  _runRender();
  _runRender();
}

void _runRender() {
  final points = new Float32List(8);
  final color = new RGBA();
  
  new BenchmarkSet('Render')
    ..add(new Render1Bench(points, color))
    ..add(new Render2Bench(points, color))
    ..add(new Render3Bench(points, color))
    ..add(new Render4Bench(points, color))
    ..add(new Render5Bench(points, color))
    ..add(new Render6Bench(new VertexPointsDouble(), color))
    ..add(new Render7Bench(new VertexPointsNum(), color))
    ..add(new Render8Bench(new VertexPointsDouble(), color))
    ..report();
}

class Render1Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final Float32List points;
  final RGBA color;
  
  Render1Bench(this.points, this.color): super('render1');
  
  void run() {
    renderer.renderQuad1(points, color);
  }
}

class Render2Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final Float32List points;
  final RGBA color;
  
  Render2Bench(this.points, this.color): super('render2');
  
  void run() {
    renderer.renderQuad2(points, color);
  }
}

class Render3Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final Float32List points;
  final RGBA color;
  
  Render3Bench(this.points, this.color): super('render3');
  
  void run() {
    renderer.renderQuad3(points, color);
  }
}

class Render4Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final Float32List points;
  final RGBA color;
  
  Render4Bench(this.points, this.color): super('render4');
  
  void run() {
    renderer.renderQuad4(points, color);
  }
}

class Render5Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final Float32List points;
  final RGBA color;
  
  Render5Bench(this.points, this.color): super('render5');
  
  void run() {
    renderer.renderQuad5(points, color);
  }
}

class Render6Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final VertexPointsDouble points;
  final RGBA color;
  
  Render6Bench(this.points, this.color): super('render6');
  
  void run() {
    renderer.renderQuad6(points, color);
  }
}

class Render7Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final VertexPointsNum points;
  final RGBA color;
  
  Render7Bench(this.points, this.color): super('render7');
  
  void run() {
    renderer.renderQuad7(points, color);
  }
}

class Render8Bench extends Benchmark {
  final Renderer renderer = new Renderer();
  final VertexPointsDouble points;
  final RGBA color;
  
  Render8Bench(this.points, this.color): super('render8');
  
  void run() {
    renderer.renderQuad6(points, color);
  }
}

class VertexPointsNum {
  num x1 = 0;
  num y1 = 0;
  num x2 = 0;
  num y2 = 0;
  num x3 = 0;
  num y3 = 0;
  num x4 = 0;
  num y4 = 0;
}

class VertexPointsDouble {
  double x1 = 0.0;
  double y1 = 0.0;
  double x2 = 0.0;
  double y2 = 0.0;
  double x3 = 0.0;
  double y3 = 0.0;
  double x4 = 0.0;
  double y4 = 0.0;
}

class Renderer {
  
  static const MAX_QUAD_COUNT = 256;
  
  final _vertexData = new Float32List(MAX_QUAD_COUNT * 4 * 6);
  int _quadCount = 0;
  int _vertexIndex = 0;
  
  Renderer();
  
  void renderQuad1(Float32List vertices, RGBA color) {
    if (_quadCount >= MAX_QUAD_COUNT) flush();
    
    int index = _quadCount * 4 * 6;
    final buffer = _vertexData;
    
    final r = color.red;
    final g = color.green;
    final b = color.blue;
    final a = color.alpha;
    
    buffer[index + 00] = vertices[0];
    buffer[index + 01] = vertices[1];
    buffer[index + 02] = r;
    buffer[index + 03] = g;
    buffer[index + 04] = b;
    buffer[index + 05] = a;
    
    buffer[index + 06] = vertices[2];
    buffer[index + 07] = vertices[3];
    buffer[index + 08] = r;
    buffer[index + 09] = g;
    buffer[index + 10] = b;
    buffer[index + 11] = a;
    
    buffer[index + 12] = vertices[4];
    buffer[index + 13] = vertices[5];
    buffer[index + 14] = r;
    buffer[index + 15] = g;
    buffer[index + 16] = b;
    buffer[index + 17] = a;
    
    buffer[index + 18] = vertices[6];
    buffer[index + 19] = vertices[7];
    buffer[index + 20] = r;
    buffer[index + 21] = g;
    buffer[index + 22] = b;
    buffer[index + 23] = a;
    
    _quadCount ++;
  }
  
  void renderQuad2(Float32List vertices, RGBA color) {
    if (_quadCount >= MAX_QUAD_COUNT) flush();
    
    int index = _quadCount * 4 * 6;
    final buffer = _vertexData;
    
    final r = color.red;
    final g = color.green;
    final b = color.blue;
    final a = color.alpha;
    
    buffer[index++] = vertices[0];
    buffer[index++] = vertices[1];
    buffer[index++] = r;
    buffer[index++] = g;
    buffer[index++] = b;
    buffer[index++] = a;
    
    buffer[index++] = vertices[2];
    buffer[index++] = vertices[3];
    buffer[index++] = r;
    buffer[index++] = g;
    buffer[index++] = b;
    buffer[index++] = a;
    
    buffer[index++] = vertices[4];
    buffer[index++] = vertices[5];
    buffer[index++] = r;
    buffer[index++] = g;
    buffer[index++] = b;
    buffer[index++] = a;
    
    buffer[index++] = vertices[6];
    buffer[index++] = vertices[7];
    buffer[index++] = r;
    buffer[index++] = g;
    buffer[index++] = b;
    buffer[index++] = a;
    
    _quadCount ++;
  }
  
  void renderQuad3(Float32List vertices, RGBA color) {
    if (_quadCount >= MAX_QUAD_COUNT) flush();
    
    int index = _quadCount * 4 * 6;
    
    _vertexData[index + 00] = vertices[0];
    _vertexData[index + 01] = vertices[1];
    _vertexData[index + 06] = vertices[2];
    _vertexData[index + 07] = vertices[3];
    _vertexData[index + 12] = vertices[4];
    _vertexData[index + 13] = vertices[5];
    _vertexData[index + 18] = vertices[6];
    _vertexData[index + 19] = vertices[7];
    
    _vertexData[index + 02] = _vertexData[index + 08] = _vertexData[index + 14] = _vertexData[index + 20] = color.red;
    _vertexData[index + 03] = _vertexData[index + 09] = _vertexData[index + 15] = _vertexData[index + 21] = color.green;
    _vertexData[index + 04] = _vertexData[index + 10] = _vertexData[index + 16] = _vertexData[index + 22] = color.blue;
    _vertexData[index + 05] = _vertexData[index + 11] = _vertexData[index + 17] = _vertexData[index + 23] = color.alpha;
    
    _quadCount ++;
  }
  
  void renderQuad4(Float32List vertices, RGBA color) {
    if (_vertexIndex >= MAX_QUAD_COUNT * 4 * 6) flush();
    
    int index = _vertexIndex;
    
    _vertexData[index + 00] = vertices[0];
    _vertexData[index + 01] = vertices[1];
    _vertexData[index + 06] = vertices[2];
    _vertexData[index + 07] = vertices[3];
    _vertexData[index + 12] = vertices[4];
    _vertexData[index + 13] = vertices[5];
    _vertexData[index + 18] = vertices[6];
    _vertexData[index + 19] = vertices[7];
    
    _vertexData[index + 02] = _vertexData[index + 08] = _vertexData[index + 14] = _vertexData[index + 20] = color.red;
    _vertexData[index + 03] = _vertexData[index + 09] = _vertexData[index + 15] = _vertexData[index + 21] = color.green;
    _vertexData[index + 04] = _vertexData[index + 10] = _vertexData[index + 16] = _vertexData[index + 22] = color.blue;
    _vertexData[index + 05] = _vertexData[index + 11] = _vertexData[index + 17] = _vertexData[index + 23] = color.alpha;
    
    _vertexIndex += 4 * 6;
  }
  
  void renderQuad5(Float32List vertices, RGBA color) {
    if (_vertexIndex >= MAX_QUAD_COUNT * 4 * 6) flush();
    
    _vertexData[_vertexIndex + 00] = vertices[0];
    _vertexData[_vertexIndex + 01] = vertices[1];
    _vertexData[_vertexIndex + 06] = vertices[2];
    _vertexData[_vertexIndex + 07] = vertices[3];
    _vertexData[_vertexIndex + 12] = vertices[4];
    _vertexData[_vertexIndex + 13] = vertices[5];
    _vertexData[_vertexIndex + 18] = vertices[6];
    _vertexData[_vertexIndex + 19] = vertices[7];
    
    _vertexData[_vertexIndex + 02] = _vertexData[_vertexIndex + 08] = _vertexData[_vertexIndex + 14] = _vertexData[_vertexIndex + 20] = color.red;
    _vertexData[_vertexIndex + 03] = _vertexData[_vertexIndex + 09] = _vertexData[_vertexIndex + 15] = _vertexData[_vertexIndex + 21] = color.green;
    _vertexData[_vertexIndex + 04] = _vertexData[_vertexIndex + 10] = _vertexData[_vertexIndex + 16] = _vertexData[_vertexIndex + 22] = color.blue;
    _vertexData[_vertexIndex + 05] = _vertexData[_vertexIndex + 11] = _vertexData[_vertexIndex + 17] = _vertexData[_vertexIndex + 23] = color.alpha;
    
    _vertexIndex += 4 * 6;
  }
  
  void renderQuad6(VertexPointsDouble points, RGBA color) {
    if (_vertexIndex >= MAX_QUAD_COUNT * 4 * 6) flush();
    
    _vertexData[_vertexIndex + 00] = points.x1;
    _vertexData[_vertexIndex + 01] = points.y1;
    _vertexData[_vertexIndex + 06] = points.x2;
    _vertexData[_vertexIndex + 07] = points.y2;
    _vertexData[_vertexIndex + 12] = points.x3;
    _vertexData[_vertexIndex + 13] = points.y3;
    _vertexData[_vertexIndex + 18] = points.x4;
    _vertexData[_vertexIndex + 19] = points.y4;
    
    _vertexData[_vertexIndex + 02] = _vertexData[_vertexIndex + 08] = _vertexData[_vertexIndex + 14] = _vertexData[_vertexIndex + 20] = color.red;
    _vertexData[_vertexIndex + 03] = _vertexData[_vertexIndex + 09] = _vertexData[_vertexIndex + 15] = _vertexData[_vertexIndex + 21] = color.green;
    _vertexData[_vertexIndex + 04] = _vertexData[_vertexIndex + 10] = _vertexData[_vertexIndex + 16] = _vertexData[_vertexIndex + 22] = color.blue;
    _vertexData[_vertexIndex + 05] = _vertexData[_vertexIndex + 11] = _vertexData[_vertexIndex + 17] = _vertexData[_vertexIndex + 23] = color.alpha;
    
    _vertexIndex += 4 * 6;
  }
  
  void renderQuad7(VertexPointsNum points, RGBA color) {
    if (_vertexIndex >= MAX_QUAD_COUNT * 4 * 6) flush();
    
    _vertexData[_vertexIndex + 00] = points.x1.toDouble();
    _vertexData[_vertexIndex + 01] = points.y1.toDouble();
    _vertexData[_vertexIndex + 06] = points.x2.toDouble();
    _vertexData[_vertexIndex + 07] = points.y2.toDouble();
    _vertexData[_vertexIndex + 12] = points.x3.toDouble();
    _vertexData[_vertexIndex + 13] = points.y3.toDouble();
    _vertexData[_vertexIndex + 18] = points.x4.toDouble();
    _vertexData[_vertexIndex + 19] = points.y4.toDouble();
    
    _vertexData[_vertexIndex + 02] = _vertexData[_vertexIndex + 08] = _vertexData[_vertexIndex + 14] = _vertexData[_vertexIndex + 20] = color.red;
    _vertexData[_vertexIndex + 03] = _vertexData[_vertexIndex + 09] = _vertexData[_vertexIndex + 15] = _vertexData[_vertexIndex + 21] = color.green;
    _vertexData[_vertexIndex + 04] = _vertexData[_vertexIndex + 10] = _vertexData[_vertexIndex + 16] = _vertexData[_vertexIndex + 22] = color.blue;
    _vertexData[_vertexIndex + 05] = _vertexData[_vertexIndex + 11] = _vertexData[_vertexIndex + 17] = _vertexData[_vertexIndex + 23] = color.alpha;
    
    _vertexIndex += 4 * 6;
  }
  
  void renderQuad8(VertexPointsDouble points, RGBA color) {
    if (_vertexIndex >= MAX_QUAD_COUNT * 4 * 6) flush();
    
    if (_vertexIndex >= MAX_QUAD_COUNT * 4 * 6) return;
    
    _vertexData[_vertexIndex + 00] = points.x1;
    _vertexData[_vertexIndex + 01] = points.y1;
    _vertexData[_vertexIndex + 06] = points.x2;
    _vertexData[_vertexIndex + 07] = points.y2;
    _vertexData[_vertexIndex + 12] = points.x3;
    _vertexData[_vertexIndex + 13] = points.y3;
    _vertexData[_vertexIndex + 18] = points.x4;
    _vertexData[_vertexIndex + 19] = points.y4;
    
    _vertexData[_vertexIndex + 02] = _vertexData[_vertexIndex + 08] = _vertexData[_vertexIndex + 14] = _vertexData[_vertexIndex + 20] = color.red;
    _vertexData[_vertexIndex + 03] = _vertexData[_vertexIndex + 09] = _vertexData[_vertexIndex + 15] = _vertexData[_vertexIndex + 21] = color.green;
    _vertexData[_vertexIndex + 04] = _vertexData[_vertexIndex + 10] = _vertexData[_vertexIndex + 16] = _vertexData[_vertexIndex + 22] = color.blue;
    _vertexData[_vertexIndex + 05] = _vertexData[_vertexIndex + 11] = _vertexData[_vertexIndex + 17] = _vertexData[_vertexIndex + 23] = color.alpha;
    
    _vertexIndex += 4 * 6;
  }
  
  void flush() {
    _vertexIndex = 0;
    _quadCount = 0;
  }
  
}

