import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rapp/pages/user_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Replace with the actual signup page

class UserLogout extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   UserLogout({super.key});

  Future<void> _logout(BuildContext context) async {
    print("FirebaseAuth current user: ${FirebaseAuth.instance.currentUser}");
    try {
      // Get the currently logged-in user
      User? user = _auth.currentUser;

      if (user != null) {
        print("User logged in: ${user.email}");

        // Remove user data from Firestore
        await _firestore.collection('users').doc(user.uid).delete();
        print("User data removed from Firestore.");

        // Re-authenticate user before deleting (if needed)
        try {
          // Replace with a proper password for re-authentication, or skip if not required
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: 'user-password', // Ask for user password during logout
          );
          await user.reauthenticateWithCredential(credential);
          print("User re-authenticated.");
        } catch (e) {
          print("Re-authentication failed: $e");
        }

        // Delete the user account
        await user.delete();
        print("User account deleted from Firebase Authentication.");

        // Clear local user session
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        print("Local session cleared.");

        // Navigate to the SignupPage
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserAuth()),
          (Route<dynamic> route) => false,
        );
        print("Navigated to SignupPage.");
      } else {
        print("No user is currently logged in.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No user is currently logged in.")),
        );
      }
    } catch (e) {
      print("Error during logout: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to log out. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Are you sure you want to log out?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Cancel logout and return to the previous screen
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Confirm logout
                    _logout(context);
                  },
                  child: Text("Logout"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
