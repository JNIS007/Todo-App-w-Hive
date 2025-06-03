import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/pages/homepage.dart';

void main() async {

  //init hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[300])
      ),
      home: const Homepage(),
    );
  }
}

