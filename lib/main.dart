import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_credicxo/app_theme.dart';
import 'package:music_app_credicxo/repository/track_list_repository.dart';
import 'package:music_app_credicxo/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TrackListRepository(),
      child: MaterialApp(
        title: 'Music App',
        theme: ThemeData(
          scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
