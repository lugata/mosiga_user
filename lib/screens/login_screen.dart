import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosiga_users/global/global.dart';
import 'package:mosiga_users/screens/main_page.dart';
import 'package:mosiga_users/screens/register_screen.dart';
import 'package:mosiga_users/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  final _formkey = GlobalKey<FormState>();

  void _submit() async {
    // Validasi semua field formulir
    if (_formkey.currentState!.validate()) {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim())
          .then((auth) async {
        currentUser = auth.user;

        await Fluttertoast.showToast(msg: "Berhasil Masuk");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      }).catchError((error) {
        // Tangkap dan tangani kesalahan yang terjadi
        Fluttertoast.showToast(msg: "Email atau Password Salah");
      });
    } else {
      Fluttertoast.showToast(msg: "Email atau Password Tidak Boleh Kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "L O G I N",
                style: TextStyle(
                    color: darkTheme ? Colors.amber.shade400 : Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ],
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor:
                            darkTheme ? Colors.black45 : Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color:
                              darkTheme ? Colors.amber.shade400 : Colors.grey,
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Email tidak boleh kosong";
                        }
                        if (EmailValidator.validate(text) == true) {
                          return null;
                        }
                        if (text.length < 2) {
                          return "Masukkan Email yang valid";
                        }
                        if (text.length > 50) {
                          return "Email tidak boleh lebih dari 50 karakter";
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        emailTextEditingController.text = text;
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: !_passwordVisible,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor:
                              darkTheme ? Colors.black45 : Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color:
                                darkTheme ? Colors.amber.shade400 : Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey,
                            ),
                            //update state password variable
                            onPressed: () => setState(() {
                              _passwordVisible = !_passwordVisible;
                            }),
                          )),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                        if (text.length < 6) {
                          return "Masukkan Password yang valid";
                        }
                        if (text.length > 49) {
                          return "Password tidak boleh lebih dari 49 karakter";
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        passwordTextEditingController.text = text;
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: darkTheme ? Colors.amber.shade400 : primary,
                          onPrimary: darkTheme ? Colors.black : Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minimumSize: Size(double.infinity, 50)),
                      onPressed: () {
                        _submit();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 22, fontFamily: 'Poppins-SemiBold'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => RegisterScreen()));
                          },
                          child: Text(
                            "Create An Account",
                            style: TextStyle(
                              fontSize: 18,
                              color: darkTheme ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
