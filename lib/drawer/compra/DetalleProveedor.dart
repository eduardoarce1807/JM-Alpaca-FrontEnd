import 'package:jm_alpaca/drawer/compra/globals.dart' as globals;
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DetalleProveedor extends StatefulWidget {
  static String ruta = "/detalleProveedor";

  @override
  State<StatefulWidget> createState() {
    return _DetalleProveedor();
  }
}

class _DetalleProveedor extends State<DetalleProveedor> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int _selectedIndex = 0;

  List<String> listaProductosString = <String>[];

  List<CompraModel> listaDetalleCompra = <CompraModel>[];

  List<int> cantidades = <int>[];
  List<double> pesosKilos = <double>[];
  List<double> pesosLibras = <double>[];
  List<int> descuentos = <int>[];
  List<double> pesosNetos = <double>[];
  List<double> precios = <double>[];
  List<double> totales = <double>[];
  List<String> fechas = <String>[];

  int totalCantidades = 0;
  double totalPesosKilos = 0;
  double totalPesosLibras = 0;
  int totalDescuentos = 0;
  double totalPesosNetos = 0;
  double totalPrecios = 0;
  double totalTotales = 0;

  double precio = 0;

  @override
  void initState() {
    super.initState();
    obtenerDetallesCompra();
    print("proveedor actual: ${globals.proveedorActualId}");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/compra2');
      } else if (_selectedIndex == 1) {
        //guardarDetallesCompra();
        Navigator.pushNamed(context, '/compra');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text("Detalle Proveedor"),
          onTap: () {
            obtenerDetallesCompra();
          },
        ),
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
    );
  }

  //Productos
  List<Widget> buildCellsFija() {
    List<Widget> a = <Widget>[];

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Producto",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    var b = List.generate(
        listaDetalleCompra.length,
        (index) => Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Color.fromRGBO(85, 67, 137, 1),
              margin: EdgeInsets.all(1.0),
              child: Text(
                listaProductosString[index],
                style: TextStyle(color: Colors.white),
              ),
            ));

    for (int i = 0; i < b.length; i++) {
      a.add(b[i]);
    }

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Total",
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

    for (int i = 0; i < listaDetalleCompra.length; i++) {
      print("lista detalle compra legth: ${listaDetalleCompra.length}");
      rows.add(Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text("${listaDetalleCompra[i].cantidad}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text("${listaDetalleCompra[i].pesoKilos}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text("${listaDetalleCompra[i].pesoLibras}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text("${listaDetalleCompra[i].descuento}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text("${listaDetalleCompra[i].pesoNeto}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Color.fromRGBO(225, 221, 238, 1),
            margin: EdgeInsets.all(1.0),
            child: Text((listaDetalleCompra[i].fecha).substring(0, 10)),
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
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("$totalCantidades",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("$totalPesosKilos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("$totalPesosLibras",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("$totalDescuentos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Color.fromRGBO(203, 187, 238, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("$totalPesosNetos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Color.fromRGBO(64, 51, 102, 1),
          margin: EdgeInsets.all(1.0),
          child: Text("Fecha",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
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
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Cantidad",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Peso Kilos",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Peso Libras",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Descuento",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Peso Neto",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Color.fromRGBO(64, 51, 102, 1),
      margin: EdgeInsets.all(1.0),
      child: Text("Fecha",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    ));

    return a;
  }

  Future guardarPrecio(DetalleCompraModel detalleCompra, double precio) async {
    detalleCompra.precio = double.parse((precio).toStringAsFixed(2));
    detalleCompra.total = double.parse(
        (detalleCompra.pesoNetoTotal * detalleCompra.precio)
            .toStringAsFixed(2));
    DetalleCompraProvider dcp = DetalleCompraProvider();
    DetalleCompraResponseUpdate dcru =
        await dcp.updateDetalleCompra(detalleCompra);
    obtenerDetallesCompra();
    print(dcru.detalleCompra.total);
  }

  Future obtenerDetallesCompra() async {
    List<CompraModel> detalleCompraListAux = <CompraModel>[];

    List<String> productosStringAux = <String>[];

    List<int> cantidadesX = <int>[];
    List<double> pesosKilosX = <double>[];
    List<double> pesosLibrasX = <double>[];
    List<int> descuentosX = <int>[];
    List<double> pesosNetosX = <double>[];

    List<String> fechasX = <String>[];

    List<double> preciosX = <double>[];
    List<double> totalesX = <double>[];

    ProductoProvider prp = ProductoProvider();

    DetalleCompraProvider dcp = DetalleCompraProvider();

    ComprasResponse dcr = await dcp
        .obtenerDetallesCompraPorProveedorIdTrue(globals.proveedorActualId);

    for (int i = 0; i < dcr.comprasList.length; i++) {
      detalleCompraListAux.add(dcr.comprasList[i]);

      cantidadesX.add(dcr.comprasList[i].cantidad);
      pesosKilosX.add(dcr.comprasList[i].pesoKilos);
      pesosLibrasX.add(dcr.comprasList[i].pesoLibras);
      descuentosX.add(dcr.comprasList[i].descuento);
      pesosNetosX.add(dcr.comprasList[i].pesoNeto);
      fechasX.add(dcr.comprasList[i].fecha);

      SingleProductoResponse spr =
          await prp.obtenerProductoPorId(dcr.comprasList[i].productoId);
      productosStringAux.add(spr.producto.nombre);
    }

    setState(() {
      listaDetalleCompra = detalleCompraListAux;

      print("listaDetalleCompra length: ${listaDetalleCompra.length}");

      totalCantidades = cantidadesX.reduce((a, b) => a + b);
      totalPesosKilos = double.parse(
          (pesosKilosX.reduce((a, b) => a + b)).toStringAsFixed(2));
      totalPesosLibras = double.parse(
          (pesosLibrasX.reduce((a, b) => a + b)).toStringAsFixed(2));
      totalDescuentos = descuentosX.reduce((a, b) => a + b);

      totalPesosNetos = double.parse(
          (pesosNetosX.reduce((a, b) => a + b)).toStringAsFixed(2));

      listaProductosString = productosStringAux;
    });
  }

  Future<void> _showMyDialog(
      DetalleCompraModel detalleCompra, String nombreProducto) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrar Precio de $nombreProducto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(49, 39, 79, 1), width: 2.0),
                      ),
                      labelText: 'Precio',
                      hintText: "Precio",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) {
                      precio = double.parse(value!);
                      print(precio);
                    },
                    onChanged: (text) {
                      precio = double.parse(text);
                      print(text);
                    })
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                guardarPrecio(detalleCompra, precio);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
