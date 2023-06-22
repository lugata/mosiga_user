import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosiga_users/global/global.dart';
import 'package:mosiga_users/screens/login_screen.dart';
import 'package:mosiga_users/screens/main_page.dart';
import 'package:mosiga_users/theme/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();

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
        Fluttertoast.showToast(msg: "Email sudah terdaftar");
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
            };
            DatabaseReference userRef = FirebaseDatabase.instance.ref();
            userRef.child("users").child(currentUser!.uid).set(userMap);
          }
          await Fluttertoast.showToast(msg: "Pendaftaran berhasil");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => MainScreen()));
        }).catchError((error) {
          // Tangkap dan tangani kesalahan yang terjadi
          Fluttertoast.showToast(msg: 'Error: $error');
        });
      }
    } else {
      Fluttertoast.showToast(msg: "Isi Terlebih Dahulu");
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
          backgroundColor: darkTheme ? Colors.amber.shade400 : primary,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.navigate_before_rounded,
                                  size: 50,
                                  color:
                                      darkTheme ? Colors.black : Colors.white,
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 9),
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.center,
                                "SIGN UP",
                                style: TextStyle(
                                    color:
                                        darkTheme ? Colors.black : Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  decoration: BoxDecoration(
                    color: darkTheme ? Colors.grey.shade900 : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42),
                      topRight: Radius.circular(42),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              decoration: InputDecoration(
                                hintText: "Nama",
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Nama tidak boleh kosong";
                                }
                                if (text.length < 2) {
                                  return "Masukkan Nama yang valid";
                                }
                                if (text.length > 50) {
                                  return "Nama tidak boleh lebih dari 50 karakter";
                                }
                                return null;
                              },
                              onChanged: (text) => setState(() {
                                nameTextEditingController.text = text;
                              }),
                            ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(14),
                            ],
                            decoration: InputDecoration(
                              hintText: "Nomor Telepon",
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Nomor Telepon tidak boleh kosong";
                              }
                              if (text.length < 2) {
                                return "Masukkan Nomor Telepon yang valid";
                              }
                              if (text.length > 14) {
                                return "Nomor Telepon tidak boleh lebih dari 14 karakter";
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          TextFormField(
                            obscureText: !_passwordVisible,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            decoration: InputDecoration(
                                hintText: "Konfirmasi Password",
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Konfirmasi Password tidak boleh kosong";
                              }

                              if (text != passwordTextEditingController.text) {
                                return "Password tidak sesuai";
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
                              confirmpasswordTextEditingController.text = text;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    darkTheme ? Colors.amber.shade400 : primary,
                                onPrimary:
                                    darkTheme ? Colors.black : Colors.white,
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
                                  fontSize: 22, fontFamily: 'Poppins-SemiBold'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already Have An Account ? ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      darkTheme ? Colors.white : Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => LoginScreen()));
                                },
                                child: Text(
                                  "Sign In ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
