/// Alter LMS Utilities.
library;

export 'src/constants/others.dart';
export 'src/exceptions/native_exceptions.dart'
    if (dart.library.html) 'src/exceptions/web_exceptions.dart';
export 'src/exceptions/network_exception.dart';
export 'src/extensions/iterable.dart';
export 'src/extensions/others.dart';
export 'src/functions.dart';
export 'src/typedefs.dart' // non-flutter
    if (dart.library.ui) 'src/none.dart'; // flutter
export 'src/utils.dart';
