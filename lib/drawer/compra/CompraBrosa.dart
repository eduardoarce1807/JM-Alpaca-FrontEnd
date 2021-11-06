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
