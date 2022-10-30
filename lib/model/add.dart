import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/myicons.dart';

Future<Container> buildContainer(BuildContext context) async {
  return Container(
    padding:  EdgeInsets.all(24),
    width: 375,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      color: Color(0xFF363636),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Task" , style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(8)


          ),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white)

            ),

          ),
        ),
        SizedBox(height: 20,),
        InkWell(



            child: Text("Description", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 17, fontWeight: FontWeight.w500),)),
        SizedBox(height: 50,),
        Row(
          children: [
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
              }),
            ),
            SizedBox(width: 10,),
            SvgPicture.asset(Myicons.secondi),
            SizedBox(width: 10,),
            SvgPicture.asset(Myicons.flag),
            SizedBox(width: 250,),
            SvgPicture.asset(Myicons.send),


          ],
        )
      ],
    ),
  );
}

