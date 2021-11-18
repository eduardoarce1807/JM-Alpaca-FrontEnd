import 'package:jm_alpaca/drawer/compra/globals.dart' as globals;
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ListaDePesos extends StatefulWidget {
  static String ruta = "/listaDePesos";

  @override
  State<StatefulWidget> createState() {
    return _ListaDePesos();
  }
}

class _ListaDePesos extends State<ListaDePesos> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int _selectedIndex = 0;

  List<String> listaProductosId = <String>[];
  List<String> listaProductosIdX = <String>[];

  List<String> listaProductosString = <String>[];
  List<CompraModel> listaComprasModel = <CompraModel>[];
  List<PesosPorProviderModel> listaCompras = <PesosPorProviderModel>[];

  List<double> pesosKilos = <double>[];
  List<double> pesosLibras = <double>[];
  List<int> cantidades = <int>[];
  List<int> descuentos = <int>[];

  double totalPesosKilos = 0;
  double totalPesosLibras = 0;
  int totalCantidades = 0;
  int totalDescuentos = 0;

  @override
  void initState() {
    super.initState();
    obtenerPesos();
    print("a.");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/compra2');
      } else if (_selectedIndex == 1) {
        for (int i = 0; i < listaComprasModel.length; i++) {
          listaComprasModel[i].saved = true;
          guardarPesos(listaComprasModel[i]);
        }
        //sleep(Duration(seconds: 4));

        Navigator.pushNamed(context, '/detalleCompra');
        guardarTotales();
      }
    });
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Agregar Peso',
              backgroundColor: Color.fromRGBO(49, 39, 79, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: 'Guardar',
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
      child: Text("Total", style: Theme.of(context).textTheme.headline6),
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
            child: Text("${listaCompras[i].pesoLibras}"),
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

    //totales
    rows.add(Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("$totalPesosKilos"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("$totalPesosLibras"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("$totalCantidades"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("$totalDescuentos"),
        )
      ],
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
      child: Text("Peso Kilos", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Peso Libras", style: Theme.of(context).textTheme.headline6),
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

    List<double> pesosKilosX = <double>[];
    List<double> pesosLibrasX = <double>[];
    List<int> cantidadesX = <int>[];
    List<int> descuentosX = <int>[];

    List<CompraModel> listaComprasModelX = <CompraModel>[];

    PesoProvider pp = PesoProvider();
    ProductoProvider prp = ProductoProvider();

    PesosPorProviderResponse pr =
        await pp.pesosPorProvider(globals.proveedorActualId);

    for (int i = 0; i < pr.pesosPorProviderResponseList.length; i++) {
      pesosAux.add(pr.pesosPorProviderResponseList[i]);

      CompraModel auxCompra = CompraModel.fromValues(
          pr.pesosPorProviderResponseList[i].id,
          pr.pesosPorProviderResponseList[i].proveedorId,
          pr.pesosPorProviderResponseList[i].fecha,
          pr.pesosPorProviderResponseList[i].unidadDeMasa,
          pr.pesosPorProviderResponseList[i].productoId,
          pr.pesosPorProviderResponseList[i].tipoDescuentoId,
          pr.pesosPorProviderResponseList[i].cantidad,
          pr.pesosPorProviderResponseList[i].pesoKilos,
          pr.pesosPorProviderResponseList[i].pesoLibras,
          pr.pesosPorProviderResponseList[i].pesoNeto,
          pr.pesosPorProviderResponseList[i].descuento,
          pr.pesosPorProviderResponseList[i].saved);

      listaComprasModelX.add(auxCompra);

      pesosKilosX.add(pr.pesosPorProviderResponseList[i].pesoKilos);
      pesosLibrasX.add(pr.pesosPorProviderResponseList[i].pesoLibras);
      cantidadesX.add(pr.pesosPorProviderResponseList[i].cantidad);
      descuentosX.add(pr.pesosPorProviderResponseList[i].descuento);

      SingleProductoResponse spr = await prp
          .obtenerProductoPorId(pr.pesosPorProviderResponseList[i].productoId);
      productosStringAux.add(spr.producto.nombre);
    }

    setState(() {
      listaCompras = pesosAux;
      listaComprasModel = listaComprasModelX;
      totalPesosKilos = double.parse(
          (pesosKilosX.reduce((a, b) => a + b)).toStringAsFixed(2));
      totalPesosLibras = double.parse(
          (pesosLibrasX.reduce((a, b) => a + b)).toStringAsFixed(2));
      totalCantidades = cantidadesX.reduce((a, b) => a + b);
      totalDescuentos = descuentosX.reduce((a, b) => a + b);
      listaProductosString = productosStringAux;
    });
  }

  void guardarPesos(CompraModel compra) async {
    CompraProvider cp = CompraProvider();
    CompraResponseUpdate cr = await cp.updateCompra(compra);

    print("Updated: ${cr.compra.id}");
  }

  void guardarTotales() async {
    //guardar todos los productosID
    for (int i = 0; i < listaCompras.length; i++) {
      listaProductosIdX.add(listaCompras[i].productoId);
    }

    //remover productos duplicados
    listaProductosId = listaProductosIdX.toSet().toList();

    for (int i = 0; i < listaProductosId.length; i++) {
      print("Lista productos length: ${listaProductosId.length}");
      int cantidadTotal = 0;
      double pesoKilosTotal = 0;
      double pesoLibrasTotal = 0;
      double pesoNetoTotal = 0;
      int descuentoTotal = 0;
      String fecha = "";
      for (int j = 0; j < listaCompras.length; j++) {
        if (listaCompras[j].productoId == listaProductosId[i]) {
          cantidadTotal = cantidadTotal + listaCompras[j].cantidad;
          pesoKilosTotal = pesoKilosTotal + listaCompras[j].pesoKilos;
          pesoLibrasTotal = pesoLibrasTotal + listaCompras[j].pesoLibras;
          pesoNetoTotal = pesoNetoTotal + listaCompras[j].pesoNeto;
          descuentoTotal = descuentoTotal + listaCompras[j].descuento;
          fecha = listaCompras[j].fecha;
        }
      }
      DetalleCompraModel newDetalleCompra = DetalleCompraModel.fromValues(
          "",
          listaProductosId[i],
          globals.proveedorActualId,
          cantidadTotal,
          double.parse((pesoKilosTotal).toStringAsFixed(2)),
          double.parse((pesoLibrasTotal).toStringAsFixed(2)),
          double.parse((pesoLibrasTotal - descuentoTotal).toStringAsFixed(2)),
          descuentoTotal,
          //precio
          0,
          //total
          0,
          fecha,
          false);
      DetalleCompraProvider dcp = DetalleCompraProvider();
      DetalleCompraResponseCreate dcr =
          await dcp.crearDetalleCompra(newDetalleCompra);
      print("Crear Detalle Compra ID: ${dcr.detalleCompra.id}");
    }
  }
}
