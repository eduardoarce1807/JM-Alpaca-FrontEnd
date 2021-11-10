// ignore_for_file: unnecessary_this

import 'dart:convert';

//Responses

class ProductoResponse {
  List<ProductoModel> productoList = <ProductoModel>[];

  ProductoResponse.fromAPI(Map jsonProductoResponse) {
    for (int i = 0; i < jsonProductoResponse["productoList"].length; i++) {
      ProductoModel cm = ProductoModel(jsonProductoResponse["productoList"][i]);
      this.productoList.add(cm);
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
