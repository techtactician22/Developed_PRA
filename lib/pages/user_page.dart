import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rapp/pages/image_prolem.dart';
import 'package:rapp/pages/text_problem.dart';
import 'package:rapp/pages/user_profile.dart';

int selectedindex = 0;

class UserPage extends StatefulWidget {
  const UserPage({super.key, required username, required email});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

   List<Widget>widgets = [
  Text("Home"),
  Text("Profile"),
  Text("History"),

];
  void onItemTapped(int index){
     setState(() {
       selectedindex = index;
       if(index==0){
        Navigator.push(context,MaterialPageRoute(builder:(context)=>UserPage(username: null, email: null,) ));
       }
       else if (index==1) {
        Navigator.push(context,MaterialPageRoute(builder:(context)=>UserProfile(username: '', email: '',) ));
       }
       else{

       }
       
     });
}
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Users Section")),
        backgroundColor: Colors.yellowAccent,
      ),

      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person_3_sharp),label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.history),label: "History"),
      ],
      currentIndex: selectedindex,
      selectedItemColor: Colors.pinkAccent,
      unselectedItemColor: Colors.black,
      onTap: onItemTapped,
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
            ElevatedButton(onPressed:()async{final player=AudioPlayer();await player.play(AssetSource('WhatsApp Audio 2025-01-04 at 00.29.36_f2627e78.mp3'));Navigator.push(context,MaterialPageRoute(builder: (context)=>ImageProblem()));}, child: Text("Image Based Report")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed:()async{final player=AudioPlayer();await player.play(AssetSource('WhatsApp Audio 2025-01-04 at 00.48.12_76cd7c5f.mp3'));Navigator.push(context,MaterialPageRoute(builder: (context)=>TextProblem()));}, child: Text("Text Based Report")),
          ],
        ),
      ),
    );
  }
}


