part of 'network_cubit.dart';

abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class NetworkSuccess extends NetworkState {}

class NetworkFailure extends NetworkState {}