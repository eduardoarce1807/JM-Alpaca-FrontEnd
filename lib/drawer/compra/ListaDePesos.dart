import 'package:jm_alpaca/drawer/CommonDrawer.dart';
import 'package:jm_alpaca/drawer/compra/globals.dart' as globals;
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';
import 'package:flutter/material.dart';

class ListaDePesos extends StatefulWidget {
  static String ruta = "/listaDePesos";

  @override
  State<StatefulWidget> createState() {
    return _ListaDePesos();
  }
}

class _ListaDePesos extends State<ListaDePesos> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> listaProductosString = <String>[];
  List<PesosPorProviderModel> listaCompras = <PesosPorProviderModel>[];

  @override
  void initState() {
    super.initState();
    obtenerPesos();
    print("a.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Pesos"),
        ),
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
              )
            ],
          ),
        ));
  }

  //Productos
  List<Widget> buildCellsFija() {
    List<Widget> a = <Widget>[];

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Producto", style: Theme.of(context).textTheme.headline6),
    ));

    var b = List.generate(
        listaCompras.length,
        (index) => Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.black12,
              margin: EdgeInsets.all(4.0),
              child: Text(listaProductosString[index]),
            ));

    for (int i = 0; i < b.length; i++) {
      a.add(b[i]);
    }

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Producto", style: Theme.of(context).textTheme.headline6),
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

    for (int i = 0; i < listaCompras.length; i++) {
      rows.add(Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaCompras[i].pesoKilos}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaCompras[i].cantidad}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaCompras[i].descuento}"),
          )
        ],
      ));
    }

    rows.add(Row(
      children: top,
    ));

    return rows;
  }

  List<Widget> buildCellsFlexibleTop() {
    List<Widget> a = <Widget>[];

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Peso", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Cantidad", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Descuento", style: Theme.of(context).textTheme.headline6),
    ));

    return a;
  }

  Future obtenerPesos() async {
    List<PesosPorProviderModel> pesosAux = <PesosPorProviderModel>[];
    List<String> productosStringAux = <String>[];

    PesoProvider pp = PesoProvider();
    ProductoProvider prp = ProductoProvider();

    PesosPorProviderResponse pr =
        await pp.pesosPorProvider(globals.proveedorActualId);

    for (int i = 0; i < pr.pesosPorProviderResponseList.length; i++) {
      pesosAux.add(pr.pesosPorProviderResponseList[i]);
      SingleProductoResponse spr = await prp
          .obtenerProductoPorId(pr.pesosPorProviderResponseList[i].productoId);
      productosStringAux.add(spr.producto.nombre);
    }

    setState(() {
      listaCompras = pesosAux;
      listaProductosString = productosStringAux;
    });
  }
}
