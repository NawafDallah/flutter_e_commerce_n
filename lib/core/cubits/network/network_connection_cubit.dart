import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_connection_state.dart';

class NetworkConnectionCubit extends Cubit<NetworkConnectionState> {
  late StreamSubscription _streamSubscription;
  NetworkConnectionCubit() : super(const InternetLoading()) {
    monitorInternetConnection();
  }

  void internetConnected() =>
      emit(const InternetConnected(message: 'Internet Connected'));

  void internetDisconnected() =>
      emit(const InternetDisconnected(message: 'noInternetConnection'));

  // subscrubtion to plugin (Connectivity plus) to check internet state
  StreamSubscription<List<ConnectivityResult>> monitorInternetConnection() {
    return _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        internetConnected();
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        internetDisconnected();
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
