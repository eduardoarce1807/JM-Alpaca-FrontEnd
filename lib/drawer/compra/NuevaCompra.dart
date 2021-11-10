import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/provider/CompraBrosa.dart';
import 'package:flutter/material.dart';

class NuevaCompraDrawer extends StatefulWidget {
  static String ruta = "/compra2";

  @override
  State<StatefulWidget> createState() {
    return _NuevaCompraDrawer();
  }
}

class _NuevaCompraDrawer extends State<NuevaCompraDrawer> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String proveedor = "Seleccione un Proveedor";
  String unidadDeMasa = "Seleccione la Unidad de Masa";
  String fecha = "";
  String producto = "Seleccione el Producto";
  String tipoDescuento = "Seleccione el Tipo de Descuento";
  String fechaLabel = "";

  TextEditingController cDescuento = new TextEditingController();

  int cantidad = 0;
  int peso = 0;
  int descuento = 0;

  String date = "";

  DateTime selectedDate = DateTime.now();

  List<String> listaProveedoresId = <String>[];
  String proveedorId = "";
  List<String> listaProductosId = <String>[];
  String productoId = "";
  List<String> listaTipoDescuentoId = <String>[];
  String tipoDescuentoId = "";

  List<String> listaProductos = <String>[];
  List<String> listaProveedores = <String>[];
  List<String> listaTipoDescuento = <String>[];

  DateTime selectedDatee = DateTime.now();

  @override
  void initState() {
    super.initState();
    obtenerProductoList();
    obtenerProveedorList();
    obtenerTipoDescuentoList();
    print("Dropdowns cargados.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nueva Compra"),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    labelText: "Proveedor",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(49, 39, 79, 1),
                                          width: 2.0),
                                    ),
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                    child: getProveedor()),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    labelText: "Unidad de Masa",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(49, 39, 79, 1),
                                          width: 2.0),
                                    ),
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                    child: getUnidadDeMasa()),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    labelText: "Producto",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(49, 39, 79, 1),
                                          width: 2.0),
                                    ),
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                    child: getProducto()),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    labelText: "Tipo Descuento",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(49, 39, 79, 1),
                                          width: 2.0),
                                    ),
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                    child: getTipoDescuento()),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            getCantidad(),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(child: getPeso()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(child: getDescuento())
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(child: getFechaLabel()),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Container(
                                        height: 40,
                                        child: Center(
                                          child: getFecha(),
                                        ),
                                      ),
                                      fit: FlexFit.loose,
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 60,
                                padding: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  child: Text(
                                    "Guardar",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();

                                      for (int i = 0;
                                          i < listaProveedores.length;
                                          i++) {
                                        if (listaProveedores[i] == proveedor) {
                                          proveedorId = listaProveedoresId[i];
                                        }
                                      }
                                      for (int i = 0;
                                          i < listaProductos.length;
                                          i++) {
                                        if (listaProductos[i] == producto) {
                                          productoId = listaProductosId[i];
                                        }
                                      }
                                      for (int i = 0;
                                          i < listaTipoDescuento.length;
                                          i++) {
                                        if (listaTipoDescuento[i] ==
                                            tipoDescuento) {
                                          tipoDescuentoId =
                                              listaTipoDescuentoId[i];
                                        }
                                      }
                                      print("Proveedor: " + proveedor);
                                      print("ProveedorID: " +
                                          proveedorId +
                                          "\n ------");
                                      print("Unidad De Masa: " + unidadDeMasa);
                                      print("Producto: " + producto);
                                      print("ProductoID: " +
                                          productoId +
                                          "\n ------");
                                      print("Tipo de descuento: " +
                                          tipoDescuento);
                                      print("Tipo de descuento ID: " +
                                          tipoDescuentoId +
                                          "\n ------");
                                      print("Cantidad: $cantidad");
                                      print("Peso: $peso");
                                      print("Descuento: ${cDescuento.text}");
                                      print(
                                          "Fecha: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          )
        ])));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  //Widgets

  DropdownButton getProveedor() {
    return DropdownButton<String>(
        isExpanded: true,
        value: proveedor,
        icon: const Icon(TablerIcons.chevron_down),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        underline: Container(
          height: 2,
          color: Color.fromRGBO(49, 39, 79, 1),
        ),
        onChanged: (String? newValue) {
          setState(() {
            proveedor = newValue!;
          });
        },
        items: listaProveedores.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  DropdownButton getUnidadDeMasa() {
    return DropdownButton<String>(
        isExpanded: true,
        value: unidadDeMasa,
        icon: const Icon(TablerIcons.chevron_down),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        underline: Container(
          height: 2,
          color: Color.fromRGBO(49, 39, 79, 1),
        ),
        onChanged: (String? newValue) {
          setState(() {
            unidadDeMasa = newValue!;
          });
        },
        items: <String>['Seleccione la Unidad de Masa', 'Kilogramo', 'Libra']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  DropdownButton getProducto() {
    return DropdownButton<String>(
        isExpanded: true,
        value: producto,
        icon: const Icon(TablerIcons.chevron_down),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        underline: Container(
          height: 2,
          color: Color.fromRGBO(49, 39, 79, 1),
        ),
        onChanged: (String? newValue) {
          setState(() {
            producto = newValue!;
          });
        },
        items: listaProductos.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  TextFormField getFechaLabel() {
    return TextFormField(
      enabled: false,
      controller: TextEditingController(
          text:
              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(49, 39, 79, 1), width: 2.0),
        ),
        labelText: 'Fecha',
        hintText: "DD/MM/AAAA",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        fechaLabel = value!;
      },
    );
  }

  TextButton getFecha() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromRGBO(49, 39, 79, 1);
    }

    return TextButton.icon(
        icon: Icon(
          TablerIcons.calendar,
          color: Colors.white,
        ),
        label: Text("Elegir Fecha",
            style: TextStyle(fontSize: 14, color: Colors.white)),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(getColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(49, 39, 79, 1)),
        ),
        onPressed: () {
          _selectDate(context);
          print(selectedDate.day);
        });
  }

  DropdownButton getTipoDescuento() {
    return DropdownButton<String>(
        isExpanded: true,
        value: tipoDescuento,
        icon: const Icon(TablerIcons.chevron_down),
        iconSize: 20,
        elevation: 16,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        underline: Container(
          height: 2,
          color: Color.fromRGBO(49, 39, 79, 1),
        ),
        onChanged: (String? newValue) {
          setState(() {
            tipoDescuento = newValue!;
          });
        },
        items: listaTipoDescuento.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }

  TextFormField getCantidad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(49, 39, 79, 1), width: 2.0),
        ),
        labelText: 'Cantidad',
        hintText: "Cantidad",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        cantidad = int.parse(value!);
      },
      onChanged: (text) {
        print(text);
        if (text == "") {
          cDescuento.text = "0";
        } else {
          cDescuento.text = (int.parse(text) * 2).toString();
        }
      },
    );
  }

  TextFormField getPeso() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(49, 39, 79, 1), width: 2.0),
        ),
        labelText: 'Peso',
        hintText: "Peso",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        peso = int.parse(value!);
      },
    );
  }

  TextFormField getDescuento() {
    return TextFormField(
      enabled: false,
      controller: cDescuento,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(49, 39, 79, 1), width: 2.0),
        ),
        labelText: 'Descuento',
        hintText: "Descuento",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSaved: (value) {
        descuento = int.parse(value!);
      },
    );
  }

  //Futures

  Future obtenerProductoList() async {
    ProductoProvider pp = ProductoProvider();

    ProductoResponse pr = await pp.obtenerProductos();

    setState(() {
      listaProductos.add("Seleccione el Producto");
      listaProductosId.add("ID Null");
      for (int i = 0; i < pr.productoList.length; i++) {
        listaProductos.add(pr.productoList[i].nombre);
        listaProductosId.add(pr.productoList[i].id);
        print(listaProductosId[i]);
      }
    });
  }

  Future obtenerProveedorList() async {
    List<String> listaProveedoresM = <String>[];
    List<String> listaProveedoresIdM = <String>[];

    listaProveedoresM.add("Seleccione un Proveedor");
    listaProveedoresIdM.add("ID Null");

    ProveedorProvider pp = ProveedorProvider();
    ProveedorResponse pr = await pp.obtenerProveedores();

    for (int i = 0; i < pr.proveedorList.length; i++) {
      PersonaProvider persp = PersonaProvider();
      PersonaResponse persr =
          await persp.obtenerPersonaPorId(pr.proveedorList[i].personaId);

      SedeProvider sp = SedeProvider();
      SedeResponse sr = await sp.obtenerSedePorId(pr.proveedorList[i].sedeId);

      listaProveedoresIdM.add(persr.personaList[i].id);
      listaProveedoresM.add(persr.personaList[i].nombres +
          " " +
          persr.personaList[i].apellidos +
          " | " +
          sr.sedeList[i].nombre);
    }

    setState(() {
      listaProveedores = listaProveedoresM;
      listaProveedoresId = listaProveedoresIdM;
    });
  }

  Future obtenerTipoDescuentoList() async {
    TipoDescuentoProvider tdp = TipoDescuentoProvider();

    TipoDescuentoResponse tdr = await tdp.obtenerTipoDescuento();

    setState(() {
      listaTipoDescuento.add("Seleccione el Tipo de Descuento");
      listaTipoDescuentoId.add("ID Null");
      for (int i = 0; i < tdr.tipoDescuentoList.length; i++) {
        listaTipoDescuento.add(tdr.tipoDescuentoList[i].nombre);
        listaTipoDescuentoId.add(tdr.tipoDescuentoList[i].id);
      }
    });
  }
}
