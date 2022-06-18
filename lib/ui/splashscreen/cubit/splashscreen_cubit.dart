import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tripkuy/core/util/util.dart';
part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  
  SplashscreenCubit() : super(SplashscreenInitial());

  Future checkSessions() async {
    CoreFunction.logPrint("Check", "Sessions");
    // pushAndRemoveUntil(CounterView(), RouterType.material);
  }

}
