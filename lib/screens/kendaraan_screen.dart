import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mosiga_users/screens/mencari_screen.dart';
import 'package:mosiga_users/screens/tambal_ban_screen.dart';

import '../theme/theme.dart';

class KendaraanScreen extends StatefulWidget {
  const KendaraanScreen({super.key});

  @override
  State<KendaraanScreen> createState() => _KendaraanScreenState();
}

class _KendaraanScreenState extends State<KendaraanScreen> {
  bool isMotorSelected = true;
  bool isMobilSelected = false;
  int _radioButton = 0;

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(22, 22, 22, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 18, 8, 18),
                        child: Container(
                          width: 100,
                          height: 65,
                          decoration: BoxDecoration(
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: darkTheme
                                    ? const Color.fromARGB(51, 255, 255, 255)
                                    : const Color(0x33000000),
                                offset: const Offset(5, 3),
                                spreadRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40),
                            shape: BoxShape.rectangle,
                          ),
                          child: Stack(
                            alignment: const AlignmentDirectional(-1, 0),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    14, 0, 0, 0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.chevron_left_rounded,
                                    color:
                                        darkTheme ? Colors.black : Colors.white,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Text(
                                  'Pesan Sekarang',
                                  style: TextStyle(
                                    color:
                                        darkTheme ? Colors.black : Colors.white,
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 14),
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              color: darkTheme ? bg2 : Colors.grey,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 14),
                                    child: Text(
                                      'Pilih Kendaraan',
                                      style: TextStyle(
                                        color: darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            14, 0, 14, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: double.infinity,
                                            height: 125,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, -1),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isMotorSelected = true;
                                                  isMobilSelected = false;
                                                });
                                              },
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: isMotorSelected
                                                      ? (darkTheme
                                                          ? Colors
                                                              .amber.shade400
                                                          : primary)
                                                      : (darkTheme
                                                          ? Colors.grey.shade900
                                                          : Colors.grey),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1, 1),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.asset(
                                                          'images/Motor.png',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                0, 5, 0, 0),
                                                        child: Text(
                                                          'Motor',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: isMotorSelected
                                                                ? (darkTheme
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white)
                                                                : (darkTheme
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                        const SizedBox(width: 14),
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
                                              height: 125,
                                              decoration: BoxDecoration(
                                                color: isMobilSelected
                                                    ? (darkTheme
                                                        ? Colors.amber.shade400
                                                        : primary)
                                                    : (darkTheme
                                                        ? Colors.grey.shade900
                                                        : Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, -1),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1, 1),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.asset(
                                                          'images/Mobil.png',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                0, 5, 0, 0),
                                                        child: Text(
                                                          'Mobil',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: isMobilSelected
                                                                ? (darkTheme
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white)
                                                                : (darkTheme
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                    height: 100,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 16, 8),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                          groupValue:
                                                              _radioButton,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _radioButton =
                                                                  value!;
                                                            });
                                                          },
                                                          activeColor: darkTheme
                                                              ? Colors.amber
                                                                  .shade400
                                                              : primary,
                                                        ),
                                                        const Text(
                                                          'Option 1',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Rp. 10.000',
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
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                          groupValue:
                                                              _radioButton,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _radioButton =
                                                                  value!;
                                                            });
                                                          },
                                                          activeColor: darkTheme
                                                              ? Colors.amber
                                                                  .shade400
                                                              : primary,
                                                        ),
                                                        const Text(
                                                          'Option 2',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Rp. 10.000',
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
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 8, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                          groupValue:
                                                              _radioButton,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _radioButton =
                                                                  value!;
                                                            });
                                                          },
                                                          activeColor: darkTheme
                                                              ? Colors.amber
                                                                  .shade400
                                                              : primary,
                                                        ),
                                                        const Text(
                                                          'Option 3',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Rp. 10.000',
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
                                          ],
                                        ),
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: darkTheme ? bg2 : Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  18, 18, 18, 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: double.infinity,
                                          height: 65,
                                          decoration: BoxDecoration(
                                            color: darkTheme
                                                ? bg2
                                                : Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            border: Border.all(
                                              color: darkTheme
                                                  ? Colors.grey.shade600
                                                  : Colors.grey.shade400,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(14, 0, 14, 0),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Masukkan Kode Voucher",
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  borderSide: const BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (text) {
                                                return null;
                                              },
                                              onChanged: (text) =>
                                                  setState(() {}),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          height: 65,
                                          decoration: BoxDecoration(
                                            color: darkTheme
                                                ? Colors.amber.shade400
                                                : primary,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(18, 0, 18, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Metode Pembayaran',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: darkTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.navigate_next_rounded,
                                                  color: darkTheme
                                                      ? Colors.black
                                                      : Colors.white,
                                                  size: 32,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 14, 24, 14),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              darkTheme ? Colors.black45 : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 12, 12, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Text(
                                    'Rincian Harga',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 4, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tambal Ban',
                                              style: TextStyle(
                                                color: darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 4, 8, 0),
                                        child: Row(
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
                                                fontWeight: FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 4, 8, 0),
                                        child: Row(
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
                                                fontWeight: FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8, 5, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Diskon',
                                              style: TextStyle(
                                                color: darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              '-Rp. 5.000',
                                              style: TextStyle(
                                                color: darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
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
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / (1.618 * 5),
                decoration: BoxDecoration(
                    color: darkTheme ? Colors.black45 : Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total :',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: darkTheme ? Colors.white : Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Rp. 11.000',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 255, 34),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) =>
                                              const MencariScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: darkTheme
                                      ? Colors.amber.shade400
                                      : primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Ink(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Order',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: darkTheme
                                              ? Colors.black
                                              : Colors.white,
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
                    ],
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
