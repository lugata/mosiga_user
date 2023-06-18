import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset(darkTheme
                    ? 'images/dark_city.jpg'
                    : 'images/light_city.jpg'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                      color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
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
                            Icons.person,
                            color:
                                darkTheme ? Colors.amber.shade400 : Colors.grey,
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
                            return "Phone Can't Be Empty";
                          }
                          if (EmailValidator.validate(text) == true) {
                            return null;
                          }
                          if (text.length < 2) {
                            return "Please Enter Valid Phone";
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
                      IntlPhoneField(
                        showCountryFlag: false,
                        dropdownIcon: Icon(
                          Icons.arrow_drop_down,
                          color:
                              darkTheme ? Colors.amber.shade400 : Colors.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: "Phone Number",
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
                        ),
                        initialCountryCode: 'ID',
                        onChanged: (text) => setState(() {
                          phoneTextEditingController.text = text.completeNumber;
                        }),
                      )
                    ],
                  ),
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
                      Icons.home,
                      color: darkTheme ? Colors.amber.shade400 : Colors.grey,
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
                        color: darkTheme ? Colors.amber.shade400 : Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:
                              darkTheme ? Colors.amber.shade400 : Colors.grey,
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
                        color: darkTheme ? Colors.amber.shade400 : Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:
                              darkTheme ? Colors.amber.shade400 : Colors.grey,
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

                    if (text == passwordTextEditingController.text) {
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
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: darkTheme ? Colors.amber.shade400 : Colors.grey,
                      onPrimary: darkTheme ? Colors.black : Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {},
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
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Already Have an Account ?",
                    style: TextStyle(
                      color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
