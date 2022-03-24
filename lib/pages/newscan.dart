// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'getuser.dart';
// import 'useritem.dart';
// import 'userlist.dart';

// class NewScan extends StatelessWidget {
//   const NewScan({ Key? key, required this.id_user}) : super(key: key);

//   final int id_user;

//   // final Future<List<User>> products;

//   Future<List<User>> fetchUser() async {
//     var url = "http://172.16.17.142:3000/sapa/getdata.php?id=${id_user}";
//     final response = await http.get(Uri.parse(url));
//     var list = json.decode(response.body);

//     // List<User> _hasil = await list.map<User>((json) => User.fromJson(json)).toList();

//     log(list.toString());
//     return list;
//   }

//   // List<User> decodeUser(String responseBody){
//   //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   //   return parsed.map<User>((json) => User.fromMap(json)).toList();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<List<User>>(
//           future: fetchUser(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) print(snapshot.error);
//             return snapshot.hasData
//               ? UserList(items: snapshot.requireData)
//               : Center(child: CircularProgressIndicator(),);
//           },
//         ),
//       ),
//     );
//   }
// }