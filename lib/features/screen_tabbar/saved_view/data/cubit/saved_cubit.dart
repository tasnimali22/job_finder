import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  List<String> savedJob = [];

  void saved(String saved) {
    if (savedJob.contains(saved)) {
      savedJob.remove(saved);
    } else {
      savedJob.add(saved);
    }
    emit(SavedSuccess());
  }
}
