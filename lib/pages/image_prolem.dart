import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProblem extends StatefulWidget {
  const ImageProblem({super.key});

  @override
  State<ImageProblem> createState() => _ImageProblemState();
}

class _ImageProblemState extends State<ImageProblem> {
  File? image;

  final ImagePicker _imagePicker = ImagePicker();
  String? imageUrl;
  Future<void> pickImage()async{
    try{
      XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);

      if(res != null){
        await uploadImageToFirebase(File(res.path));
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Failed to pick image: $e"),
      
      ));
    }
    
  }

  Future<void> uploadImageToFirebase(File image) async{
    try{
      Reference reference = FirebaseStorage.instance.ref().child("images/${ DateTime.now().microsecondsSinceEpoch}.png");
      await reference.putFile(image).whenComplete(() {
         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          content: Text("Upload Successful"),
      
      ));
      });
      imageUrl = await reference.getDownloadURL();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Failed to upload image: $e"),
      
      ));
    }
  }
  /*UploadTask? uploadTask;*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Report Problem")),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          AnimatedTextKit(animatedTexts: [TyperAnimatedText(" 📝 ",textStyle: TextStyle(fontSize: 30,color: Colors.black,),speed: Duration(microseconds: 100)),]),
          AnimatedTextKit(animatedTexts: [TypewriterAnimatedText("  Upload Image Here....  ",textStyle: TextStyle(fontSize: 30,color: Colors.pinkAccent),speed: Duration(milliseconds: 100))]) ,
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () async {
                pickImage();
              },
              child: CircleAvatar(
                radius: 80,
                child: Icon(Icons.camera_alt, size: 40),
              ),
            ),
          ),
          SizedBox(height: 30,),

          DecorationWidget(),

          SizedBox(height: 30,),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 37, 239, 246)),
            child: Text("Upload"),
          ),
        ],
      ),
    );
  }
}

class DecorationWidget extends StatefulWidget {
  const DecorationWidget({super.key});

  @override
  State<DecorationWidget> createState() => _DecorationWidgetState();
}

class _DecorationWidgetState extends State<DecorationWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        key: _formKey,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: 'Enter Your Description here....',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required'; // Error message for empty field
          }
          return null; // No error if validation passes
        },
      ),
    );
  }
}
