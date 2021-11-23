import 'package:jm_alpaca/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';

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
      width: 150.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Proveedor", style: Theme.of(context).textTheme.headline6),
    ));

    var b = List.generate(
        comprasTotales.length,
        (index) => Container(
              alignment: Alignment.center,
              width: 150.0,
              height: 60.0,
              color: Colors.black12,
              margin: EdgeInsets.all(4.0),
              child: Text(listaProveedores[index]),
            ));

    for (int i = 0; i < b.length; i++) {
      a.add(b[i]);
    }

    a.add(Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child:
          Text("Total Compras", style: Theme.of(context).textTheme.headline6),
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
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text(
                "${double.parse((comprasTotales[i].total).toStringAsFixed(2))}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 150.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text((comprasTotales[i].fecha).substring(0, 10)),
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
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("${double.parse((totalCompras).toStringAsFixed(2))}",
              style: Theme.of(context).textTheme.headline6),
        ),
        Container(
          alignment: Alignment.center,
          width: 150.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("Fecha", style: Theme.of(context).textTheme.headline6),
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
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Total (S/.)", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Fecha", style: Theme.of(context).textTheme.headline6),
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
    }
    setState(() {
      comprasTotales = comprasTotalesX;
      listaProveedores = listaProveedoresM;
      totalCompras = 0;
      for (int i = 0; i < comprasTotales.length; i++) {
        totalCompras = totalCompras + comprasTotales[i].total;
      }
    });
  }
}
