// Copyright (c) 2024, Metaspook
// A minimalistic data persistence handler.
import 'dart:async';

/// App-wide data Persistor.
/// * Platform agnostic key-value based data persistence.
class Persistor {
  const Persistor._(this._writer, this._reader, this._eraser);
  final Writer _writer;
  final Reader _reader;
  final Eraser _eraser;
  static late final Persistor _instance;

  /// Get instance of the Persistor, instance must be initialized by
  /// calling [initialize] once.
  static Persistor get instance {
    try {
      return _instance;
    } catch (_) {
      throw UnimplementedError('Persistor has not been initialized!');
    }
  }

  /// Initializes Persistor [instance].
  static void initialize({
    required Writer writer,
    required Reader reader,
    required Eraser eraser,
  }) => _instance = Persistor._(writer, reader, eraser);

  /// Writes data to persistence.
  T write<T extends Object?>(String key, {required T value}) {
    _writer(key, value);
    return value;
  }

  /// Reads data from persistence.
  /// * use `converter` incase of collection or custom types.
  T? read<T extends Object>(String key, [T Function(Object)? converter]) {
    final value = _reader(key);
    return converter != null && value != null
        ? converter(value as Object)
        : value is T
        ? value
        : null;
  }

  ///
  Future<T?> readAsync<T extends Object>(
    String key, [
    Future<T> Function(Object)? converter,
  ]) async {
    final value = _reader(key);
    return converter != null && value != null
        ? converter(value as Object)
        : value is T
        ? value
        : null;
  }

  /// Erases data (key-value pair) from persistence.
  void erase(String key) {
    _eraser(key);
  }
}

/// Signature for `write` callback.
typedef Writer = Future<void> Function(String key, dynamic value);

/// Signature for `read` callback.
typedef Reader = dynamic Function(String key);

/// Signature for `erase` callback.
typedef Eraser = Future<void> Function(String key);
// mixin PersistorMixin {
//   void save();
//   void delete();
// }
// write passthrough
// ReadOrWrite
