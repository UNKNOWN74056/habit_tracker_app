import 'package:flutter/material.dart';
import 'package:habit_tracker/habit_tracker.dart';
import 'package:habit_tracker/model/taskmodel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  //lets create our hive model class
  Hive.registerAdapter(taskAdapter());
  box = await Hive.openBox("task");
  box.add(task(
      title: 'this is my first task',
      note: 'hy there how are your',
      creation_time: DateTime.now()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const habit_tracker());
  }
}
