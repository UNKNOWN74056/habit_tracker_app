import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/habit_tracker.dart';
import 'package:habit_tracker/model/taskmodel.dart';
import 'package:hive/hive.dart';

class New_task_add extends StatefulWidget {
  New_task_add({this.ask, super.key});

  task? ask;

  @override
  State<New_task_add> createState() => _New_task_addState();
}

class _New_task_addState extends State<New_task_add> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tasktitle = TextEditingController(
        text: widget.ask == null ? null : widget.ask?.title!);
    TextEditingController note = TextEditingController(
        text: widget.ask == null ? null : widget.ask?.note!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.ask == null ? "Add new task" : "update your task",
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Your new task",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: tasktitle,
              decoration: InputDecoration(
                  fillColor: Colors.blue.shade100.withAlpha(75),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Your task"),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 25,
              controller: note,
              decoration: InputDecoration(
                  fillColor: Colors.blue.shade100.withAlpha(75),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  hintText: " Write some note"),
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: RawMaterialButton(
                        onPressed: () async {
                          var newtask = task(
                            title: tasktitle.text,
                            note: note.text,
                            creation_time: DateTime.now(),
                            done: false,
                          );
                          Box taskbox = Hive.box("task");
                          if (widget.ask != null) {
                            widget.ask!.title = newtask.title;
                            widget.ask!.note = newtask.note;
                            widget.ask!.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => habit_tracker())));
                          } else {
                            await taskbox.add(newtask);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => habit_tracker())));
                          }
                        },
                        fillColor: Colors.blueAccent.shade700,
                        child: Text(
                          widget.ask == null
                              ? "Add new task"
                              : "update your task",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
