// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// Future<List<Hasil>> getData(http.Client client) async {
//   final response = await client.get(Uri.parse('http://172.16.17.142:3000/sapa/getdata.php'));
//   return compute(parseData, response.body);
// }

// List<Hasil> parseData(String responseBody){
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Hasil>((json) => Hasil.fromJson(json)).toList();
// }

// DataRow _getDataRow(hasil){
//   return DataRow(cells: [
//     DataCell(Text(hasil["email"])),
//     DataCell(Text(hasil["nama_pegawai"])),
//   ]);
// }

class Absensi extends StatefulWidget {
  const Absensi({Key? key}) : super(key: key);

  @override
  _AbsensiState createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  late HasilDataSource hasilDataSource;
  late List<GridColumn> _columns;

  Future<dynamic> generateHasilList() async {
    var url = "http://172.16.17.142:3000/sapa/getdata.php";
    final response = await http.get(Uri.parse(url));
    var list = json.decode(response.body);

    List<Hasil> _hasil = await list.map<Hasil>((json) => Hasil.fromJson(json)).toList();
    hasilDataSource = HasilDataSource(_hasil);
    return _hasil;
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'id',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Text(
            'ID',
          )
        )
      ),
      GridColumn(
        columnName: 'email',
        width: 80,
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Email')
        )
      ),
      GridColumn(
        columnName: 'pass',
        width: 120,
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            'Password',
            overflow: TextOverflow.ellipsis,
          )
        )
      ),
      GridColumn(
        columnName: 'nama_pegawai',
        label: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text('Nama Pegawai')
        )
      ),
    ];
  }

  @override
  void initState(){
    super.initState();
    _columns = getColumns();
  }

  // Future<List> getData() async {
  //   final response = await http.get(Uri.parse("http://172.16.17.142:3000/sapa/getdata.php"));
  //   debugPrint(response.body);
  //   return jsonDecode(response.body);
  // }
  

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
                Text(
                  'Absensi',
                  style: GoogleFonts.ptSans(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<dynamic>(
                  future: generateHasilList(),
                  builder: (context, data) {
                    return data.hasData
                      ? SfDataGrid(
                        source: hasilDataSource, 
                        columns: _columns,
                        columnWidthMode: ColumnWidthMode.fill,)
                      : Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                  // future: getData(http.Client()),
                  // builder: (context, snapshot){
                  //   if(snapshot.hasError){
                  //     return Center(
                  //       child: Text('${snapshot.error}'),
                  //     );
                  //   } else if(snapshot.hasData) {
                  //     return HasilList(hasil: snapshot.requireData);
                  //     // return Text(snapshot.data.toString());
                  //   } else {
                  //     return Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   }
                  // },
                  // future: getData(),
                  // builder: (BuildContext context,AsyncSnapshot snapshot) {
                  //   if (snapshot.hasError) print(snapshot.error);
                  
                  //   return snapshot.hasData
                  //   ? ItemList(lokasi: [snapshot.data])
                  //   : Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  // },
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class HasilDataSource extends DataGridSource {
  
  HasilDataSource(this.hasil){
    buildDataGridRow();
  }

  void buildDataGridRow() {
    _hasilDataGridRows = hasil.map<DataGridRow>((h) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'ID User', value: h.id_user),
      DataGridCell<String>(columnName: 'Email', value: h.email),
      DataGridCell<String>(columnName: 'Password', value: h.pass),
      DataGridCell<String>(columnName: 'Nama Pegawai', value: h.nama_pegawai),
    ])).toList();
  }

  List<Hasil> hasil = [];

  List<DataGridRow> _hasilDataGridRows = [];

  @override
  List<DataGridRow> get rows => _hasilDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row){
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (e) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList()
    );
  }

  void updateDataGrid(){
    notifyListeners();
  }

}

class Hasil {
  final int id_user;
  final String email;
  final String pass;
  final String nama_pegawai;

  const Hasil ({
    required this.id_user,
    required this.email,
    required this.pass,
    required this.nama_pegawai,
  });

  factory Hasil.fromJson(Map<String, dynamic> json){
    // debugPrint(json.toString());
    return Hasil(
      id_user: int.parse(json['id_user']),
      email: json['email'] as String,
      pass: json['pass'] as String,
      nama_pegawai: json['nama_pegawai'] as String,
    );
  }
}


// class HasilList extends StatelessWidget {
//   const HasilList({Key? key, required this.hasil}) : super(key: key);

//   final List<Hasil> hasil;
  

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: hasil.length,
//         itemBuilder: (context, index) {
//           // return ListTile(
//           //   title: Text('${hasil[index].email}'),
//           // );
//           // return _createDataTable(hasil);
//           return DataTable(
//             columns: [
//               DataColumn(label: Text('Email')),
//               DataColumn(label: Text('Nama Pegawai')),
//             ], 
//             rows: List.generate(hasil.length, (index) => _getDataRow(hasil[index])),
//           );
//         }
//     );
//   }
// }

// DataTable _createDataTable(Hasil){
//   return DataTable(columns: _createColumns(), rows: _createRows(Hasil));
// }

// List<DataColumn> _createColumns() {
//   return [
//     DataColumn(label: Text('Email')),
//     DataColumn(label: Text('Nama Pegawai')),
//   ];
// }

// List<DataRow> _createRows(Hasil) {
//   return [
//     DataRow(
//       cells:
//       List.generate(hasil.length, (index) => 
//         DataCell(Text(hasil[index].email))
//       ) 
//     )
//   ];
// }

// class ItemList extends StatelessWidget {
//
//   // final List list;
//   // // ignore: use_key_in_widget_constructors
//   // const ItemList({required this.list});
//
//   var lokasi = [{
//     'kota' : 'Jakarta'
//   },
//   {
//     'kota' : 'Bandung'
//   }
//   ];
//   ItemList({Key? key, required this.lokasi}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: lokasi.length,
//       itemBuilder: (BuildContext context, int i){
//         debugPrint(lokasi.length.toString());
//         return ListTile(
//           title: Text('${lokasi[i]["kota"]}'),
//         );
//       },
//     );
//   }
// }
