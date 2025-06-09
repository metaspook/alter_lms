import 'dart:convert';
import 'dart:io';

// import 'package:backend_client/backend_client.dart';
// import 'package:database_client/database_client.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart'
    show LicenseEntryWithLineBreaks, LicenseRegistry, kIsWeb;
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
// import 'package:mobile_app/app/app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:powersync_helper/powersync_helper.dart';
import 'package:uikit/uikit.dart';
// import 'package:utils/typedefs.dart';
import 'package:utils/utils.dart';

enum ServerMode { local, remote, buildWise }

/// Update these values
abstract final class AppConfig {
  static late final DirectoryRecord _directoryRecord;
  static DirectoryRecord get directoryRecord =>
      _resolve<DirectoryRecord>(_directoryRecord);
  // static late final String _cipherKey;
  // static String get cipherKey => _resolve<String>(_cipherKey);
  // static late final String _installationId;
  // static String get installationId => _resolve<String>(_installationId);

  static const appName = 'Pai2Pai';
  static const appHost = 'server.pai2pai.com';

  static String attachmentsDirectory({bool absolute = false}) {
    final separator = Platform.pathSeparator;
    return '${absolute ? directoryRecord.documents + separator : ''}'
        '$appName${separator}attachments';
  }

  static const _licensePaths = [
    '../../packages/uikit/assets/fonts/OFL.txt',
    '../../packages/uikit/assets/fonts/inconsolata/OFL.txt',
  ];
  static late final bool _useLocalServer;
  static late final bool _isFlexibleUpdate;
  static bool get isFlexibleUpdate => _isFlexibleUpdate;
  static bool get isLocalServer => _useLocalServer;

  static Future<String> init({
    ServerMode serverMode = ServerMode.buildWise,
    // UpdateType updateType = UpdateType.flexible,
    AsyncValueGetter<String>? refreshedTokenGetter,
  }) async {
    // General config
    _useLocalServer = switch (serverMode) {
      ServerMode.local => true,
      ServerMode.remote => false,
      ServerMode.buildWise => debugMode,
    };
    // UpdateType config
    // _isFlexibleUpdate = updateType.isFlexible;
    //- Non-future initialization config
    EquatableConfig.stringify = true;
    Logger.root
      ..level = Level.ALL
      ..onRecord.listen(devLog);
    //- Pre-required initializations
    _directoryRecord = await _fetchDirectoryRecord();
    final (cipherKey, installationId) = await _fetchSecuredData();
    final hydratedBlocStorage = await _fetchHydratedBlocStorage(cipherKey);
    //-- Initialize Persister
    Persistor.initialize(
      writer: hydratedBlocStorage.write,
      reader: hydratedBlocStorage.read,
      eraser: hydratedBlocStorage.delete,
    );
    // AppInterceptors.initialize(refreshedTokenGetter: refreshedTokenGetter);
    // const webApiService = WebApiService();
    await Future.wait([
      // TODO(metaspook): need to check if really loads licence
      _loadLicenses(),
      // _loadPowerSync(cipherKey, webApiService: webApiService),
    ]);
    return installationId;
  }

  //-- Private helpers
  // static Future<void> _loadPowerSync(
  //   String? cipherKey, {
  //   required WebApiService webApiService,
  // }) async {
  //   //-- Initialize PowerSync database
  //   await PowerSyncHelper.dbInit(
  //     schema,
  //     sqlCipherKey: cipherKey..doPrint('cipherKey: '),
  //   );

  //   final remoteStorageAdapter = RemoteStorageAdapter(
  //     onDelete: webApiService.requestDelete,
  //     onUpload: webApiService.requestUpload,
  //     onDownload: (filename) async {
  //       final response = await webApiService.requestDownload(filename);
  //       return response.stream.toBytes();
  //     },
  //   );
  //   //-- Initialize Drift database
  //   AppDatabase.initialize(PowerSyncHelper.db);
  //   //-- Initialize PowerSync Attachment queue
  //   await AttachmentQueue.initialize(
  //     PowerSyncHelper.db,
  //     tableNames: [
  //       SchemaKeys.userTable,
  //       SchemaKeys.businessTable,
  //       SchemaKeys.productsTable,
  //     ],
  //     remoteStorage: remoteStorageAdapter,
  //     attachmentDirectoryName: attachmentsDirectory(),
  //   );
  // }

  /// i. google fonts licensing etc.
  static Future<void> _loadLicenses() async => _licensePaths.map(
    (licensePath) => rootBundle.loadString(licensePath).then((license) {
      LicenseRegistry.addLicense(() async* {
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      });
    }),
  );

  //-- HydratedBloc config
  // i. using hex/base64Url instead of bytes to prevent invalid characters.
  static Future<Storage> _fetchHydratedBlocStorage(
    String? cipherKey,
  ) async => HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            // typically getTemporaryDirectory but provided directory could be removed by OS.
            directoryRecord.applicationSupport,
          ),
    encryptionCipher: cipherKey == null
        ? null
        : HydratedAesCipher(base64Url.decode(cipherKey)),
  );

  static Future<(String?, String)> _fetchSecuredData() async {
    //-- SecureStorage and encryptionKey config
    const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
    //-- Get cipherKey and installationId
    return (
      await secureStorage.readOrWrite(
        key: AppKeys.cipherKey,
        value: base64Url.encode(generateSecureKey()),
      ),
      await secureStorage.readOrWrite(
            key: AppKeys.installationId,
            value: uuid(),
          ) ??
          '',
    );
  }

  static Future<DirectoryRecord> _fetchDirectoryRecord() async => (
    documents:
        (kIsWeb
                ? Directory('')
                : await path_provider.getApplicationDocumentsDirectory())
            .path,
    applicationSupport:
        (await path_provider.getApplicationSupportDirectory()).path,
  );

  /// Get instance of the persister, instance must be initialized by
  /// calling [initialize] once.
  static T _resolve<T>(T obj) {
    try {
      return obj;
    } on Exception catch (_) {
      throw UnimplementedError('AppConfig has not been initialized!');
    }
  }
}
