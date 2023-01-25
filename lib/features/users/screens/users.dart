import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersdetails/features/users/cubits/users_cubit.dart';
import 'package:usersdetails/features/users/cubits/users_state.dart';
import 'package:usersdetails/features/users/model/users_model.dart';
import 'package:usersdetails/features/users/screens/user_details.dart';

class AllUser extends StatefulWidget {
  @override
  State<AllUser> createState() => _AllUserState();
}

class _AllUserState extends State<AllUser> {
  initState() {
    super.initState();
    context.read<AllUserDataCubit>().fetchAllUserData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: BlocBuilder<AllUserDataCubit, AllUserStates>(
        builder: ((context, state) {
          if (state is LoddedUsersData) {
            final UsersData myData = state.allUserData;

            return _buildWidget(
              name: myData.name,
              avatar: myData.avatar,
            );
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}

_buildWidget({
  name,
  avatar,
}) {
  return GridView.builder(
    shrinkWrap: true,
    //scrollDirection: Axis.horizontal,
    itemCount: 8,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllUserDetails(),
            ),
          );
        },
        child: Container(
          height: 238,
          width: 141,
          margin: const EdgeInsets.only(
            left: 16,
          ),
          padding: const EdgeInsets.all(
            16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(
                0xffEBF0FF,
              ),
            ),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 109,
                width: 109,
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      ' $avatar',
                    ),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$name',
              ),
            ],
          ),
        ),
      );
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 0.63,
    ),
  );
}
