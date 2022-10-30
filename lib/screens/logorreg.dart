import 'package:flutter/material.dart';
import 'package:todo/screens/login.dart';

class LogorReg extends StatefulWidget {
  const LogorReg({Key? key}) : super(key: key);

  @override
  State<LogorReg> createState() => _LogorRegState();
}

class _LogorRegState extends State<LogorReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,)
                ],
              ),
              SizedBox(height: 10,),
              Text("Welcome to UpTodo", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),),
              SizedBox(height: 10,),
              Text("Please login to your account or create\n            new account to continue", style: TextStyle(color: Colors.white),),
              SizedBox(height: 500,),
              InkWell(
                onTap: ((){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                }),
                child: Container(
                  height: 55,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF8875FF)
                  ),
                  child: Center(
                    child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 25),),
                  ),
                ),
              ), //login
              SizedBox(height: 10,),
              Container(
                height: 55,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF8875FF), width: 2)
                ),
                child: Center(
                  child: Text("CREATE ACCOUNT", style: TextStyle(color: Colors.white, fontSize: 24),),
                ),
              ) // register

            ],
          ),
        ),
      ),
    );
  }
}
