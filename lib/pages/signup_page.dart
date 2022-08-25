// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepostnew/pages/services/auth_service.dart';
import 'package:firepostnew/pages/services/prefs_service.dart';
import 'package:firepostnew/pages/signin_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);
static const String id='signup_page';
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  void doSignUp(){
    final email=emailController.text.toString().trim();
    final password=passwordController.text.toString().trim();
    final firstName=firstNameController.text.toString().trim();
    final lastName=lastNameController.text.toString().trim();
    Navigator.pushReplacementNamed(context, HomePage.id);
    AuthService.signUpUser(context, firstName, email, password).then((firebaseUser) => {
      getFirebaseUser(firebaseUser),
    });
  }
  getFirebaseUser(User firebaseUser){
    if(firebaseUser!=null){
      Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, HomePage.id);
    }else{
      print('Check your email');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration:const InputDecoration(
                      hintText: 'First Name',
                      prefixIcon: Icon(Icons.person)
                  ),

                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: lastNameController,
                  decoration:const InputDecoration(
                      hintText: 'Last Name',
                      prefixIcon: Icon(Icons.person)
                  ),

                ),
                const  SizedBox(height: 10,),
                TextField(
                  controller: emailController,
                  decoration:const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email)
                  ),

                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: passwordController,
                  decoration:const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock)
                  ),

                ),
                const  SizedBox(height: 40,),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: const Text('SignUp Page'),
                    onPressed: ()=>doSignUp(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('Already have account ?'),
                          SizedBox(width: 20,),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context,SignInPage.id);
                          }, child:Text('Sign In'))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
