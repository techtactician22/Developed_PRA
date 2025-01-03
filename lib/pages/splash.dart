
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rapp/pages/drawer.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  // Initialization code
   }

   _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DrawerWidget()));
   }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height:250 ,
          width:250 ,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/logo.jpeg"),fit: BoxFit.cover, ),
            boxShadow: [BoxShadow(spreadRadius: 20,color: Colors.purpleAccent,blurRadius: 20)]
          ),
        ),
      ),
    );
  }
}



