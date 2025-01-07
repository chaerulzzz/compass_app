// Class untuk membungkus hasil services
// Menggunakan Switch expression seperti contoh:
//
// switch (result) {
//  case Ok(): {
//    print(result.value);
//  }
//  case Error(): {
//     print(result.error);
//   }
// }
//

sealed class Result<T> {
  const Result();

  // Buat variable const untuk hasil OK
  const factory Result.ok(T value) = Ok._;

  // Buat variable const untuk hasil Error
  const factory Result.error(Exception error) = Error._;
}

// Sub class Result untuk hasil OK
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

// Sub class Result untuk hasil Error
final class Error<T> extends Result<T> {
  const Error._(this.error);

  final Exception error;

  @override
  String toString() => 'Result<$T>.Error($error)';
}
