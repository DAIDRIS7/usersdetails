import 'package:usersdetails/features/users/model/users_model.dart';

class AllUserStates {}

class LoddingUsersData extends AllUserStates {}

class LoddedUsersData extends AllUserStates {
  final UsersData allUserData;

  LoddedUsersData(this.allUserData);
}
