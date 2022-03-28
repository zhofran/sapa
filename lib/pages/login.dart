import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sapa/pages/getuser.dart';
import 'package:sapa/pages/primary.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  const Login({ Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController nip = TextEditingController();

  bool isLoading = true;
  
  Future<String> _login() async {
    if(user.text.isEmpty || pass.text.isEmpty){
      Alert(context: context, title: "Data tidak boleh kosong", type: AlertType.warning).show();
    }

    final response = await http.post(Uri.parse("http://172.16.17.143:80/sapa_wima/login.php"),
        body: {'username':user.text, 'password':pass.text});
    // var datauser = json.decode(response.body);
    String jsonDataString = response.body.toString();
    final datauser = json.decode(jsonDataString);
    // User users = User.fromJson(datauser);
    // final users = User.fromMap(datauser);

    // List<User> _datauser = await datauser.map<User>((json) => User.fromJson(json)).toList();

    if(datauser.length==0) {
      Alert(context: context, title: "Login gagal", type: AlertType.error).show();
      print("salah");
    }else{
      debugPrint(datauser[0]["id_user"].toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(
            builder: (context) => Primary(item: datauser[0]["id_user"].toString(),)
          )
      );
      Alert(context: context, title: "Login Berhasil", type: AlertType.success).show();
    }

    return "datauser";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/sword_icon.png',
                width: 140,
              ),
              Center(
                child: Text(
                  'SAPA WIMA',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'Sistem Absensi Pegawai',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: user,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: pass,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class User {
//   String username;
//   String password;

//   User(this.username, this.password);
// }