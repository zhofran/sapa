import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sapa/pages/absensi.dart';
import 'package:sapa/pages/menu.dart';

class Primary extends StatefulWidget {
  const Primary({Key? key, required this.item}) : super(key: key);

  // final String username;
  // final int id_user;
  final String item;

  

  @override
  State<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  // StreamController<List> _streamController = StreamController<List>();
  int selectedpage = 0;

  // get coba => getdata();
  List? cobaJson;

  Future getdata() async {
    final response = await http.get(Uri.parse("http://172.16.17.142:3000/sapa/getdata.php?id=$item"));
    debugPrint(response.body.toString());
    return response.body;

    // _streamController.add(coba);
    // setState(() {
    //   cobaJson = json.decode(response.body);
    // });
      debugPrint(cobaJson.toString());
  }

  @override
  void initState(){
    getdata();
    super.initState();
  }

  get item => widget.item;

  @override
  Widget build(BuildContext context) {
    // final news = getdata();
    debugPrint(getdata.toString());
    // debugPrint(cobaJson![0]['nip'].toString());
    final _pageNo = [ Menu(nip: cobaJson?[0]['nip']), const Absensi()];
    // FutureBuilder(
    //   future: getdata(),
    //   builder: (BuildContext context, snapshot) {
    //     if (snapshot.hasData) {
    //       return Center(
    //         child: Text('${snapshot.data}'),
    //       );
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   }
    // );
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
              child: Builder(
                builder: (context) {
                  return Text(
                    'Welcome, ${cobaJson?[0]['nama_pegawai']}',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  );
                }
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

class User {
  // int id_user;
  String nip;
  String email;
  String pass;
  String nama_pegawai;

  User({
  //  required this.id_user,
   required this.nip, 
   required this.email, 
   required this.pass, 
   required this.nama_pegawai
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      // id_user: int.parse(json['id_user']),
      nip: json['nip'] as String,
      email: json['email'] as String,
      pass: json['pass'] as String,
      nama_pegawai: json['nama_pegawai'] as String,
    );
  }
}