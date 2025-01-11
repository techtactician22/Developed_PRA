import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rapp/pages/database.dart';

class ImageReflect extends StatefulWidget {
  const ImageReflect({super.key});

  @override
  State<ImageReflect> createState() => _ImageReflectState();
}

class _ImageReflectState extends State<ImageReflect> {
  Stream? UserStream;
  bool _showDeleteAlert = false;
  

  getonload() async {
    UserStream = await NDatabaseMethods().getImageReports();
    setState(() {});
  }

  @override
  void initState() {
    getonload();
    super.initState();
  }

  Widget allImageReports() {
    return StreamBuilder(
      stream: UserStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  // Get the URL and trim any extra quotes or spaces
                  String imageUrl = ds["Url"].toString().trim();
                  String status = ds["Status"];

                  // Logging the image URL to confirm it's correct
                  print("Image URL: $imageUrl");

                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.8, // Increased width
                        height: 500, // Increased height for the container
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                 status=="Pending"?ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 0, 0)), child: Text(ds["Status"],style: TextStyle(color: Colors.white),)):ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 99, 239, 115)), child: Text(ds["Status"])),
                                 SizedBox(width: 10,),
                                IconButton(icon:Icon(Icons.check,color: const Color.fromARGB(255, 33, 231, 40),) , onPressed: ()async { 
                                  await NDatabaseMethods().updateData(ds["Id"]);
                                 
                                 },),
                                SizedBox(width: 10,),
                                IconButton(icon:Icon(Icons.delete,color: Colors.redAccent,) , onPressed: ()async { 
                                   await NDatabaseMethods().deleteUserReport(ds["Id"]);
                                 },),
                                
                              ],
                            ),
                            SizedBox(height: 20,),
                            // Displaying the image from the cleaned URL
                            Container(
                              width: double.infinity, // To make the image fill the container
                              height: 200, // Increased height for the image
                              child: Image.network(
                                imageUrl, // Correctly passing imageUrl here
                                fit: BoxFit.cover, // Ensures the image covers the space
                                loadingBuilder: (BuildContext context, Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                                (loadingProgress.expectedTotalBytes ?? 1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (BuildContext context, Object error,
                                    StackTrace? stackTrace) {
                                  // Fallback error icon if image fails to load
                                  return Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                              ),
                            ),
                            Text("Description : "+ds["Description"],style: TextStyle(color: const Color.fromARGB(255, 5, 3, 5),fontSize: 20.0,fontWeight: FontWeight.bold),),
                            Text("Description : "+ds["Description"],style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
                            Text("Description : "+ds["Description"],style: TextStyle(color: Colors.pinkAccent,fontSize: 20.0,fontWeight: FontWeight.bold),),
                            Text("Description : "+ds["Description"],style: TextStyle(color: Colors.green,fontSize: 20.0,fontWeight: FontWeight.bold),),
                           
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reporting",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "History",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
            Expanded(child: allImageReports()),
          ],
        ),
      ),
    );
  }
}


