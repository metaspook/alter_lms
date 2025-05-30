part of 'sign_up_cubit.dart';

enum SignUpStatus {
  initial,
  loading,
  failure,
  success;

  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
  bool get isLoading => this == loading;
}

class SignUpState extends Equatable {
  const SignUpState({this.status = SignUpStatus.initial});
  final SignUpStatus status;
  // final

  SignUpState copyWith({
    SignUpStatus? status,
  }) {
    return SignUpState(
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status];
}
