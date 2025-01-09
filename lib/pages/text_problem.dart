import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:rapp/pages/database.dart';
import 'package:intl/intl.dart';
import 'package:rapp/pages/user_data.dart';

class TextProblem extends StatefulWidget {
  final String username;
  final String email;

  const TextProblem({super.key, required this.username, required this.email});

  @override
  State<TextProblem> createState() => _TextProblemState();
}

class _TextProblemState extends State<TextProblem> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = UserData();
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
            SizedBox(height: 30),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  " 📝 ",
                  textStyle: TextStyle(fontSize: 30, color: Colors.black),
                  speed: Duration(microseconds: 100),
                ),
              ],
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  " ʀᴇᴘᴏʀᴛ ʏᴏᴜʀ  ",
                  textStyle: TextStyle(fontSize: 30, color: Colors.pinkAccent),
                  speed: Duration(milliseconds: 100),
                ),
              ],
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  " ᴘʀᴏʙʟᴇᴍ ʙᴇʟᴏᴡ ",
                  textStyle: TextStyle(fontSize: 30, color: Colors.blue),
                  speed: Duration(milliseconds: 100),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: titleController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Enter Title Of The Problem......",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
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
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                DateTime now = DateTime.now();
                String formattedDate = DateFormat('yyyy-MM-dd').format(now); // Get only the date
                String formattedTime = DateFormat('HH:mm:ss').format(now); // Get only the time

                // Generate a random Id for the report
                String id = randomAlphaNumeric(10);

                // Create the report map with separate date and time fields
                Map<String, dynamic> textReportMap = {
                  "Username": userData.username, // Use widget.username
                  "Email": userData.email, // Use widget.email
                  "Title": titleController.text,
                  "Description": descriptionController.text,
                  "Id": id,
                  "date": formattedDate, // Date field
                  "time": formattedTime, // Time field
                };

                // Add the report to Firestore
                await DatabaseMethods().addTextReprts(textReportMap, id).then((value) {
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
                  titleController.clear();
                  descriptionController.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 37, 239, 246),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(120, 50),
              ),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
