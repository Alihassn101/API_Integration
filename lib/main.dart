import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/Repository/ApiRepo.dart';
import 'package:task_project/UI/Screens/HomeScreen.dart';
import 'package:task_project/Utilities/Contants.dart';

import 'Bloc/Api/api_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // BlocProvider<SIgnInBloc>(
      //   create: (BuildContext context)=>SIgnInBloc(SignInRepo()),
      // ),

      BlocProvider<ApiBloc>(
        lazy: false,
          create: (BuildContext context) => ApiBloc(ApiRepo()),
        child: MaterialApp(
           debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            primaryColor: appThemeColor
          ),
          home: HomeScreen(),
        )
      );

  }
}

