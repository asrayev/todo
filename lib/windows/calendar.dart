import 'package:flutter/material.dart';
import '../model/local_database.dart';
import '../model/todo_model.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(snapshot.data?[index].id.toString() ?? "-1"),
                      Text(
                          snapshot.data?[index].title.toString() ?? "No title"),
                      Text(snapshot.data?[index].description.toString() ??
                          "No desc"),
                    ],
                  );
                });
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
