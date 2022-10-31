import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';
import 'local_database.dart';


class TaskItem extends StatelessWidget {
  TodoModel? model;
  final VoidCallback onDeleted;


  TaskItem({
    Key? key,
    required this.onDeleted,
    required this.model,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      color: Color(0xFF363636),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model?.id.toString() ?? "-1",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                model?.title.toString() ?? "No title",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                model?.description.toString() ?? "No desc",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Delete"),
                        content: Text(
                          "Are you sure to delete task ${model?.title}",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            child: Text("NO"),
                          ),
                          TextButton(
                            onPressed: () async {
                              var res = await LocalDatabase.deleteTaskById(
                                  model!.id!);

                              if (res != 0) {
                                Navigator.pop(context);
                                onDeleted();
                              }
                            },
                            child: Text("YES"),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 28,
              ))
        ],
      ),
    );
  }
}

