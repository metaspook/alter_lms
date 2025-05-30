part of 'sign_in_cubit.dart';

enum SignInStatus {
  initial,
  loading,
  failure,
  success;

  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
  bool get isLoading => this == loading;
}

class SignInState extends Equatable {
  const SignInState({this.status = SignInStatus.initial});
  final SignInStatus status;
  // final

  SignInState copyWith({
    SignInStatus? status,
  }) {
    return SignInState(
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status];
}
