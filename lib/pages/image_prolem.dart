import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'database.dart';

class ImageProblem extends StatefulWidget {
  const ImageProblem({super.key});

  @override
  State<ImageProblem> createState() => _ImageProblemState();
}

class _ImageProblemState extends State<ImageProblem> {
  TextEditingController urlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
   bool _showTextField = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Image based Prolem")),
        backgroundColor: Colors.greenAccent,
      ),

      body: Container(
        
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  " 📝 ",
                  textStyle: TextStyle(fontSize: 30, color: Colors.black),
                  speed: Duration(microseconds: 100),
                ),
              ],
            ),
              AnimatedTextKit(animatedTexts: [TypewriterAnimatedText("Report Your Problem Below",speed: Duration(milliseconds: 100),textStyle: TextStyle(fontSize: 20))]),
              SizedBox(height: 30,),
              !_showTextField
              ?InkWell(
                onTap: (){
                  setState(() {
                     _showTextField = !_showTextField;
                  });
                },
                child: CircleAvatar(
                radius: 80,
                backgroundColor: const Color.fromARGB(255, 137, 245, 253),
                child: Icon(Icons.camera_alt_rounded), 
                
               
              ),
              ):
              TextFormField(
                controller: urlController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your Image Url......"
                ),
              ),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: 9,
                  
                  
                  decoration: InputDecoration(
                    hintText: 'Enter Your Description here........',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                    
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()async{

                DateTime now = DateTime.now();
                String formattedDate = DateFormat('yyyy-MM-dd').format(now); // Get only the date
                String formattedTime = DateFormat('HH:mm:ss').format(now); // Get only the time

                // Generate a random Id for the report
                String id = randomAlphaNumeric(10);

                // Create the report map with separate date and time fields
                Map<String, dynamic> imageReportMap = {
                  "Url": urlController.text,
                  "Description": descriptionController.text,
                  "Id": id,
                  "date": formattedDate, // Date field
                  "time": formattedTime,
                  "Status":"Pending", // Time field
                };

                // Add the report to Firestore
                await NDatabaseMethods().addImageReprts(imageReportMap, id).then((value) {
                  // Show a success message
                  Fluttertoast.showToast(
                    msg: "Report Submitted Successfully......",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );

                  // Clear the fields
                  urlController.clear();
                  descriptionController.clear();
                });
              },style:ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 10,),child: Text("Submit"), ),

              
              
            ],
          ),
        ),
      ),
    );
  }
}