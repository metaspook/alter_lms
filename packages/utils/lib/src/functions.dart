import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

// import 'package:database_client/database_client.dart';
// import 'package:domain/domain.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
// import 'package:image/image.dart' as img;
// import 'package:powersync_helper/powersync_helper.dart';
// import 'package:utils/src/src.dart';
import 'package:utils/utils.dart';
import 'package:uuid/uuid.dart';

//-- Config
final _random = Random();
final _randomSecure = Random.secure();

// dataOnly false for clear all cache
// void clearCache({bool dataOnly = true}) => dataOnly
//     ? AppKeys.cachesData
//     : AppKeys.cachesAll.forEach(Persister.instance.erase);

//-- Public APIs
/// Calculates percent amount of actual `amount` by `amountPercent`.
/// * checks if `amount` OR `amountPercent` is lesser than 1
/// * checks if `amountPercent` is greater than 100
double calculatePercentAmount(double amount, {required double amountPercent}) =>
    amount <= 0 || amountPercent <= 0 || 100 < amountPercent
    ? 0
    : (amountPercent / 100) * amount;

/// Calculates percent of actual `amount` by `percentAmount`.
/// * checks if `amount` OR `percentAmount` is lesser than 1
/// * checks if `percentAmount` is greater than `price`.
double calculateAmountPercent(double amount, {required double percentAmount}) =>
    amount <= 0 || percentAmount <= 0 || amount < percentAmount
    ? 0
    : 100 * (percentAmount / amount);

/// Calculates discounted price after discount from previous price.
/// * checks if `price` OR `discountAmount` is lesser than 1
/// * checks if `discountAmount` is greater than `price`.
double calculateDiscountedPrice(
  double price, {
  required double discountAmount,
}) => price <= 0 || discountAmount <= 0 || price < discountAmount
    ? price
    : price - discountAmount;

/// Calculates additional charged price after added to previous price.
/// * checks if `price` OR `additionalChargesAmount` is lesser than 1
double calculateAdditionalChargedPrice(
  double price, {
  required double additionalChargesAmount,
}) => price <= 0 || additionalChargesAmount <= 0
    ? price
    : price + additionalChargesAmount;

double calculateBillAmount(
  double price, {
  double additionalChargesAmount = 0,
  double discountAmount = 0,
}) => price <= 0 || additionalChargesAmount < 0 || discountAmount < 0
    ? price
    : price + additionalChargesAmount - discountAmount;

double calculateSubTotal(double price, {double quantity = 1}) {
  return price <= 0 || quantity <= 0 ? price : price * quantity;
}

/// Generates a unique id. `[RNG version 4 | random]`
String uuid() => const Uuid().v4();

// Copyright (c) 2024, Metaspook
/// A minimalistic in-memory cache service.
/// * Value type will be `Object?` if not specify in place of `T`.
Map<String, T> cacheMap<T extends Object?>() => <String, T>{};

// String iconAssetPath(String key) => 'assets/icons/$key.svg';

List<E> searcher<E>(
  String text, {
  required List<E> items,
  required Set<String> Function(E item) selector,
}) => items.search(text, selector: selector);

/// Benchmarks a given function by executing it [iterations] times.
/// [fn] is the function to benchmark.
/// [iterations] specifies how many times the function will run.
/// Returns the average execution time in [µs] microseconds.
double benchmark(Function fn, {int iterations = 1000, bool logged = true}) {
  final stopwatch = Stopwatch()..start();
  for (var i = 0; i < iterations; i++) {
    // ignore: avoid_dynamic_calls
    fn();
  }
  stopwatch.stop();
  final avgTime = stopwatch.elapsedMicroseconds / iterations;
  // ignore: avoid_print
  if (logged) print('Average execution time: ${avgTime.toStringAsFixed(2)} µs');
  return avgTime;
}

/// return as jpeg format and .jpg extension
// Future<File?> resizeAndCompressImage(
//   String path, {
//   int maxWidth = 480,
//   int maxHeight = 480,
//   int quality = 60,
//   String? name,
//   bool removeOriginal = true,
// }) async {
//   // validate quality parameter
//   if (quality < 0 || quality > 100) {
//     throw ArgumentError.value(quality, 'quality', 'Must be between 0 and 100');
//   }
//   final file = File(path);
//   // decoding image
//   final image = img.decodeImage(await file.readAsBytes());
//   if (image == null) return null;
//   // calculating height, width and aspectRatio
//   final aspectRatio = image.width / image.height;
//   final widthConstrained = image.width / maxWidth > image.height / maxHeight;
//   final (newHeight, newWidth) = widthConstrained
//       ? ((maxWidth / aspectRatio).round(), maxWidth)
//       : (maxHeight, (maxHeight * aspectRatio).round());
//   // resize and compression
//   final resizedImage = img.copyResize(
//     image,
//     width: newWidth,
//     height: newHeight,
//   );
//   final compressedData = img.encodeJpg(resizedImage, quality: quality);
//   final targetUri = '${file.parent.path}/${name ?? '${file.name}_min'}.jpg';
//   if (removeOriginal) await file.delete();
//   return File(targetUri).writeAsBytes(compressedData);
// }

/// Extracts encoded salt from bcrypt hash.
/// * Format: $2[a/b/x/y]$[cost]$[22-char-salt][31-char-hash]
/// * @throws FormatException if hash format is invalid
String extractBcryptSalt(String hash) {
  const saltLength = 22;
  return switch (hash.split(r'$')) {
    [_, final version, final cost, final rest]
        when hash.startsWith(r'$2') && rest.length >= saltLength =>
      '\$$version\$$cost\$${rest.substring(0, saltLength)}',
    _ => throw FormatException('Malformed bcrypt hash: $hash'),
  };
}

/// Parses a [NetworkExceptionType] into a [StatusAlertRecord].
// StatusAlert parseStatusAlert(NetworkExceptionType type) {
//   return switch (type) {
//     NetworkExceptionType.offlineClient => const StatusAlert(
//       type: StatusAlertType.warning,
//       title: 'Client Offline',
//       message: 'This operation requires internet access.',
//     ),
//     NetworkExceptionType.offlineServer => const StatusAlert(
//       type: StatusAlertType.error,
//       title: 'Server Offline',
//       message: 'This operation requires server access.',
//     ),
//     NetworkExceptionType.malformedRequest => const StatusAlert(
//       type: StatusAlertType.error,
//       title: 'Invalid Request',
//       message: 'Something went wrong with the request.',
//     ),
//     NetworkExceptionType.malformedResponse => const StatusAlert(
//       type: StatusAlertType.error,
//       title: 'Invalid Response',
//       message: 'Something went wrong with the response.',
//     ),
//     NetworkExceptionType.unknown => const StatusAlert(
//       type: StatusAlertType.error,
//       title: 'Unknown Error',
//       message: 'An unknown error occurred.',
//     ),
//   };
// }

/// * 0	Success, 1 Warning, 2 Error, 3 Info (default).
/// * 0	Success, 1 Warning, 2 Failure, 3 Info (default).
///
// String extractBcryptSalt(String hash) {
//   try {
//     // Split the hash into components
//     final dd = StringBuffer();
//     final parts = (dd = [...hash.split(r'$')]..[3]) = dd.substring(0, 22);
//     return parts.join(r'$');
//   } on Exception catch (_) {}
//   throw FormatException('Malformed bcrypt hash: $hash');
// }

//-- Public APIs
/// Generates a unique id. `[RNG version 4 | random]`
// String uuid() => const Uuid().v4();

/// Generates a secure encryption key using the fortuna random algorithm.
Uint8List generateSecureKey() {
  return _randomSecure.nextBytes(32);
}

/// Generate random number of given length (max 9).
int generateRandomNumber([int length = 5]) {
  if (length <= 0 || length > 9) return 0;
  if (length == 1) return _random.nextInt(10);
  // minimum/maximum value with the required length of digits
  final min = pow(10, length - 1).toInt();
  final max = pow(10, length).toInt() - 1;
  return min + _random.nextInt(max - min + 1);
}

///
void devLog(LogRecord record) {
  if (debugMode) {
    dev.log(
      record.message,
      time: record.time,
      sequenceNumber: record.sequenceNumber,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  }
}

/// {@template doPrint}
/// [print] with extended string, color and log Levels:
/// * 0	Success, 1 Warning, 2 Error, 3 Info (default).
/// {@endtemplate}
void doPrint(Object? object, [String prefix = '', int level = 3]) =>
    object.doPrint(prefix, level);

// Future<Response> sendRequestAsMethod(Request request) {
//   return switch (request.method) {
//     HttpMethods.delete => delete(
//       request.url,
//       headers: request.headers,
//       body: request.body,
//       encoding: request.encoding,
//     ),
//     HttpMethods.get => get(request.url, headers: request.headers),
//     HttpMethods.head => head(request.url, headers: request.headers),
//     HttpMethods.patch => patch(
//       request.url,
//       headers: request.headers,
//       body: request.body,
//       encoding: request.encoding,
//     ),
//     HttpMethods.post => post(
//       request.url,
//       headers: request.headers,
//       body: request.body,
//       encoding: request.encoding,
//     ),
//     HttpMethods.put => put(
//       request.url,
//       headers: request.headers,
//       body: request.body,
//       encoding: request.encoding,
//     ),
//     _ => throw UnsupportedError(
//       'Unsupported request method: ${request.method}',
//     ),
//   };
// }

T copyRequest<T extends BaseRequest>(T request) => request.finalized
    ? switch (request) {
        final Request r => _copyRequest(r) as T,
        final MultipartRequest r => _copyMultipartRequest(r) as T,
        final StreamedRequest r => _copyStreamedRequest(r) as T,
        _ => throw UnsupportedError(
          'Unsupported request type: ${request.runtimeType}',
        ),
      }
    : request;

//-- Private helpers
Request _copyRequest(Request request) {
  final copiedRequest = Request(request.method, request.url)
    ..encoding = request.encoding
    ..copyBaseFrom(request);
  // i. accessing bodyFields requires the following content-type.
  if (request.headers['content-type'] == 'application/x-www-form-urlencoded') {
    copiedRequest.bodyFields = request.bodyFields;
  }
  copiedRequest
    ..bodyBytes = request.bodyBytes
    ..body = request.body;
  return copiedRequest;
}

MultipartRequest _copyMultipartRequest(MultipartRequest request) {
  return MultipartRequest(request.method, request.url)
    ..copyBaseFrom(request)
    ..fields.addAll(request.fields)
    ..files.addAll(request.files);
}

StreamedRequest _copyStreamedRequest(StreamedRequest request) {
  final copiedRequest = StreamedRequest(request.method, request.url)
    ..copyBaseFrom(request);
  request.finalize().pipe(copiedRequest.sink);
  return copiedRequest;
}

extension _BaseRequestX on BaseRequest {
  BaseRequest copyBaseFrom(BaseRequest source) => this
    ..headers.addAll(source.headers)
    ..followRedirects = source.followRedirects
    ..maxRedirects = source.maxRedirects
    ..persistentConnection = source.persistentConnection;
}

// Request _copyRequest(Request request) {
//   // Step 1: Create base request with encoding
//   final copiedRequest = Request(request.method, request.url)
//     ..encoding = request.encoding
//     ..copyBaseFrom(request);

//   if (!copiedRequest.headers.containsKey('content-type')) {
//     copiedRequest.headers['content-type'] = 'application/x-www-form-urlencoded';
//   }

//   if (request.bodyBytes.isNotEmpty) {
//     copiedRequest.bodyBytes = request.bodyBytes;
//   } else if (request.body.isNotEmpty) {
//     final contentType = copiedRequest.headers['content-type'];
//     if (contentType?.contains('json') ?? false) {
//       copiedRequest.body = request.body;
//     } else {
//       copiedRequest.bodyFields = Uri.splitQueryString(request.body);
//     }
//   } else if (request.bodyFields.isNotEmpty) {
//     copiedRequest.bodyFields = request.bodyFields;
//   }

//   return copiedRequest;
// }
