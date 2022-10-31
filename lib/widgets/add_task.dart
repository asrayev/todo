import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/local_database.dart';
import '../model/todo_model.dart';
import '../utils/myicons.dart';

class AddTaskWidget extends StatefulWidget {
  VoidCallback onNewTask;

  AddTaskWidget({Key? key, required this.onNewTask}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  String Data = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (val) {
                newTitle = val ?? "";
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(

                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              onSaved: (val) {
                newDescription = val ?? "";
              },
              textInputAction: TextInputAction.done,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                SizedBox(width: 10,),
                InkWell(
                  child: SvgPicture.asset(Myicons.clock),
                  onTap: (() async {
                    var results = await showCalendarDatePicker2Dialog(

                      context: context,
                      config: CalendarDatePicker2WithActionButtonsConfig(),
                      dialogSize: const Size(325, 400),
                      initialValue: [],
                      borderRadius: BorderRadius.circular(15),
                    );
                    Data = results.toString();
                  }),
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(Myicons.secondi),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(Myicons.flag),
                SizedBox(
                  width: 250,
                ),
                InkWell(
                    onTap: ((){
                      formKey.currentState?.save();
                      var newTodo = TodoModel(
                        title: newTitle,
                        description: newDescription,
                        date: Data,
                        priority: "priority",
                        isCompleted: 0,
                      );
                      LocalDatabase.insertToDatabase(newTodo);

                      widget.onNewTask();

                      Navigator.pop(context);

                    }),


                    child: SvgPicture.asset(Myicons.send)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
