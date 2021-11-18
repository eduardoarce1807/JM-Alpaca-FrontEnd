import 'package:jm_alpaca/drawer/compra/globals.dart' as globals;
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DetalleCompra extends StatefulWidget {
  static String ruta = "/detalleCompra";

  @override
  State<StatefulWidget> createState() {
    return _DetalleCompra();
  }
}

class _DetalleCompra extends State<DetalleCompra> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int _selectedIndex = 0;

  List<String> listaProductosString = <String>[];

  List<DetalleCompraModel> listaDetalleCompra = <DetalleCompraModel>[];

  List<int> cantidades = <int>[];
  List<double> pesosKilos = <double>[];
  List<double> pesosLibras = <double>[];
  List<int> descuentos = <int>[];
  List<double> pesosNetos = <double>[];
  List<double> precios = <double>[];
  List<double> totales = <double>[];

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
        guardarDetallesCompra();
        Navigator.pushNamed(context, '/compra');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: InkWell(
            child: Text("Detalle de Compra"),
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Agregar Producto',
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
        listaDetalleCompra.length,
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

    for (int i = 0; i < listaDetalleCompra.length; i++) {
      print("lista detalle compra legth: ${listaDetalleCompra.length}");
      rows.add(Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].cantidadTotal}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].pesoKilosTotal}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].pesoLibrasTotal}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].descuentoTotal}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].pesoNetoTotal}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].precio}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: Text("${listaDetalleCompra[i].total}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.black12,
            margin: EdgeInsets.all(4.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontWeight: FontWeight.bold)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () {
                  _showMyDialog(listaDetalleCompra[i], listaProductosString[i]);
                  print("Registrar Precio");
                  print("tapped: ${listaDetalleCompra[i].id}");
                },
                child: Icon(Icons.attach_money)),
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
          child: Text("$totalCantidades"),
        ),
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
          child: Text("$totalDescuentos"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("$totalPesosNetos"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("Precio"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("$totalTotales"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.black12,
          margin: EdgeInsets.all(4.0),
          child: Text("Opción"),
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
      child: Text("Cantidad", style: Theme.of(context).textTheme.headline6),
    ));

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
      child: Text("Descuento", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Peso Neto", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Precio", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Subtotal", style: Theme.of(context).textTheme.headline6),
    ));

    a.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.black12,
      margin: EdgeInsets.all(4.0),
      child: Text("Opción", style: Theme.of(context).textTheme.headline6),
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

  Future guardarDetallesCompra() async {
    //actualizar a true el campo "saved"
    for (int i = 0; i < listaDetalleCompra.length; i++) {
      listaDetalleCompra[i].saved = true;
      DetalleCompraProvider dcp = DetalleCompraProvider();
      DetalleCompraResponseUpdate dcru =
          await dcp.updateDetalleCompra(listaDetalleCompra[i]);
      print(dcru.detalleCompra.id);
    }

    //actualizar compra total del proveedor actual
    CompraTotalProvider ctp = CompraTotalProvider();
    CompraTotalResponsePorProveedor ctrpp = await ctp
        .obtenerComprasTotalesPorProveedorId(globals.proveedorActualId);

    CompraTotalModel compraTotal = CompraTotalModel.fromValues(
        ctrpp.compraTotal.id,
        ctrpp.compraTotal.proveedorId,
        ctrpp.compraTotal.total,
        ctrpp.compraTotal.fecha);

    compraTotal.total = compraTotal.total + totalTotales;

    CompraTotalResponseUpdate ctru = await ctp.updateCompraTotal(compraTotal);
    print(ctru.compraTotal.id);
  }

  Future obtenerDetallesCompra() async {
    List<DetalleCompraModel> detalleCompraListAux = <DetalleCompraModel>[];

    List<String> productosStringAux = <String>[];

    List<int> cantidadesX = <int>[];
    List<double> pesosKilosX = <double>[];
    List<double> pesosLibrasX = <double>[];
    List<int> descuentosX = <int>[];
    List<double> pesosNetosX = <double>[];
    List<double> preciosX = <double>[];
    List<double> totalesX = <double>[];

    ProductoProvider prp = ProductoProvider();

    DetalleCompraProvider dcp = DetalleCompraProvider();

    DetalleCompraResponse dcr = await dcp
        .obtenerDetallesCompraPorProveedorId(globals.proveedorActualId);

    for (int i = 0; i < dcr.detalleCompraList.length; i++) {
      detalleCompraListAux.add(dcr.detalleCompraList[i]);

      cantidadesX.add(dcr.detalleCompraList[i].cantidadTotal);
      pesosKilosX.add(dcr.detalleCompraList[i].pesoKilosTotal);
      pesosLibrasX.add(dcr.detalleCompraList[i].pesoLibrasTotal);
      descuentosX.add(dcr.detalleCompraList[i].descuentoTotal);
      pesosNetosX.add(dcr.detalleCompraList[i].pesoNetoTotal);
      preciosX.add(dcr.detalleCompraList[i].precio);
      totalesX.add(dcr.detalleCompraList[i].total);

      SingleProductoResponse spr =
          await prp.obtenerProductoPorId(dcr.detalleCompraList[i].productoId);
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
      totalPrecios =
          double.parse((preciosX.reduce((a, b) => a + b)).toStringAsFixed(2));
      totalTotales =
          double.parse((totalesX.reduce((a, b) => a + b)).toStringAsFixed(2));

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
