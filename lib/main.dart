import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_package/app.dart';
import 'package:flutter_bloc_cubit_package/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_cubit_package/theme_cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeData) => MaterialApp(
          title: 'Flutter Demo',
          theme: themeData,
          home: BlocProvider(
            create: (context) => CounterBloc(),
            child: const MyAppHome(),
          ),
        ),
      ),
    );
  }
}
