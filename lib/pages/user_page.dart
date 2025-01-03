import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rapp/pages/image_prolem.dart';
import 'package:rapp/pages/text_problem.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Users Section")),
        backgroundColor: const Color.fromARGB(255, 68, 215, 255),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            AnimatedTextKit(animatedTexts: [TyperAnimatedText(" 📝 ",textStyle: TextStyle(fontSize: 30,color: Colors.black,),speed: Duration(microseconds: 100)),]),
            AnimatedTextKit(animatedTexts: [TypewriterAnimatedText("  ʀᴇᴘᴏʀᴛ ʏᴏᴜʀ  ",textStyle: TextStyle(fontSize: 30,color: Colors.pinkAccent,),speed: Duration(milliseconds: 100)),],),
            AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(" ᴘʀᴏʙʟᴇᴍ ʙᴇʟᴏᴡ ",textStyle: TextStyle(fontSize: 30,color: Colors.blue),speed: Duration(milliseconds: 100)),]),
            SizedBox(height: 20,),
            SizedBox(height: 150,child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1GsUPQbPCAUJaeEeJvSSjtAOoWxT8W3L7eg&s")),
            SizedBox(height: 50,),
            ElevatedButton(onPressed:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>ImageProblem()));}, child: Text("Image Based Report")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>TextProblem()));}, child: Text("Text Based Report")),
          ],
        ),
      ),
    );
  }
}
