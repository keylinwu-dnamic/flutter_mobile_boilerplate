import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:boilerplate/constants/constants.dart';
import 'package:connectivity/connectivity.dart';

enum ConnectivityStatus { cellular, wifi, offline }

abstract class IConnectivityService {
  Stream<ConnectivityStatus?> get connectionStatusStream;
  ConnectivityStatus? get status;
  bool get isOffline;
  bool get hasConnectivity;
  Future<void> getConnectionStatus();
  Future<bool> checkInternetConnection();
}

class ConnectivityService implements IConnectivityService {
  final StreamController<ConnectivityStatus?> _connectionStatusController =
      StreamController<ConnectivityStatus?>.broadcast();

  @override
  Stream<ConnectivityStatus?> get connectionStatusStream =>
      _connectionStatusController.stream.distinct();

  @override
  ConnectivityStatus? get status => _status;
  ConnectivityStatus? _status;

  @override
  bool get isOffline =>
      _status == null || _status == ConnectivityStatus.offline;

  @override
  bool get hasConnectivity => !isOffline;

  ConnectivityService() {
    getConnectionStatus();
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        _status = await _getStatusFromResult(result);
        _connectionStatusController.add(_status);
      },
    );
  }

  @override
  Future<void> getConnectionStatus() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    _status = await _getStatusFromResult(result);
    _connectionStatusController.add(_status);
  }

  Future<ConnectivityStatus> _getStatusFromResult(
      ConnectivityResult result) async {
    try {
      final hasInternet = await checkInternetConnection();
      switch (result) {
        case ConnectivityResult.mobile:
          return hasInternet
              ? ConnectivityStatus.cellular
              : ConnectivityStatus.offline;
        case ConnectivityResult.wifi:
          return hasInternet
              ? ConnectivityStatus.wifi
              : ConnectivityStatus.offline;
        case ConnectivityResult.none:
          return ConnectivityStatus.offline;
        default:
          return ConnectivityStatus.offline;
      }
    } catch (e) {
      log('ConnectivityStatus Error: $e');
      return ConnectivityStatus.offline;
    }
  }

  @override
  Future<bool> checkInternetConnection() async {
    bool hasConnection = false;
    try {
      final result = await InternetAddress.lookup(Constants
              .connectivityPingUrl) //TODO: change this to a centralized constant
          .timeout(const Duration(milliseconds: 3000));
      hasConnection = (result.isNotEmpty && result[0].rawAddress.isNotEmpty);
    } on SocketException catch (_) {
      hasConnection = false;
    }
    return hasConnection;
  }
}