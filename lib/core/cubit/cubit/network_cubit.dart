import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription? _subscription;

  NetworkCubit() : super(NetworkInitial());

  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        connected();
      } else {
        notConnected();
      }
    });
  }

  void connected() {
    emit(NetworkSuccess());
  }

  void notConnected() {
    emit(NetworkFailure());
  }
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
