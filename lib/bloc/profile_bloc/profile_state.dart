part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class TabChangedState extends ProfileState {
  final int selectedIndex;
  const TabChangedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
