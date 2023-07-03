import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/model/taskmodel.dart';
import 'package:habit_tracker/widgets/my_list_tile.dart';
import 'package:habit_tracker/widgets/new_task_add.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class habit_tracker extends StatefulWidget {
  const habit_tracker({super.key});

  @override
  State<habit_tracker> createState() => _habit_trackerState();
}

class _habit_trackerState extends State<habit_tracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "My Habit App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box("task").listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Todays task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  formatDate(DateTime.now(), [d, " ,", M, " ", yyyy]),
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),
                Divider(
                  thickness: 1,
                  height: 40,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: box.values.length,
                        itemBuilder: (context, index) {
                          task ask = box.getAt(index)!;
                          return Myliosttile(
                            ask,
                            index,
                          );
                        }))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => New_task_add()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
