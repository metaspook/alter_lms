import 'package:domain/domain.dart';
import 'package:logging/logging.dart';
import 'package:utils/utils.dart';

class AppSettingsRepo {
  //-- Config
  final Persistor _persister = Persistor.instance;
  final _logger = Logger('AppSettingsRepo');
  final _errorMsgReqDataImport = '[Request|Failure] Data import.';
  final _errorMsgResDataImport = '[Response|Failure] Data import.';

  //-- Public APIs

  List<AppSetting> getSettings() {
    return _persister.read(
          AppKeys.settings,
          (setting) => (setting as List).cast<Json>().toAppSettings(),
        ) ??
        [];
  }

  bool setSetting(AppSetting setting) {
    try {
      final settings =
          (_persister.read(
                  AppKeys.settings,
                  (setting) => (setting as List).cast<Json>().toAppSettings(),
                ) ??
                [])
            ..remove(setting)
            ..add(setting);

      _persister.write(AppKeys.settings, value: settings.toJsons());
      return true;
    } catch (e) {}
    return false;
  }
}
