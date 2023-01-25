import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersdetails/features/users/cubits/users_state.dart';
import 'package:usersdetails/features/users/model/users_model.dart';
import 'package:usersdetails/features/users/repository/users_repository.dart';

class AllUserDataCubit extends Cubit<AllUserStates> {
  AllUserDataCubit() : super(LoddingUsersData());
  fetchAllUserData() async {
    final listOfAllUserData = await AllUserRepository().fetchAllUserData();
    emit(LoddedUsersData(listOfAllUserData));
  }
}
