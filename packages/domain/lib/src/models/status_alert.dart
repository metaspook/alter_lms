import 'package:equatable/equatable.dart';

final class StatusAlert extends Equatable {
  const StatusAlert({required this.type, required this.message, this.title});
  final StatusAlertType type;
  final String? title;
  final String message;

  static const empty = StatusAlert(type: StatusAlertType.info, message: '');
  bool get isEmpty => this == StatusAlert.empty;
  bool get isNotEmpty => this != StatusAlert.empty;

  @override
  List<Object?> get props => [type, title, message];
}

/// Status alert types.
/// * success | warning | error | info
// ignore: public_member_api_docs
enum StatusAlertType { success, warning, error, info }
