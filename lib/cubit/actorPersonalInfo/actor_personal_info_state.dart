part of 'actor_personal_info_cubit.dart';

@immutable
abstract class ActorPersonalInfoState {}

class ActorPersonalInfoInitial extends ActorPersonalInfoState {}

class ActorPersonalInfoLoading extends ActorPersonalInfoState {}

class ActorPersonalInfoLoaded extends ActorPersonalInfoState {
  ActorPersonalInfo? actorInfo;
  ActorPersonalInfoLoaded(this.actorInfo);
}

class ActorPersonalInfoFailure extends ActorPersonalInfoState {}
