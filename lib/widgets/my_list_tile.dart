import 'package:flutter/material.dart';
import 'package:habit_tracker/model/taskmodel.dart';
import 'package:habit_tracker/widgets/new_task_add.dart';

class Myliosttile extends StatefulWidget {
  Myliosttile(this.ask, this.index, {super.key});
  task ask;
  int index;

  @override
  State<Myliosttile> createState() => _MyliosttileState();
}

class _MyliosttileState extends State<Myliosttile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.ask.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => New_task_add(
                                  ask: widget.ask,
                                ))));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    widget.ask.delete();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 1,
          ),
          Text(
            widget.ask.note!,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
