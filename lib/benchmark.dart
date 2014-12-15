library pixies_benchmarks.benchmark;

/// Represent the score of a benchmark.
class Score {
  /// The name of the benchmark.
  final String  name;
  /// The value of the score.
  final num     value;
  
  /// Constructor.
  const Score(this.name, this.value);
  
  String toString() =>
      '$name:  ${value.toStringAsFixed(4)}';
}

/// Represent a set of benchmark scores.
class ScoreSet {
  /// The name of the benchmark set.
  final String name;
  /// The benchmark scores of the set.
  final List<Score> scores;
  
  /// Constructor.
  const ScoreSet(this.name, this.scores);
  
  String toString() {
    final maxLen = scores.fold(0,
        (int current, Score score) =>
          score.name.length > current ? score.name.length : current);
    final minValue = scores.fold(double.MAX_FINITE,
        (num current, Score score) =>
            score.value < current ? score.value : current);
    scores.sort(
        (Score score1, Score score2) =>
            score1.value.compareTo(score2.value));
    
    final buffer = new StringBuffer();
    buffer.writeln('####  $name');
    
    scores.forEach((Score score) {
      void pad(int code, int length) {
        while (length-- > 0) buffer.writeCharCode(code);
      }
      void padLeft(String label, int length) {
        pad(32, length - label.length);
        buffer.write(label);
      }
      void padRight(String label, int length) {
        buffer.write(label);
        pad(32, length - label.length);
      }
      
      buffer.write('      ');
      padRight(score.name, maxLen + 2);
      padLeft(score.value.toStringAsFixed(4), 14);
      padLeft((score.value / minValue).toStringAsFixed(2), 8);
      buffer.writeln();
    });
    
    return buffer.toString();
  }
}

/// The type of a score emitter.
typedef void ScoreEmitter(Score score);
/// The type of a score set emitter.
typedef void ScoreSetEmitter(ScoreSet scoreSet);

class Benchmark {
  static double measureFor(Function f, int timeMinimum) {
    int time = 0;
    int iter = 0;
    Stopwatch watch = new Stopwatch();
    watch.start();
    int elapsed = 0;
    while (elapsed < timeMinimum) {
      f();
      elapsed = watch.elapsedMilliseconds;
      iter++;
    }
    return 1000.0 * elapsed / iter;
  }
  
  final String        name;
  final ScoreEmitter  emitter;
  
  const Benchmark(this.name, {this.emitter: print});
  
  /// The benchmark code.
  void run() {}
  
  /// Initialize the benchmark.
  void setup() {}
  
  /// De-initializes the benchmark.
  void teardown() {}
  
  /// Exercises the benchmark.
  void exercise() {
    for (int i = 0; i < 10; i++) {
      run();
    }
  }
  
  /// Measures the score for the benchmark and returns it.
  Score measure() {
    setup();
    // Warmup for at least 100ms. Discard result.
    measureFor(() { this.run(); }, 100);
    // Run the benchmark for at least 2000ms.
    double result = measureFor(() { this.exercise(); }, 2000);
    teardown();
    return new Score(name, result);
  }
  
  /// Report the score of the benchmark.
  void report() {
    emitter(measure());
  }
}

class BenchmarkSet {
  final String name;
  final ScoreSetEmitter emitter;
  final _benchs = <Benchmark>[];
  
  BenchmarkSet(this.name, {this.emitter: print});
  
  /// Adds a benchmark to the set.
  void add(Benchmark bench) {
    _benchs.add(bench);
  }
  
  /// Gets the score set.
  ScoreSet getScoreSet() {
    final scores = <Score>[];
    
    _benchs.forEach((bench) {
      scores.add(bench.measure());
    });
    
    return new ScoreSet(name, scores);
  }
  
  /// Reports the benchmark scores.
  void report() {
    emitter(getScoreSet());
  }
}
