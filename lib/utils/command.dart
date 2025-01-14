import 'package:compass_app/utils/result.dart';
import 'package:flutter/material.dart';

typedef CommandAction<T> = Future<Result<T>> Function();
typedef CommandActionWithArguments<T, A> = Future<Result<T>> Function(A);

// Membuat abstract class Command untuk enkapsulasi perintah yg dijalankan
// Di class ini melihatkan running dan error statesnya
// dan juga tidak bisa memulai perintah yg sama sebelum perintah sebelumnya selesai
// Perintah harus membalikkan nilai Result
abstract class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;

  /// Hasilnya akan True jika perintah sedang berjalan
  bool get running => _running;

  Result<T>? _result;

  /// Hasilnya akan True jika perintah berakhir dengan error
  bool get error => _result is Error;

  /// Hasilnya akan True jika perintah berahikr dengan sukses
  bool get completed => _result is Ok;

  /// Mendapatkan hasil dari perintah yang terakhir dijalankan
  Result? get result => _result;

  /// Hapus hasil dari perintah yang terakhir dijalankan
  void clearResult() {
    _result = null;
    notifyListeners();
  }

  /// Implementasi internal
  Future<void> _execute(CommandAction<T> action) async {
    // Memastikan jika perintah tidak berjalan berulang
    // Contoh: menekan tombol berulang ulang
    if (_running) return;

    // Notify listeners
    // Contoh: memunculkan loading saat tombol ditekan
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

/// [Command] tanpa argument
/// Menggunakan CommantAction sebagai perintah
class CommandNonArgument<T> extends Command<T> {
  CommandNonArgument(this._action);

  final CommandAction<T> _action;

  /// Executes the action.
  Future<void> execute() async {
    await _execute(_action);
  }
}

/// [Command] dengan satu argumen
/// menggunakan CommandActionWithArguments sebagai perintah
class CommandWithArgument<T, A> extends Command<T> {
  CommandWithArgument(this._action);

  final CommandActionWithArguments<T, A> _action;

  /// Executes the action with the argument.
  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
