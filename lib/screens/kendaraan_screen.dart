import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mosiga_users/screens/tambal_ban_screen.dart';

import '../theme/theme.dart';

class KendaraanScreen extends StatefulWidget {
  const KendaraanScreen({super.key});

  @override
  State<KendaraanScreen> createState() => _KendaraanScreenState();
}

class _KendaraanScreenState extends State<KendaraanScreen> {
  bool _isVisible = true;
  bool isMotorSelected = true;
  bool isMobilSelected = false;
  int _radioButton = 0;
  String selectedOption = 'Opsi Pembayaran 1';

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.656990, 112.746170), // Koordinat Pasuruan Bangil Rembang
    zoom: 14.0,
  );

  Set<Circle> circleSet = {};

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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(22, 12, 22, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 18, 8, 18),
                            child: Container(
                              width: 100,
                              height: 65,
                              decoration: BoxDecoration(
                                color:
                                    darkTheme ? Colors.amber.shade300 : primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(6, 6),
                                    spreadRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(40),
                                shape: BoxShape.rectangle,
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(-1, 0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14, 0, 0, 0),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.chevron_left_rounded,
                                        color: darkTheme
                                            ? Colors.black
                                            : Colors.white,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Pilih Kendaraan',
                                      style: TextStyle(
                                        color: darkTheme
                                            ? Colors.black
                                            : Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMotorSelected = true;
                                        isMobilSelected = false;
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: isMotorSelected
                                            ? primary
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      alignment: AlignmentDirectional(0, -1),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'images/Motor.png',
                                                  width: double.infinity,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  'Motor',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: 'Poppins',
                                                    color: darkTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMotorSelected = false;
                                        isMobilSelected = true;
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: isMobilSelected
                                            ? primary
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      alignment: AlignmentDirectional(0, -1),
                                      child: Container(
                                        width: double.infinity,
                                        height: 150,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'images/Mobil.png',
                                                  width: 150,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  'Mobil',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: 'Poppins',
                                                    color: darkTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
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
                          Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // Tindakan saat opsi 1 dipilih
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                  value: 1,
                                                  groupValue: _radioButton,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _radioButton = value!;
                                                    });
                                                  },
                                                  activeColor: darkTheme
                                                      ? Colors.amber.shade400
                                                      : primary,
                                                ),
                                                Text(
                                                  'Option 1',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Rp. 10.000',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // Tindakan saat opsi 1 dipilih
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                  value: 2,
                                                  groupValue: _radioButton,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _radioButton = value!;
                                                    });
                                                  },
                                                  activeColor: darkTheme
                                                      ? Colors.amber.shade400
                                                      : primary,
                                                ),
                                                Text(
                                                  'Option 2',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Rp. 10.000',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // Tindakan saat opsi 1 dipilih
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                  value: 3,
                                                  groupValue: _radioButton,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _radioButton = value!;
                                                    });
                                                  },
                                                  activeColor: darkTheme
                                                      ? Colors.amber.shade400
                                                      : primary,
                                                ),
                                                Text(
                                                  'Option 3',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Rp. 10.000',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Tambahkan kode yang serupa untuk opsi lainnya
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xCC000000),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Text(
                              'Rincian Pesanan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: darkTheme ? Colors.white : Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tamban Ban ',
                                          style: TextStyle(
                                            color: darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Rp. 10.000',
                                          style: TextStyle(
                                            color: darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ongkos Antar',
                                          style: TextStyle(
                                            color: darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Rp. 5.000',
                                          style: TextStyle(
                                            color: darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Biaya Admin',
                                          style: TextStyle(
                                            color: darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Rp. 1.000',
                                          style: TextStyle(
                                            color: darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xCC000000),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan Kode Voucher",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      filled: true,
                                      fillColor: darkTheme
                                          ? Colors.black45
                                          : Colors.grey.shade200,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      return null;
                                    },
                                    onChanged: (text) => setState(() {}),
                                  ),
                                ),
                                DropdownButton<String>(
                                  value: selectedOption,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedOption = newValue!;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: 'Opsi Pembayaran 1',
                                      child: Text('Opsi Pembayaran 1'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Opsi Pembayaran 2',
                                      child: Text('Opsi Pembayaran 2'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Opsi Pembayaran 3',
                                      child: Text('Opsi Pembayaran 3'),
                                    ),
                                  ],
                                  isExpanded: true,
                                  underline: Container(
                                    height: 2,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : primary,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        darkTheme ? Colors.white : Colors.black,
                                    size: 24,
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    elevation: 3,
                                    primary: darkTheme
                                        ? Colors.amber.shade400
                                        : primary,
                                  ),
                                  child: Ink(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Pesan Sekarang',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            color: darkTheme
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 15,
                                          color: darkTheme
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
