import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupInitial());
}
 