import 'package:jm_alpaca/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';

class CompraBrosaDrawer extends StatefulWidget {
  static String ruta = "/compra";

  @override
  State<StatefulWidget> createState() {
    return _CompraBrosaDrawer();
  }
}

class _CompraBrosaDrawer extends State<CompraBrosaDrawer> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> listCompraBrosa = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Compra Brosa"),
        ),
        drawer: CommonDrawer.obtenerDrawer(context),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.bold)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () {
                  print("Nueva Compra");
                  Navigator.pushNamed(context, '/compra2');
                },
                child: Text("Nueva Compra")
              ),
              SizedBox(height: 20,),
              DataTable(
                
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Proveedor',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Fecha',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Opción',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Opción',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),
                      DataCell(Text('19')),
                      DataCell(Text('Student')),
                      DataCell(Text('Student')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Janine')),
                      DataCell(Text('43')),
                      DataCell(Text('Professor')),
                      DataCell(Text('Student')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('27')),
                      DataCell(Text('Associate Professor')),
                      DataCell(Text('Student')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('27')),
                      DataCell(Text('Associate Professor')),
                      DataCell(Text('Student')),
                      DataCell(Text('Student')),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
