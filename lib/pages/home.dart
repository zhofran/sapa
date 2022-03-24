import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapa/pages/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'SAPA WIMA',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'Sistem Absensi Pegawai',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
