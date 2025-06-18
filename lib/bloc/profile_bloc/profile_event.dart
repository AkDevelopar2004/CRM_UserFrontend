part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ChangeTabEvent extends ProfileEvent {
  final int index;
  const ChangeTabEvent(this.index);

  @override
  List<Object> get props => [index];
}
