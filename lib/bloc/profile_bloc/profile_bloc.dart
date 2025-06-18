import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const TabChangedState(0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(TabChangedState(event.index));
    });
  }
}
