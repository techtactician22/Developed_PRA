import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rapp/functions/authFunctions.dart';
import 'package:rapp/pages/drawer.dart';
import 'user_data.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});
  

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  final  _usernameController = TextEditingController();
  final  _emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = "";
  String password = "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: AnimatedTextKit(animatedTexts: [TyperAnimatedText("User Authentication",speed: Duration(milliseconds: 100))])),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
            
          ),
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image.network("data:image/png;base64,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"),
              !isLogin?
              TextFormField(
                controller: _usernameController,
                key: ValueKey('Username'),
                decoration: InputDecoration(
                  hintText: "Enter Username"
                  
                ),
                validator: (value){
                  if(value.toString().length<3){
                    return 'Username is so small';
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    username = value!;
                  });
                },
              ):Container(),
              TextFormField(
                controller: _emailController,
                key: ValueKey('Email'),
                decoration: InputDecoration(
                  hintText: "Enter Email"
                ),
                validator: (value){
                  if(!(value.toString().contains('@'))){
                    return 'Invalid Email';
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey('Password'),
                decoration: InputDecoration(
                  hintText: "Enter Password"
                ),
                validator: (value){
                  if(value.toString().length<6){
                    return 'Password is so small';
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed:(){
                  if(_formkey.currentState!.validate()){
                    _formkey.currentState!.save();
                    signup(email, password);
                    UserData().email = _emailController.text; UserData().username = _usernameController.text;
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>DrawerWidget()));
                                       
                  }
                  
                } ,style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),backgroundColor: Colors.green), child: isLogin ? Text("Login",style: TextStyle(color: Colors.white),) : Text("Signup",style: TextStyle(color: Colors.white),))),
                SizedBox(
                  height: 10,
                ),
                TextButton(onPressed: (){
                  setState(() {
                    isLogin = !isLogin;
                  });
                }, child: Text("Already Signed Up? Login",style: TextStyle(color: Colors.blue)))
          ],),
        ),
      ),
    );
  }
}