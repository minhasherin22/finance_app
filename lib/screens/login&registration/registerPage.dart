import 'package:finance_app/screens/login&registration/firebaseDb.dart';
import 'package:finance_app/screens/login&registration/loginPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final user_controller = TextEditingController();
    final pass_controller = TextEditingController();
    bool pass_Visibility = true;
    return Scaffold(
      backgroundColor: Color(0xff5a9dee),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
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
                    FireBaseHelper().register(email:email,password:password).then((result) {
                       if(result == null){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
                       }else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                       }
                    });
                  },
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(color: Color(0xff5a9dee)),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("--or--"),
            TextButton(
                onPressed: () {},
                child: const Text("Already have an user?? login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}