import 'package:flutter/material.dart';
import 'package:sapa/pages/ModalAbsen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapa/pages/useritem.dart';
// import 'qrcode.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key, required this.nip}) : super(key: key);
  
  final String nip;
  // final int id_user;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffa0d6bc),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Image.asset(
                  'assets/sword_icon.png',
                  width: 140,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 370,
                height: 439,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 40.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(onPressed: () {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context){
                                  return ModalAbsen();
                                }
                              );
                            }, child: Text(
                              'Logbook',
                              style: GoogleFonts.ptSans(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                            )),
                          ),
                          SizedBox(width: 90,),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(onPressed: () {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context){
                                  return UserItem(nip: widget.nip);
                                }
                              );
                            }, child: Text(
                              'QR Code',
                              style: GoogleFonts.ptSans(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 40.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(onPressed: () {

                            }, child: Text(
                              'Logbook',
                              style: GoogleFonts.ptSans(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),
                            )),
                          ),
                          SizedBox(width: 90,),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(onPressed: () {

                            }, child: Text(
                              'Report',
                              style: GoogleFonts.ptSans(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        )
    );
  }
}