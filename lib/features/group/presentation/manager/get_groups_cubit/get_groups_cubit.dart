import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planova_app/features/group/domain/entities/group_entity.dart';
import 'package:planova_app/features/group/domain/usecases/stream_my_groups_usecase.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  GetGroupsCubit(this.streamMyGroupsUseCase) : super(GetGroupsInitial());

  final StreamMyGroupsUseCase streamMyGroupsUseCase;
  StreamSubscription? _groupsSubscription;

  void startStreamingGroups() {
    if (isClosed) return;
    
    emit(GetGroupsLoading());


    _groupsSubscription?.cancel();

    _groupsSubscription = streamMyGroupsUseCase.call().listen(
      (returnedData) {
        if (isClosed) return;
        
        returnedData.fold(
          (failure) => emit(GetGroupsFailure(errMessage: failure.message)),
          (data) => emit(GetGroupsSuccess(groups: data)),
        );
      },
      onError: (error) {
        if (isClosed) return;
        emit(GetGroupsFailure(errMessage: error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _groupsSubscription?.cancel(); 
    return super.close();
  }
}