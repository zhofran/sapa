import 'dart:convert';
import 'dart:ffi';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

class QRCODE extends StatefulWidget {
  const QRCODE({ Key? key }) : super(key: key);

  @override
  State<QRCODE> createState() => _QRCODEState();
}

class _QRCODEState extends State<QRCODE> {
  // List<dynamic> po() {
  //  return ['pisang', 'anggur', 'jeruk', 'apel'];
  // }

  Future<dynamic> generateUser() async {
    var url = "http://172.16.17.142:3000/sapa/getuser.php";
    final response = await http.get(Uri.parse(url));
    var user = json.decode(response.body);

    List<User> _user = await user.map<User>((json) => User.fromJson(json)).toList();
    dev.log(user.toString());
    return _user;
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Scan this QR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 15.0),
              FutureBuilder<dynamic>(
                future: generateUser(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return UserList(user: snapshot.requireData);
                  } else {
                    return Text('ERROR');
                  }
                }
              )
              // Container(
              //   width: 200.0,
              //   height: 200.0,
              //   child: QrImage(
              //     errorStateBuilder: (context, error) =>
              //       Text(error.toString()),
              //     data: ,
              //     version: QrVersions.auto,
              //   ),
              // ),
            ],
          ),
        ),
      )
    );
  }
}

// void main() {
//   dev.log(generateUser().toString());
// }

// generateUser() async {
//   var url = "http://172.16.17.142:3000/sapa/getuser.php";
//     final response = await http.get(Uri.parse(url));
//     var user = json.decode(response.body);

//     List<User> _user = await user.map<User>((json) => User.fromJson(json)).toList();
//     return _user;
// }

class User {
  // final int id_user;
  final String email;
  final String pass;
  final String nama_pegawai;

  const User ({
    // required this.id_user,
    required this.email,
    required this.pass,
    required this.nama_pegawai,
  });

  factory User.fromJson(Map<String, dynamic> json){
    // debugPrint(json.toString());
    return User(
      // id_user: int.parse(json['id_user']),
      email: json['email'] as String,
      pass: json['pass'] as String,
      nama_pegawai: json['nama_pegawai'] as String,
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.user}) : super(key: key);

  final List<User> user;
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: user.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${user[index].nama_pegawai}'),
          );
          // return _createDataTable(hasil);
          // return DataTable(
          //   columns: [
          //     DataColumn(label: Text('Email')),
          //     DataColumn(label: Text('Nama Pegawai')),
          //   ], 
          //   rows: List.generate(hasil.length, (index) => _getDataRow(hasil[index])),
          // );
        }
    );
  }
}