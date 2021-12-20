import 'package:jm_alpaca/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';
import 'globals.dart' as globals;

class CompraBrosaDrawer extends StatefulWidget {
  static String ruta = "/compra";

  @override
  State<StatefulWidget> createState() {
    return _CompraBrosaDrawer();
  }
}

class _CompraBrosaDrawer extends State<CompraBrosaDrawer> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<CompraTotalModel> comprasTotales = <CompraTotalModel>[];
  List<String> listaProveedoresString = <String>[];
  List<String> listaProveedores = <String>[];
  List<String> listaProveedoresId = <String>[];

  double totalCompras = 0;

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    obtenerComprasTotales();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/compra2');
      } else if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: InkWell(
            child: Text("CompraBrosa"),
            onTap: () {
              obtenerComprasTotales();
            },
          ),
        ),
        drawer: CommonDrawer.obtenerDrawer(context),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //Numero de filas en vertical (fijas)
                children: buildCellsFija(),
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //Numero de filas en vertical (las otras xd)
                    children: todo(),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Nueva Compra',
              backgroundColor: Color.fromRGBO(49, 39, 79, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green,
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromRGBO(49, 39, 79, 1),
          onTap: _onItemTapped,
        ));
  }

  List<Widget> buildCellsFija() {
    List<Widget> a = <Widget>[];

    a.add(Container(
      alignment: Alignment.center,
      width: 160.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Proveedor",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    var b = List.generate(
        comprasTotales.length,
        (index) => Container(
              alignment: Alignment.center,
              width: 160.0,
              height: 60.0,
              color: Color.fromRGBO(85, 67, 137, 1),
              margin: EdgeInsets.all(1.0),
              child: Text(listaProveedores[index],
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ));

    for (int i = 0; i < b.length; i++) {
      a.add(b[i]);
    }

    a.add(Container(
      alignment: Alignment.center,
      width: 160.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Total Compras",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));
    return a;
  }

  List<Widget> todo() {
    List<Widget> rows = <Widget>[];
    List<Widget> top = <Widget>[];

    top = buildCellsFlexibleTop();

    rows.add(Row(
      children: top,
    ));

    for (int i = 0; i < comprasTotales.length; i++) {
      print("lista compras total length: ${comprasTotales.length}");
      rows.add(Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 150.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text(
                "${double.parse((comprasTotales[i].total).toStringAsFixed(2))}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 150.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text((comprasTotales[i].fecha).substring(0, 10)),
          ),
          Container(
            alignment: Alignment.center,
            width: 150.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontWeight: FontWeight.bold)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () {
                  globals.proveedorActualId = listaProveedoresId[i];
                  Navigator.pushNamed(context, '/detalleProveedor');
                },
                child: Icon(Icons.list_alt)),
          ),
        ],
      ));
    }

    //totales
    rows.add(Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 150.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("${double.parse((totalCompras).toStringAsFixed(2))}",
              style: Theme.of(context).textTheme.headline6),
        ),
        Container(
          alignment: Alignment.center,
          width: 150.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("Fecha", style: Theme.of(context).textTheme.headline6),
        ),
        Container(
          alignment: Alignment.center,
          width: 150.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("Detalle", style: Theme.of(context).textTheme.headline6),
        ),
      ],
    ));

    return rows;
  }

  List<Widget> buildCellsFlexibleTop() {
    List<Widget> a = <Widget>[];

    a.add(Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Total (S/.)",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Fecha",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Detalle",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    return a;
  }

  Future obtenerComprasTotales() async {
    List<CompraTotalModel> comprasTotalesX = <CompraTotalModel>[];

    CompraTotalProvider ctp = CompraTotalProvider();
    CompraTotalResponse ctr = await ctp.obtenerComprasTotales();

    for (int i = 0; i < ctr.compraTotalList.length; i++) {
      comprasTotalesX.add(ctr.compraTotalList[i]);
    }

    //

    List<String> listaProveedoresM = <String>[];
    List<String> listaProveedoresIDX = <String>[];

    ProveedorProvider pp = ProveedorProvider();
    ProveedorResponse pr = await pp.obtenerProveedores();

    for (int i = 0; i < pr.proveedorList.length; i++) {
      PersonaProvider persp = PersonaProvider();
      PersonaResponse persr =
          await persp.obtenerPersonaPorId(pr.proveedorList[i].personaId);

      SedeProvider sp = SedeProvider();
      SedeResponse sr = await sp.obtenerSedePorId(pr.proveedorList[i].sedeId);

      listaProveedoresM.add(persr.personaList[0].nombres +
          " " +
          persr.personaList[0].apellidos +
          " | " +
          sr.sedeList[0].nombre);
      listaProveedoresIDX.add(pr.proveedorList[i].id);
    }
    setState(() {
      comprasTotales = comprasTotalesX;
      listaProveedoresId = listaProveedoresIDX;
      listaProveedores = listaProveedoresM;
      totalCompras = 0;
      for (int i = 0; i < comprasTotales.length; i++) {
        totalCompras = totalCompras + comprasTotales[i].total;
      }
    });
  }
}
