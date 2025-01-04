import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rapp/pages/admin_page.dart';
import 'package:rapp/pages/user_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required String username, required String email});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(

      drawer: Drawer(
        child: Container(
          child: ListView(
            
            children: [
              DrawerHeader(padding: EdgeInsets.zero,child: Container(
                
                height: 20,
                width: 20,
                color: Colors.purpleAccent,
                padding: EdgeInsets.zero,
                child:Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                  children: [
                    CircleAvatar(radius: 70,backgroundImage: AssetImage("assets/logo.jpeg")),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("Prashant",style: TextStyle(color: Colors.white),),
                      ],
                    )
                    
                    
                    
                  ],
                  ),
                ) ,
              )),

              SizedBox(
                height: 20,
              ),

              ListTile(leading: Icon(Icons.group),title:Text( "Users"),onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>UserPage(username: null, email: null,) ));
              
              },),
              ListTile(leading: Icon(Icons.person),title:Text("Admin"),onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>AdminPage() ));
              },)
            ],
          ),
        ),
      ) ,
      appBar: AppBar(
        title: Center(child: AnimatedTextKit(animatedTexts: [WavyAnimatedText("ResolveIt",textStyle: TextStyle(fontSize: 30),)])),
        backgroundColor: Colors.purpleAccent,
    ),
    body: Center(
      child: Container(
        height: 500,
        width: 400,
        decoration: BoxDecoration(
          boxShadow:[BoxShadow(color: Colors.black, blurRadius: 8.0, // Amount of blur
        spreadRadius: 5.0,)] ,
          image: DecorationImage(image: NetworkImage("https://png.pngtree.com/png-vector/20200312/ourmid/pngtree-modern-flat-design-concept-of-we-have-solutions-with-characters-fitting-png-image_2157886.jpg",),fit: BoxFit.cover,)
          
        ),
        
      ),
    ),

    
    );
  }
}
