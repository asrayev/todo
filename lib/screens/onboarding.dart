import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/logorreg.dart';
import 'package:todo/utils/myimages.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}
List lsimages = [MyImages.onb1, MyImages.onb2, MyImages.onb3 ];
List text1 = ["Manage your tasks", "Create daily routine", "Orgonaize your tasks"];
List text2 = ["You can easily manage all of your daily\n                tasks in DoMe for free", "         In Uptodo  you can create your\npersonalized routine to stay productive", "       You can organize your daily tasks by\nadding your tasks into separate categories"];
int _currentPage = 0;
PageController _controller = PageController();
class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
       body: Column(
         children: [
           Container(
               height: 843,
             color: Color(0xFF121212),

             child: PageView.builder(
                  controller: _controller,
                 physics: BouncingScrollPhysics(),
                 itemCount: 3,
                 itemBuilder: (context, int index){
                   return SafeArea(
                     child: Container(
                       child: Padding(
                         padding: const EdgeInsets.all(15),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 InkWell(
                                     onTap: ((){
                                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogorReg()));
                                     }),
                                     child: Text("SKIP", style: TextStyle(color: Colors.grey, fontSize: 18),)),
                               ],
                             ),
                             SizedBox(height: 20,),
                             Image.asset(lsimages[index], width: 250, height: 300,),
                             SizedBox(height: 50,),
                             SizedBox(height: 20,),
                             Text(text1[index], style: GoogleFonts.lato().copyWith(color: Colors.white,fontSize: 32, fontWeight: FontWeight.w700)),
                             SizedBox(height: 15,),
                             Align(
                                 alignment: Alignment.center,
                                 child: Text(text2[index], style: GoogleFonts.lato().copyWith(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400))),
                             SizedBox(height: 100,),
                             SizedBox(width: 300,),
                             Row(
                               children: [
                                 SizedBox(width: 100,),
                                 Container(width: 60,
                                   height: 8,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: index == 0 ? Colors.white : Colors.white12
                                   ),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(width: 60,
                                   height: 8,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: index == 1 ? Colors.white : Colors.white12
                                   ),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(width: 60,
                                   height: 8,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: index == 2 ? Colors.white : Colors.white12
                                   ),
                                 ),
                                 SizedBox(width: 10,),

                               ],
                             ),
                             SizedBox(height: 100,),
                             Align(
                               alignment: FractionalOffset.centerRight,
                               child: InkWell(
                                 onTap: ((){
                                   if (index == 2){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogorReg()));
                                   }
                                   else
                                     _controller.nextPage(duration: Duration(milliseconds: 800), curve: Curves.ease);
                                 }),
                                 child: index == 2 ? Container(
                                   height: 45,
                                   width: 120,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Color(0xFF8875FF)
                                   ),
                                   child: Center(
                                     child: Text(

                                       "GET STARTED",
                                       style: GoogleFonts.lato().copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16 ),
                                     ),
                                   ),
                                 ) : Container(
                                   height: 45,
                                   width: 80,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Color(0xFF8875FF)
                                   ),
                                   child: Center(
                                     child: Text(

                                       "NEXT",
                                       style: GoogleFonts.lato().copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18 ),
                                     ),
                                   ),
                                 ),
                               ),
                             )


                           ],
                         ),
                       ),
                     ),
                   );
                 }
                 ),
           ),

         ],
       ),
    );
  }
}
// Row(
// children: [
// SizedBox(width: 100,),
// Container(width: 60,
// height: 8,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: index == 0 ? Colors.white : Colors.white12
// ),
// ),
// SizedBox(width: 10,),
// Container(width: 60,
// height: 8,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: index == 1 ? Colors.white : Colors.white12
// ),
// ),
// SizedBox(width: 10,),
// Container(width: 60,
// height: 8,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: index == 2 ? Colors.white : Colors.white12
// ),
// ),
// SizedBox(width: 10,),
//
// ],
// ),
//
