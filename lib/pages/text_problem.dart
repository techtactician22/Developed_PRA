import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextProblem extends StatelessWidget {
  const TextProblem({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Text Based Reporting")),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            AnimatedTextKit(animatedTexts: [TyperAnimatedText(" 📝 ",textStyle: TextStyle(fontSize: 30,color: Colors.black,),speed: Duration(microseconds: 100)),]),
            AnimatedTextKit(animatedTexts: [TypewriterAnimatedText("  ʀᴇᴘᴏʀᴛ ʏᴏᴜʀ  ",textStyle: TextStyle(fontSize: 30,color: Colors.pinkAccent,), speed: Duration(milliseconds: 100)),],),
            AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(" ᴘʀᴏʙʟᴇᴍ ʙᴇʟᴏᴡ ",textStyle: TextStyle(fontSize: 30,color: Colors.blue),speed: Duration(milliseconds: 100)),]),
            SizedBox(height: 30,),
            
            TextField(
                           
              maxLines: 11,
              decoration: InputDecoration(                
                hintText: 'Enter Your Description here....',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(                  
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 37, 239, 246),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                minimumSize: Size(120, 50),
              ),
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
