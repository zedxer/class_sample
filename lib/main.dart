import 'package:class_sample/views/screens/bottomnav_example.dart';
import 'package:class_sample/views/screens/listview_with_searching.dart';
import 'package:class_sample/views/screens/student_list_screen.dart';
import 'package:class_sample/views/screens/student_list_screen_v2.dart';
import 'package:class_sample/views/screens/student_list_screen_v3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_bloc.dart';

void main() {
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider<PostViewModel>(
  //         create: (context) => PostViewModel(),
  //       ),
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(
    BlocProvider(
      create: (_) => PostBloc(),
      child: MyApp(),
    ),
  );
  // runApp(
  //       ChangeNotifierProvider<PostViewModel>(
  //         create: (context) => PostViewModel(),
  //         child: MyApp(),
  //       ),
  // );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/a': (context) => const BottomNavigationBarExample(),
      '/b': (context) => const ListViewWithSearchExample(
        title: 'Some Title',
      ),
      '/c': (context) =>  StudentListScreenV3(),
    },
      initialRoute: '/a',
    );
  }
}
