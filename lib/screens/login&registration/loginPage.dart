import 'package:finance_app/modal/add_data.dart';
import 'package:finance_app/screens/login&registration/firebaseDb.dart';
import 'package:finance_app/screens/datapage/homepage.dart';
import 'package:finance_app/screens/login&registration/registerPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:  'AIzaSyClEXejW62v5lsjF_Yvtdb_uhLTwmmcL8Y',
       appId:'1:222756011492:android:f91e978109fbcea91bdbf1',
        messagingSenderId:
        '222756011492',
          projectId:'financeapp-6dcee')
  );
 await Hive.initFlutter();
 Hive.registerAdapter(AdddataAdapter());
 await Hive.openBox<Add_data>('data');
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home:LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool pass_Visibility = true;
  final user_controller = TextEditingController();
  final pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5a9dee),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Log In',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: user_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Your Email",
                    helperText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: pass_controller,
                obscureText:pass_Visibility,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Enter Your Password",
                    helperText: "Password",
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          if(pass_Visibility == true){
                            pass_Visibility = false;
                          }else{
                            pass_Visibility = true;
                          }
                        });
                      },
                       icon:Icon(pass_Visibility ? Icons.visibility_off : Icons.visibility))),
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                     String email = user_controller.text.trim();
                  String password = pass_controller.text.trim();
                  FireBaseHelper().Login(email:email,password:password).then((result) {
                    if(result == null){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage(name:"Minha Sherin",)));
                    }else{
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                    }
                  } );
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(color: Color(0xff5a9dee)),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("--or--"),
            TextButton(
                onPressed: () {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterPage()));
                },
                child: const Text("Register",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
