import 'package:flutter/material.dart';

import '../model/local_database.dart';
import '../model/task_item.dart';
import '../model/todo_model.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
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
























// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:todo/utils/myimages.dart';
//
// class Index extends StatefulWidget {
//   const Index({Key? key}) : super(key: key);
//
//   @override
//   State<Index> createState() => _IndexState();
// }
//
// class _IndexState extends State<Index> {
//   @override
//   Widget build(BuildContext context) {
//
//

    //     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 30,),
//             Center(child: Image.asset(MyImages.index, height: 250,width: 250,)),
//             SizedBox(height: 30,),
//             Text("What do you want to do today?", style: GoogleFonts.lato().copyWith(color: Colors.white.withOpacity(0.9), fontSize: 25),),
//             SizedBox(height: 20,),
//             Text("Tap + to add your tasks", style: GoogleFonts.lato().copyWith(color: Colors.white.withOpacity(0.9), fontSize: 17),),
//           ],
//         ),
//       ),
//     );
//   }
// }
