part of 'actor_info_cubit.dart';

abstract class ActorInfoState {}

class ActorInfoInitial extends ActorInfoState {}
class ActorInfoLoading extends ActorInfoState {}
class ActorInfoLoaded extends ActorInfoState {
    List data;
  ActorInfoLoaded(this.data);
}
class ActorInfoFailure extends ActorInfoState {}
