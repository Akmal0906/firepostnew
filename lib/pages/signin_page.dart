// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepostnew/pages/home_page.dart';
import 'package:firepostnew/pages/services/auth_service.dart';
import 'package:firepostnew/pages/services/prefs_service.dart';
import 'package:firepostnew/pages/signup_page.dart';
import 'package:flutter/material.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);
static const String id='signin_page';
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void doSignIn(){
    final email=emailController.text.toString().trim();
    final password=passwordController.text.toString().trim();
    AuthService.signInUser(context, email, password).then((firebaseUser) => {
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
                    controller: emailController,
                    decoration:const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email)
                    ),

                  ),
                 const SizedBox(height: 20,),
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
                      child: const Text('SignIn Page'),
                      onPressed: ()=>doSignIn(),
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(left: 50,right: 50),
                   child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('Already have account ?'),
                            SizedBox(width: 20,),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context,SignUpPage.id);
                            }, child:Text('Sign Up'))
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
