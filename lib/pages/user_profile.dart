import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String username;
  final String email;

  // Constructor to receive username and email
  UserProfile({required this.username, required this.email});

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
                title: Text(
                  "User Name : $username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  "Email : $email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
