import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosiga_users/global/global.dart';
import 'package:mosiga_users/screens/main_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmpasswordTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  final _formkey = GlobalKey<FormState>();

  void _submit() async {
    // Validasi semua field formulir
    if (_formkey.currentState!.validate()) {
      // Periksa apakah email sudah terdaftar
      bool isEmailRegistered = await isEmailAlreadyRegistered(
          emailTextEditingController.text.trim());

      if (isEmailRegistered) {
        Fluttertoast.showToast(msg: "Email is already registered");
      } else {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: confirmpasswordTextEditingController.text.trim())
            .then((auth) async {
          currentUser = auth.user;
          if (currentUser != null) {
            Map userMap = {
              "id": currentUser!.uid,
              "name": nameTextEditingController.text.trim(),
              "email": emailTextEditingController.text.trim(),
              "phone": phoneTextEditingController.text.trim(),
              "address": addressTextEditingController.text.trim(),
            };
            DatabaseReference userRef = FirebaseDatabase.instance.ref();
            userRef.child("users").child(currentUser!.uid).set(userMap);
          }
          await Fluttertoast.showToast(msg: "Successfully Registered :");
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => MainScreen()));
        }).catchError((error) {
          // Tangkap dan tangani kesalahan yang terjadi
          Fluttertoast.showToast(msg: 'Error: $error');
        });
      }
    } else {
      Fluttertoast.showToast(msg: "Not all fields are valid!");
    }
  }

  Future<bool> isEmailAlreadyRegistered(String email) async {
    bool isRegistered = false;

    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password:
              'random_password' // Menggunakan password sembarang untuk melakukan login
          );

      if (userCredential.user != null) {
        // Email sudah terdaftar
        isRegistered = true;
      }

      await firebaseAuth.signOut(); // Logout setelah verifikasi email
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        // Email belum terdaftar
        isRegistered = false;
      } else {
        // Terjadi kesalahan saat memeriksa email terdaftar
        isRegistered =
            true; // Atur ke true jika tidak dapat memastikan status pendaftaran
      }
    }

    return isRegistered;
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(24),
            children: [
              Column(
                children: [
                  Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(100),
                          ],
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: darkTheme
                                ? Colors.black45
                                : Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Name Can't Be Empty";
                            }
                            if (text.length < 2) {
                              return "Please Enter Valid Name";
                            }
                            if (text.length > 50) {
                              return "Name Can't Be More Than 50";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            nameTextEditingController.text = text;
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                            fillColor: darkTheme
                                ? Colors.black45
                                : Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Email Can't Be Empty";
                            }
                            if (EmailValidator.validate(text) == true) {
                              return null;
                            }
                            if (text.length < 2) {
                              return "Please Enter Valid Email";
                            }
                            if (text.length > 50) {
                              return "Email Can't Be More Than 50";
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
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: darkTheme
                                ? Colors.black45
                                : Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Phone Can't Be Empty";
                            }

                            if (text.length < 2) {
                              return "Please Enter Valid Phone";
                            }
                            if (text.length > 14) {
                              return "Phone Can't Be More Than 14";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            phoneTextEditingController.text = text;
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(100),
                          ],
                          decoration: InputDecoration(
                            hintText: "Address",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: darkTheme
                                ? Colors.black45
                                : Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.home,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Address Can't Be Empty";
                            }

                            if (text.length < 2) {
                              return "Please Enter Valid Address";
                            }
                            if (text.length > 100) {
                              return "Address Can't Be More Than 100";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            addressTextEditingController.text = text;
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
                              fillColor: darkTheme
                                  ? Colors.black45
                                  : Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.key,
                                color: darkTheme
                                    ? Colors.amber.shade400
                                    : Colors.grey,
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
                              return "Password Can't Be Empty";
                            }
                            if (text.length < 6) {
                              return "Please Enter Valid Password";
                            }
                            if (text.length > 49) {
                              return "Password Can't Be More Than 49";
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
                        TextFormField(
                          obscureText: !_passwordVisible,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: darkTheme
                                  ? Colors.black45
                                  : Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.key,
                                color: darkTheme
                                    ? Colors.amber.shade400
                                    : Colors.grey,
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
                              return "Confirm Password Can't Be Empty";
                            }

                            if (text != passwordTextEditingController.text) {
                              return "Password Do Not Match";
                            }
                            if (text.length < 6) {
                              return "Please Enter Valid Password";
                            }
                            if (text.length > 49) {
                              return "Password Can't Be More Than 49";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            confirmpasswordTextEditingController.text = text;
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:
                            darkTheme ? Colors.amber.shade400 : Colors.blue,
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
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an Account ?"),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color:
                                darkTheme ? Colors.amber.shade400 : Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
