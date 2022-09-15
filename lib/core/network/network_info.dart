import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker deviceStatus;
  NetworkInfoImp(this.deviceStatus);
  @override
  Future<bool> get isConnected => deviceStatus.hasConnection;
}
