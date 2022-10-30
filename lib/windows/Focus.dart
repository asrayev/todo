import 'package:flutter/material.dart';

import '../model/local_database.dart';
import '../model/task_item.dart';
import '../model/todo_model.dart';

class Focus extends StatefulWidget {
  const Focus({Key? key}) : super(key: key);

  @override
  State<Focus> createState() => _FocusState();
}

class _FocusState extends State<Focus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                  child: Icon(
                    Icons.file_copy_outlined,
                    color: Colors.white,
                    size: 96,
                  ));
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return TaskItem(
                  model: snapshot.data?[index],
                  onDeleted: () {
                    setState(() {});
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

