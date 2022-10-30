import 'package:flutter/material.dart';
import 'package:todo/screens/finger.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController passwordController = new TextEditingController();
TextEditingController phoneController = new TextEditingController();
var formKey = GlobalKey<FormState>();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF121212),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF121212)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,)

                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),)
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [

                    Text("Username", style: TextStyle(color: Colors.white),)
                  ],
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.length < 5)
                                return "Username is short";},
                            controller: phoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration:  InputDecoration(
                                 labelStyle: TextStyle(color: Colors.white),
                                hintText: "  Enter your username",
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              hoverColor: Colors.cyanAccent

                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          children: [

                            Text("Password", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: TextFormField(
                            validator: (value){
                              if (value!.length < 5)
                                return "Password is short";},
                            controller: phoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration:  InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "  Password",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                hoverColor: Colors.cyanAccent

                            ),
                          ),
                        ),

                        SizedBox(height:300,),
                        ElevatedButton(
                          onPressed: (() {
                            formKey.currentState?.validate();
                            formKey.currentState?.validate() == true ?{ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FingerPage())),
                               }: 2==2;

                          }
                          ),
                          child: Container(
                            height: 60,
                            width: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFF8687E7).withOpacity(0.5)
                            ),
                            child: Center(
                              child: Text("Login", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25)),
                            ),
                          ),
                        ),


                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
