import 'dart:developer';

import 'package:flutter/material.dart';
import 'login.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'getuser.dart';



// hasil = [{'id_user': }];
// debugPrint(User.);


class UserItem extends StatelessWidget {
  const UserItem({ Key? key, required this.nip }) : super(key: key);
  
  final String nip;
  // final int id_user;

  Future<dynamic> fetchUser() async {
    var url = "http://172.16.17.142:3000/sapa/getdata.php?id=$nip";
    final response = await http.get(Uri.parse(url));
    var list = json.decode(json.encode(response.body));

    // List<User> _hasil = await list.map<User>((json) => User.fromJson(json)).toList();

    log(list.toString());
    return list;
  }
  
  //final List<Map<String, dynamic>> hasil=[];
  // List<Map<String, int>> hasil = [{'id':item.id_user}];
  
  // void main(){
  //   var arr = [{'email': this.item.email}];
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child:  
            // Text(debugPrint(item)) 
            QrImage(
              data: fetchUser().toString(),
            ),
          ),
          // Text(this.item.email),
          // Text(this.item.nama_pegawai),
        ],
      ),
    );
  }
}