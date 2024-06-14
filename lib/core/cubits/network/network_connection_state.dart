part of 'network_connection_cubit.dart';

sealed class NetworkConnectionState extends Equatable {
  final String? message;
  const NetworkConnectionState({this.message});

  @override
  List<Object> get props => [message!];
}

final class InternetLoading extends NetworkConnectionState {
  const InternetLoading();
}

final class InternetConnected extends NetworkConnectionState {
  const InternetConnected({required String message}) : super(message: message);
}

final class InternetDisconnected extends NetworkConnectionState {
  const InternetDisconnected({required String message})
      : super(message: message);
}
