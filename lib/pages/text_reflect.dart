import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rapp/pages/database.dart';

class TextReflect extends StatefulWidget {
  const TextReflect({super.key});

  @override
  State<TextReflect> createState() => _TextReflectState();
}

class _TextReflectState extends State<TextReflect> {

  Stream? UserStream;

  getonload()async{
    UserStream = await DatabaseMethods().getTextReports();
    setState(() {
      
    });
  }

  @override
  void initState(){
    getonload();
    super.initState();
  }

  Widget allTextReports(){
    return StreamBuilder(stream: UserStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index){
DocumentSnapshot ds = snapshot.data.docs[index];
return Container(
  margin: EdgeInsets.all(10),
  child: Material(
                elevation: 10.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                
                padding: EdgeInsets.all(20),
                width:MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                //border: Border.all(color: Colors.deepPurple),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
                ),  
                           
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username : "+ds["Username"],style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    Text("Email : "+ds["Email"],style: TextStyle(color: Colors.pinkAccent,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    //Text("Date : "+ds["Date"],style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    //Text("Time : "+ds["Time"],style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    Text("Title : "+ds["Title"],style: TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    Text("Description : "+ds["Description"],style: TextStyle(color: const Color.fromARGB(255, 5, 3, 5),fontSize: 20.0,fontWeight: FontWeight.bold),),
                    
                  ],
                  
                ),              
              ),
              ),
);
            
            
          


        }):Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Reporting",style: TextStyle(color: Colors.blue),),
            Text("History",style: TextStyle(color: Colors.orange),),
            
          ],
        )
        
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
        child: Column(
          children: [
            Expanded(child: allTextReports()),
          ],
        ),
      ),

    );
  }
}


