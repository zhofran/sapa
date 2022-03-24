import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  const Data({ Key? key }) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, i){
            return DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Password')),
                DataColumn(label: Text('Nama Pegawai')),
              ], 
              rows: <DataRow>[
                DataRow(cells: [
                  DataCell(Text('data')),
                  DataCell(Text('data')),
                  DataCell(Text('data')),
                ])
              ]
            );
          }
        ),
      ),
    );
  }
}
// class ItemList extends StatelessWidget {
  
//   // final List list;
//   // // ignore: use_key_in_widget_constructors
//   // const ItemList({required this.list});
  
//   var lokasi = [{
//     'kota' : 'Jakarta'
//   },
//   {
//     'kota' : 'Bandung'
//   }
//   ];

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