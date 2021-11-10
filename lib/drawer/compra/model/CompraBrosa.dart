// ignore_for_file: unnecessary_this

import 'dart:convert';

//Responses

class ProductoResponse {
  List<ProductoModel> productoList = <ProductoModel>[];

  ProductoResponse.fromAPI(Map jsonProductoResponse) {
    for (int i = 0; i < jsonProductoResponse["productoList"].length; i++) {
      ProductoModel pm = ProductoModel(jsonProductoResponse["productoList"][i]);
      this.productoList.add(pm);
    }
  }
}

class ProveedorResponse {
  List<ProveedorModel> proveedorList = <ProveedorModel>[];

  ProveedorResponse.fromAPI(Map jsonProductoResponse) {
    for (int i = 0; i < jsonProductoResponse["proveedorList"].length; i++) {
      ProveedorModel prov =
          ProveedorModel(jsonProductoResponse["proveedorList"][i]);
      this.proveedorList.add(prov);
    }
  }
}

class PersonaResponse {
  List<PersonaModel> personaList = <PersonaModel>[];

  PersonaResponse.fromAPI(Map jsonPersonaResponse) {
    PersonaModel pers = PersonaModel(jsonPersonaResponse["persona"]);
    this.personaList.add(pers);
  }
}

class SedeResponse {
  List<SedeModel> sedeList = <SedeModel>[];

  SedeResponse.fromAPI(Map jsonSedeResponse) {
    SedeModel sede = SedeModel(jsonSedeResponse["sede"]);
    this.sedeList.add(sede);
  }
}

class TipoDescuentoResponse {
  List<TipoDescuentoModel> tipoDescuentoList = <TipoDescuentoModel>[];

  TipoDescuentoResponse.fromAPI(Map jsonTipoDescuentoResponse) {
    for (int i = 0;
        i < jsonTipoDescuentoResponse["tipoDescuentoList"].length;
        i++) {
      TipoDescuentoModel tipoDescuento =
          TipoDescuentoModel(jsonTipoDescuentoResponse["tipoDescuentoList"][i]);
      this.tipoDescuentoList.add(tipoDescuento);
    }
  }
}

class CompraResponse {
  CompraModel compra = CompraModel.fromValues("", "", "", "", "", 0, 0, 0, 0);
  CompraResponse.fromAPI(Map jsonCompraResponse) {
    CompraModel cm = CompraModel(jsonCompraResponse["savedCompra"]);
    compra = cm;
  }
}

//Models

class ProductoModel {
  String id = "";
  String nombre = "";

  ProductoModel(Map jsonProductoResponse) {
    this.id = jsonProductoResponse["_id"];
    this.nombre = jsonProductoResponse["nombre"];
  }

  ProductoModel.fromValues(String nombre) {
    this.id = "";
    this.nombre = nombre;
  }
}

class ProveedorModel {
  String id = "";
  String personaId = "";
  String sedeId = "";

  ProveedorModel(Map jsonProveedorResponse) {
    this.id = jsonProveedorResponse["_id"];
    this.personaId = jsonProveedorResponse["personaId"];
    this.sedeId = jsonProveedorResponse["sedeId"];
  }

  ProveedorModel.fromValues(String personaId, String sedeId) {
    this.id = "";
    this.personaId = personaId;
    this.sedeId = sedeId;
  }
}

class PersonaModel {
  String id = "";
  String nombres = "";
  String apellidos = "";
  String email = "";
  String dni = "";

  PersonaModel(Map jsonPersonaResponse) {
    this.id = jsonPersonaResponse["_id"];
    this.nombres = jsonPersonaResponse["nombres"];
    this.apellidos = jsonPersonaResponse["apellidos"];
    this.email = jsonPersonaResponse["email"];
    this.dni = jsonPersonaResponse["dni"];
  }

  PersonaModel.fromValues(
      String nombres, String apellidos, String email, String dni) {
    this.id = "";
    this.nombres = nombres;
    this.apellidos = apellidos;
    this.email = email;
    this.dni = dni;
  }
}

class SedeModel {
  String id = "";
  String nombre = "";

  SedeModel(Map jsonSedeResponse) {
    this.id = jsonSedeResponse["_id"];
    this.nombre = jsonSedeResponse["nombre"];
  }

  SedeModel.fromValues(
    String nombre,
  ) {
    this.id = "";
    this.nombre = nombre;
  }
}

class TipoDescuentoModel {
  String id = "";
  String nombre = "";

  TipoDescuentoModel(Map jsonTipoDescuentoResponse) {
    this.id = jsonTipoDescuentoResponse["_id"];
    this.nombre = jsonTipoDescuentoResponse["nombre"];
  }

  TipoDescuentoModel.fromValues(
    String nombre,
  ) {
    this.id = "";
    this.nombre = nombre;
  }
}

class CompraModel {
  String id = "";
  String proveedorId = "";
  String fecha = "";
  String unidadDeMasa = "";
  String productoId = "";
  String tipoDescuentoId = "";
  int cantidad = 0;
  double pesoKilos = 0;
  double pesoLibras = 0;
  int descuento = 0;

  CompraModel(Map jsonCompraResponse) {
    this.id = jsonCompraResponse["_id"];
    this.proveedorId = jsonCompraResponse["proveedorId"];
    this.fecha = jsonCompraResponse["fecha"];
    this.unidadDeMasa = jsonCompraResponse["unidadDeMasa"];
    this.productoId = jsonCompraResponse["productoId"];
    this.tipoDescuentoId = jsonCompraResponse["tipoDescuentoId"];
    this.cantidad = jsonCompraResponse["cantidad"];
    //Comprobar si la respuesta vuelve como double o int
    if (jsonCompraResponse["pesoKilos"].runtimeType == double) {
      this.pesoKilos = jsonCompraResponse["pesoKilos"];
    } else if (jsonCompraResponse["pesoKilos"].runtimeType == int) {
      int aux = jsonCompraResponse["pesoKilos"];
      this.pesoKilos = aux.toDouble();
    }
    if (jsonCompraResponse["pesoLibras"].runtimeType == double) {
      this.pesoLibras = jsonCompraResponse["pesoLibras"];
    } else if (jsonCompraResponse["pesoLibras"].runtimeType == int) {
      int aux = jsonCompraResponse["pesoLibras"];
      this.pesoLibras = aux.toDouble();
    }
    this.descuento = jsonCompraResponse["descuento"];
  }

  CompraModel.fromValues(
      String proveedorId,
      String fecha,
      String unidadDeMasa,
      String productoId,
      String tipoDescuentoId,
      int cantidad,
      double pesoKilos,
      double pesoLibras,
      int descuento) {
    this.id = "";
    this.proveedorId = proveedorId;
    this.fecha = fecha;
    this.unidadDeMasa = unidadDeMasa;
    this.productoId = productoId;
    this.tipoDescuentoId = tipoDescuentoId;
    this.cantidad = cantidad;
    this.pesoKilos = pesoKilos;
    this.pesoLibras = pesoLibras;
    this.descuento = descuento;
  }
}
