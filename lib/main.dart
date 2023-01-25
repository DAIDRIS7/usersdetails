import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersdetails/features/users/screens/users.dart';
import 'package:provider/provider.dart';

import 'package:usersdetails/features/users/cubits/users_cubit.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => AllUserDataCubit()..fetchAllUserData(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AllUser());
  }
}
