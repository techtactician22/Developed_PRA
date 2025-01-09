import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Center(child: Text("User Profile")),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage(""), // Ensure the path is valid
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.person_4_outlined),
                
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.email),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

