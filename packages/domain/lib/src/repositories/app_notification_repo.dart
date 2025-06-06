import 'package:domain/domain.dart';
import 'package:utils/utils.dart';

class AppNotificationRepo {
  Future<List<AppNotification>> getNotifications() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return _demoNotifications.toNotifications();
  }
}

final List<Map<String, dynamic>> _demoNotifications = [
  {'id': uuid(), 'message': 'Live Class at 2 P.M.', 'type': 'event'},
  {'id': uuid(), 'message': 'Meetup at 3 P.M. 20-Jun-2025', 'type': 'event'},
  {
    'id': uuid(),
    'message': 'Live Class at 4 P.M. 25-Jun-2025',
    'type': 'event',
  },
  {'id': uuid(), 'message': 'New Course added.', 'type': 'info'},
];
