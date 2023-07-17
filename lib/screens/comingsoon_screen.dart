import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosiga_users/Assistants/database_assistant.dart';
import 'package:mosiga_users/theme/theme.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  final emailTextEditingController = TextEditingController();

  void _submit() async {
    String email = emailTextEditingController.text.trim();
    if (email.isNotEmpty) {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DocumentReference documentRef =
            firestore.collection('EmailTertarik').doc();

        await documentRef.set({
          'email': email,
        });

        print('Data berhasil ditambahkan ke Firestore');
      } catch (e) {
        print('Error: $e');
      }
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Color(0x4C595959),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'images/ComingSoon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 14, 14, 14),
                        child: Text(
                          'We still working on it ...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100),
                        ],
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor:
                              darkTheme ? Colors.black45 : Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
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
                      const SizedBox(
                        height: 14,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                darkTheme ? Colors.amber.shade400 : primary,
                            onPrimary: darkTheme ? Colors.black : Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          _submit();
                        },
                        child: const Text(
                          "Notify Me",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-SemiBold'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 22),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(18, 18, 18, 18),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: darkTheme ? bg2 : Colors.grey,
                            borderRadius: BorderRadius.circular(18),
                            shape: BoxShape.rectangle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.chevron_left_rounded,
                              color: darkTheme ? Colors.white : Colors.black,
                              size: 24,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
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
