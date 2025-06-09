/// Alter LMS Utilities.
library;

export 'src/constants/constants.dart';
export 'src/exceptions/native_exceptions.dart'
    if (dart.library.html) 'src/exceptions/web_exceptions.dart';
export 'src/exceptions/network_exception.dart';
export 'src/extensions/extensions.dart';
export 'src/functions.dart';
export 'src/persistor.dart';
export 'src/typedefs.dart' // non-flutter
    if (dart.library.ui) 'src/none.dart'; // flutter
export 'src/utils.dart';
