import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addhabit_state.dart';

class AddhabitCubit extends Cubit<AddhabitState> {
  AddhabitCubit() : super(AddhabitState(addOrConfirmHabit: false));

  addpressed() {
    emit(AddhabitState(addOrConfirmHabit: true));
  }

  confirmpressed() {
    emit(AddhabitState(addOrConfirmHabit: false));
  }
}
