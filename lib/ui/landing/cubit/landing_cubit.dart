import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());
}
