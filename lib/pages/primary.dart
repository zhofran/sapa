import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'getuser.dart';
import 'package:sapa/pages/absensi.dart';
import 'package:sapa/pages/menu.dart';

class Primary extends StatefulWidget {
  const Primary({Key? key, required this.item}) : super(key: key);

  // final String username;
  // final int id_user;
  final User item;

  @override
  State<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  int selectedpage = 0;

  @override
  Widget build(BuildContext context) {
    final _pageNo = [ Menu(nip: widget.item.nip), const Absensi()];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: const Color(0xffc4deaf),
          title: Padding(
            padding: const EdgeInsets.only(top: 23.0),
            child: Text(
              'SAPA WIMA',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'Welcome, ${widget.item.username}',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_sharp,
                ),
                iconSize: 40,
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffa0d6bc),
      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: Colors.green,
        items: const [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.access_alarm),
          TabItem(icon: Icons.account_circle_sharp),
          TabItem(icon: Icons.settings)
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index){
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}

