// ignore_for_file: avoid_print

import 'dart:core';
import 'dart:math';
import 'dart:typed_data';

import 'package:utils/utils.dart';

// NOTE: Separate extensions as file per type in a folder if getting larger.

// Config
final _random = Random();

// extension IterableExt<T> on Iterable<T> {
//   T? _resolve(params) {
//     try {

//     } catch (e) {}
//     return null;
//   }

//   T? firstWhereOrNull(bool Function(T) test) {

//     for (final e in this) {
//       if (test(e)) return e;
//     }
//     return null;
//   }

//   T? lastOrNullWhere(bool Function(T) test) {
//     T? result;
//     for (final e in this) {
//       if (test(e)) result = e;
//     }
//     return result;
//   }

//   T? singleOrNullWhere(bool Function(T) test) {
//     T? found;
//     for (final e in this) {
//       if (test(e)) {
//         if (found != null) return null; // More than one match found
//         found = e;
//       }
//     }
//     return found;
//   }
// }

// extension JsonExt on Json {
//   T getValue<T extends Object?>(String key) => this[key] as T;
//   // Non-nullable
//   String getString(String key) => getStringOrNull(key) ?? '';
//   bool getBool(String key) => getBoolOrNull(key) ?? false;
//   num getNum(String key) => getNumOrNull(key) ?? 0;
//   int getInt(String key) => getIntOrNull(key) ?? 0;
//   double getDouble(String key) => getDoubleOrNull(key) ?? 0.0;
//   // Nullable
//   String? getStringOrNull(String key) => getValue<String>(key);
//   bool? getBoolOrNull(String key) => getValue<bool>(key);
//   num? getNumOrNull(String key) => getValue<num>(key);
//   int? getIntOrNull(String key) => getNumOrNull(key)?.toInt();
//   double? getDoubleOrNull(String key) => getNumOrNull(key)?.toDouble();
// }

// extension FileExt on File {
//   /// The `mimeType` of the file. e.g. 'image/jpeg'.
//   Future<String?> mimeType() => openRead(
//         0,
//         defaultMagicNumbersMaxLength,
//       ).first.then(
//             (headerBytes) => lookupMimeType(path, headerBytes: headerBytes),
//           );

//   String get name => p.basenameWithoutExtension(path);

//   String get nameExtended => p.basename(path);

//   String get nameExtension => p.extension(path);

//   String get dirName => p.dirname(path);
// }

// extension FlutterSecureStorageExt on FlutterSecureStorage {
//   /// readExistingOrCreate  new
//   Future<String?> readOrWrite({
//     required String key,
//     required String? value,
//   }) async {
//     final pervious = await read(key: key);
//     if (pervious != null) return pervious;
//     await write(key: key, value: value);
//     return read(key: key);
//   }
// }

const _dateFormatStr = 'dd/MM/yyyy';

// extension DateTimeExt on DateTime {
//   String formatDate() {
//     final dateFormat = DateFormat(_dateFormatStr);
//     return dateFormat.format(this);
//   }

//   DateTime dayStart() => DateTime(year, month, day);

//   DateTime monthStart() => DateTime(year, month);

//   DateTime dayEnd() => copyWith(
//         hour: 23,
//         minute: 59,
//         second: 59,
//         millisecond: 999,
//         microsecond: 999,
//       );

//   int get remainingDays => difference(DateTime.now()).inDays;

//   bool isSameDay(DateTime date) {
//     return year == date.year && month == date.month && day == date.day;
//   }
// }

extension StringCaseExt on String {
  /// Converts a string to kebab-case format.
  ///
  /// Examples:
  /// - 'APIConfig' → 'api-config'
  /// - 'userProfile' → 'user-profile'
  /// - 'SMS_Preview' → 'sms-preview'
  /// - 'Device IO' → 'device-io'
  /// - 'user_profile' → 'user-profile'
  ///
  /// Handles:
  /// * PascalCase
  /// * camelCase
  /// * snake_case
  /// * Acronyms (e.g., API, IO, SMS)
  /// * Spaces and underscores
  // written by Metaspook
  String toKebabCase() => RegExp(
    r'[A-Z]{2,}(?=[A-Z][a-z]|\d|\W|$)|[A-Z][a-z]+|\d+|[a-z]+',
  ).allMatches(this).map((m) => m[0]!.toLowerCase()).join('-');
}

///
extension StringExt on String {
  ///
  String limit(int maxLength, {bool ellipsis = true}) => length > maxLength
      ? '${substring(0, maxLength)}${ellipsis ? '...' : ''}'
      : this;

  int toInt() => int.parse(this);

  double toDouble() => double.parse(this);

  String get first => this[0];

  String get last => this[length - 1];

  int get firstIndex => 0;

  int get lastIndex => length - 1;

  String get lastRemoved => substring(0, lastIndex);

  String get reversed => String.fromCharCodes(codeUnits.reversed);

  String toCapitalize() => '${this[0].toUpperCase()}${substring(1)}';

  bool get isExpression => RegExp('[-+*/%]').hasMatch(this);

  String toJsonLog() {
    final object = jsonDecoder.convert(this);
    return jsonEncoderIndented.convert(object);
  }

  // String get drawerAssetPath => 'assets/icons/${this}_drawer.svg';

  // String get reportAssetPath => 'assets/images/$this.png';
}

/// Integer Extensions.
/// Adds extensions to the `int` class for randomization.
extension IntExt on int {
  /// Generates a random integer between 0 and the value of the original integer
  ///
  /// Example:
  /// ```dart
  /// int max = 10;
  /// int randomValue = max.randomize(); // returns a value between 0 and 9
  /// ```
  int randomize() => _random.nextInt(this);
}

/// Generic Extensions for generic types.
// extension GenericExt<T> on T {
/// Repeats the value for the specified number of times in a list.
///
/// Example:
/// ```dart
/// var value = 'hello';
/// var repeated = value * 3; // returns ['hello', 'hello', 'hello']
/// ```
// List<T> operator *(int other) => [for (var i = 0; i < other; i++) this];
// }

/// Number Extensions.
/// Adds additional functionality to the `num` class.
extension NumberExt on num {
  /// Returns the length of the number when converted to a string.
  ///
  /// Example:
  /// ```dart
  /// num value = 12345;
  /// int length = value.length; // returns 5
  /// ```
  int get length => toString().length;
}

/// Map Extensions.
/// Adds extended functionality to the `Map` class.
extension MapExt<K, V> on Map<K, V> {
  /// Converts the map to a JSON-compatible map (String -> Object?).
  ///
  /// Example:
  /// ```dart
  /// Map<String, int> myMap = {'key': 1};
  /// var json = myMap.toJson(); // returns {'key': 1}
  /// ```
  Map<String, Object?> toJson() => Map<String, Object?>.from(this);

  /// Converts the map to a JSON-formatted string with indentation for logging.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int> myMap = {'key': 1};
  /// var jsonLog = myMap.toJsonLog(); // returns a pretty-printed JSON string
  /// ```
  String toJsonLog() => jsonEncoderIndented.convert(this);
}

/// Extensions for handling `Null` type objects.
extension NotAvailableMethod on Null {
  /// Returns a default "Not Available" string when `null` is encountered.
  ///
  /// Example:
  /// ```dart
  /// Null value = null;
  /// print(value.notAvailable); // prints 'N/A'
  /// ```
  String get notAvailable => 'N/A';
}

///
extension NonNullableObjectExt on Object {
  ///
  String toStringEmptyParsed([String value = naUStr]) =>
      toString().isEmpty ? value : toString();
}

/// Generic method to handle nullable values.
extension NullableObjectExt on Object? {
  /// A string representation of this object.
  /// * Parse `null` into 'N/A' (Not Available) or given value.
  /// * See also [toString] doc comment.
  String toStringNullParsed([String value = naUStr]) =>
      this == null ? value : toString();

  ///
  String toStringEmptyOrNullParsed([String value = naUStr]) =>
      this == null || toString().isEmpty ? value : toString();

  /// Converts the object to a string and applies color coding for log levels.
  ///
  /// The color codes are as follows:
  /// - 0: Success (cyan)
  /// - 1: Warning (yellow)
  /// - 2: Error (red)
  /// - 3: Info (green, default)
  ///
  /// Example:
  /// ```dart
  /// var value = 'Error message';
  /// print(value.toStringLog(2)); // prints the value in red
  /// ```
  String toStringLog([int level = 3]) {
    final code = switch (level) {
      0 => 36,
      1 => 33,
      2 => 31,
      _ => 32,
    };
    return '\x1B[${code}m$this\x1B[0m';
  }

  /// Pretty-prints the JSON representation of the object with
  /// optional indentation and logging level.
  ///
  /// Example:
  /// ```dart
  /// var myObject = {'key': 'value'};
  /// myObject.doPrintJson(); // prints the JSON in a pretty format
  /// ```
  void doPrintJson([String prefix = '', int level = 3]) {
    jsonEncoderIndented.convert(this).doPrint(prefix, level);
  }

  /// Prints the object's string representation to the console with
  /// optional indentation and logging level.
  /// Example:
  /// ```dart
  /// var myObject = {'key': 'value'};
  /// myObject.doPrint(); // prints the object's string representation
  /// ```
  void doPrint([String prefix = '', int level = 3]) {
    if (debugMode) {
      String parse(RegExpMatch m) => '$prefix${m.group(0)}'.toStringLog(level);
      final str = toString();
      str.isEmpty
          ? print(prefix.toStringLog(level))
          : RegExp('.{1,1018}').allMatches(str).map(parse).forEach(print);
    }
  }
}

T withPrint<T>(T value) {
  doPrint(value);
  return value;
}

/// collected from Hive non public API
extension RandomX on Random {
  ///  public API
  Uint8List nextBytes(int length) {
    final buffer = Uint8List(length);
    for (var i = 0; i < length; i++) {
      buffer[i] = nextInt(0xFF + 1);
    }
    return buffer;
  }
}
