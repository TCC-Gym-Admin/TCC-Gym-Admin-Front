import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_gym_admin_front/feature/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
