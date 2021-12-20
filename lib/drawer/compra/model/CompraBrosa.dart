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

class SingleProductoResponse {
  ProductoModel producto = ProductoModel.fromValues("");

  SingleProductoResponse.fromAPI(Map jsonProductoResponse) {
    ProductoModel pm = ProductoModel(jsonProductoResponse["producto"]);
    producto = pm;
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

class ComprasResponse {
  List<CompraModel> comprasList = <CompraModel>[];

  ComprasResponse.fromAPI(Map jsonCompraResponse) {
    for (int i = 0; i < jsonCompraResponse["comprasProveedorId"].length; i++) {
      CompraModel compra =
          CompraModel(jsonCompraResponse["comprasProveedorId"][i]);
      this.comprasList.add(compra);
    }
  }
}

class CompraResponse {
  CompraModel compra =
      CompraModel.fromValues("", "", "", "", "", "", 0, 0, 0, 0, 0, false);
  CompraResponse.fromAPI(Map jsonCompraResponse) {
    CompraModel cm = CompraModel(jsonCompraResponse["savedCompra"]);
    compra = cm;
  }
}

class CompraResponseUpdate {
  CompraModel compra =
      CompraModel.fromValues("", "", "", "", "", "", 0, 0, 0, 0, 0, false);
  CompraResponseUpdate.fromAPI(Map jsonCompraResponse) {
    CompraModel cm = CompraModel(jsonCompraResponse["updatedCompra"]);
    compra = cm;
  }
}

class PesosPorProviderResponse {
  List<PesosPorProviderModel> pesosPorProviderResponseList =
      <PesosPorProviderModel>[];

  PesosPorProviderResponse.fromAPI(Map jsonPesosPorProviderResponse) {
    for (int i = 0;
        i < jsonPesosPorProviderResponse["comprasProveedorId"].length;
        i++) {
      PesosPorProviderModel pesosPorProvider = PesosPorProviderModel(
          jsonPesosPorProviderResponse["comprasProveedorId"][i]);
      this.pesosPorProviderResponseList.add(pesosPorProvider);
    }
  }
}

class DetalleCompraResponseCreate {
  DetalleCompraModel detalleCompra =
      DetalleCompraModel.fromValues("", "", "", 0, 0, 0, 0, 0, 0, 0, "", false);
  DetalleCompraResponseCreate.fromAPI(Map jsonCompraResponse) {
    DetalleCompraModel dcm =
        DetalleCompraModel(jsonCompraResponse["savedDetalleCompra"]);
    detalleCompra = dcm;
  }
}

class DetalleCompraResponse {
  List<DetalleCompraModel> detalleCompraList = <DetalleCompraModel>[];

  DetalleCompraResponse.fromAPI(Map jsonDetalleCompraResponse) {
    for (int i = 0;
        i < jsonDetalleCompraResponse["comprasProveedorId"].length;
        i++) {
      DetalleCompraModel detalleCompra = DetalleCompraModel(
          jsonDetalleCompraResponse["comprasProveedorId"][i]);
      this.detalleCompraList.add(detalleCompra);
    }
  }
}

class DetalleCompraResponseUpdate {
  DetalleCompraModel detalleCompra =
      DetalleCompraModel.fromValues("", "", "", 0, 0, 0, 0, 0, 0, 0, "", false);
  DetalleCompraResponseUpdate.fromAPI(Map jsonDetalleCompraResponse) {
    DetalleCompraModel dcm =
        DetalleCompraModel(jsonDetalleCompraResponse["updatedDetalleCompra"]);
    detalleCompra = dcm;
  }
}

class CompraTotalResponse {
  List<CompraTotalModel> compraTotalList = <CompraTotalModel>[];

  CompraTotalResponse.fromAPI(Map jsonCompraTotalResponse) {
    for (int i = 0;
        i < jsonCompraTotalResponse["compraTotalList"].length;
        i++) {
      CompraTotalModel compraTotal =
          CompraTotalModel(jsonCompraTotalResponse["compraTotalList"][i]);
      this.compraTotalList.add(compraTotal);
    }
  }
}

class CompraTotalResponsePorProveedor {
  CompraTotalModel compraTotal = CompraTotalModel.fromValues("", "", 0, "");
  CompraTotalResponsePorProveedor.fromAPI(Map jsonCompraTotalResponse) {
    CompraTotalModel ctm =
        CompraTotalModel(jsonCompraTotalResponse["compraTotalsProveedorId"][0]);
    compraTotal = ctm;
  }
}

class CompraTotalResponseCreate {
  CompraTotalModel compraTotal = CompraTotalModel.fromValues("", "", 0, "");
  CompraTotalResponseCreate.fromAPI(Map jsonCompraTotalResponse) {
    CompraTotalModel ctm =
        CompraTotalModel(jsonCompraTotalResponse["savedCompraTotal"]);
    compraTotal = ctm;
  }
}

class CompraTotalResponseUpdate {
  CompraTotalModel compraTotal = CompraTotalModel.fromValues("", "", 0, "");
  CompraTotalResponseUpdate.fromAPI(Map jsonCompraTotalResponse) {
    CompraTotalModel ctm =
        CompraTotalModel(jsonCompraTotalResponse["updatedCompraTotal"]);
    compraTotal = ctm;
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
  double pesoNeto = 0;
  int descuento = 0;
  bool saved = false;

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
    if (jsonCompraResponse["pesoNeto"].runtimeType == double) {
      this.pesoNeto = jsonCompraResponse["pesoNeto"];
    } else if (jsonCompraResponse["pesoNeto"].runtimeType == int) {
      int aux = jsonCompraResponse["pesoNeto"];
      this.pesoNeto = aux.toDouble();
    }
    this.descuento = jsonCompraResponse["descuento"];
    this.saved = jsonCompraResponse["saved"];
  }

  CompraModel.fromValues(
      String id,
      String proveedorId,
      String fecha,
      String unidadDeMasa,
      String productoId,
      String tipoDescuentoId,
      int cantidad,
      double pesoKilos,
      double pesoLibras,
      double pesoNeto,
      int descuento,
      bool saved) {
    this.id = id;
    this.proveedorId = proveedorId;
    this.fecha = fecha;
    this.unidadDeMasa = unidadDeMasa;
    this.productoId = productoId;
    this.tipoDescuentoId = tipoDescuentoId;
    this.cantidad = cantidad;
    this.pesoKilos = pesoKilos;
    this.pesoLibras = pesoLibras;
    this.pesoNeto = pesoNeto;
    this.descuento = descuento;
    this.saved = saved;
  }
}

class PesosPorProviderModel {
  String id = "";
  String proveedorId = "";
  String fecha = "";
  String unidadDeMasa = "";
  String productoId = "";
  String tipoDescuentoId = "";
  int cantidad = 0;
  double pesoKilos = 0;
  double pesoLibras = 0;
  double pesoNeto = 0;
  int descuento = 0;
  bool saved = false;

  PesosPorProviderModel(Map jsonPesosPorProviderResponse) {
    this.id = jsonPesosPorProviderResponse["_id"];
    this.proveedorId = jsonPesosPorProviderResponse["proveedorId"];
    this.fecha = jsonPesosPorProviderResponse["fecha"];
    this.unidadDeMasa = jsonPesosPorProviderResponse["unidadDeMasa"];
    this.productoId = jsonPesosPorProviderResponse["productoId"];
    this.tipoDescuentoId = jsonPesosPorProviderResponse["tipoDescuentoId"];
    this.cantidad = jsonPesosPorProviderResponse["cantidad"];
    //Comprobar si la respuesta vuelve como double o int
    if (jsonPesosPorProviderResponse["pesoKilos"].runtimeType == double) {
      this.pesoKilos = jsonPesosPorProviderResponse["pesoKilos"];
    } else if (jsonPesosPorProviderResponse["pesoKilos"].runtimeType == int) {
      int aux = jsonPesosPorProviderResponse["pesoKilos"];
      this.pesoKilos = aux.toDouble();
    }
    if (jsonPesosPorProviderResponse["pesoLibras"].runtimeType == double) {
      this.pesoLibras = jsonPesosPorProviderResponse["pesoLibras"];
    } else if (jsonPesosPorProviderResponse["pesoLibras"].runtimeType == int) {
      int aux = jsonPesosPorProviderResponse["pesoLibras"];
      this.pesoLibras = aux.toDouble();
    }
    if (jsonPesosPorProviderResponse["pesoNeto"].runtimeType == double) {
      this.pesoNeto = jsonPesosPorProviderResponse["pesoNeto"];
    } else if (jsonPesosPorProviderResponse["pesoNeto"].runtimeType == int) {
      int aux = jsonPesosPorProviderResponse["pesoNeto"];
      this.pesoNeto = aux.toDouble();
    }
    this.descuento = jsonPesosPorProviderResponse["descuento"];
    this.saved = jsonPesosPorProviderResponse["saved"];
  }

  PesosPorProviderModel.fromValues(
      String proveedorId,
      String fecha,
      String unidadDeMasa,
      String productoId,
      String tipoDescuentoId,
      int cantidad,
      double pesoKilos,
      double pesoLibras,
      double pesoNeto,
      int descuento,
      bool saved) {
    this.id = "";
    this.proveedorId = proveedorId;
    this.fecha = fecha;
    this.unidadDeMasa = unidadDeMasa;
    this.productoId = productoId;
    this.tipoDescuentoId = tipoDescuentoId;
    this.cantidad = cantidad;
    this.pesoKilos = pesoKilos;
    this.pesoLibras = pesoLibras;
    this.pesoNeto = pesoNeto;
    this.descuento = descuento;
    this.saved = saved;
  }
}

class DetalleCompraModel {
  String id = "";
  String productoId = "";
  String proveedorId = "";
  int cantidadTotal = 0;
  double pesoKilosTotal = 0;
  double pesoLibrasTotal = 0;
  double pesoNetoTotal = 0;
  int descuentoTotal = 0;
  double precio = 0;
  double total = 0;
  String fecha = "";
  bool saved = false;

  DetalleCompraModel(Map jsonDetalleCompraResponse) {
    this.id = jsonDetalleCompraResponse["_id"];
    this.productoId = jsonDetalleCompraResponse["productoId"];
    this.proveedorId = jsonDetalleCompraResponse["proveedorId"];
    this.cantidadTotal = jsonDetalleCompraResponse["cantidadTotal"];
    if (jsonDetalleCompraResponse["pesoKilosTotal"].runtimeType == double) {
      this.pesoKilosTotal = jsonDetalleCompraResponse["pesoKilosTotal"];
    } else if (jsonDetalleCompraResponse["pesoKilosTotal"].runtimeType == int) {
      int aux = jsonDetalleCompraResponse["pesoKilosTotal"];
      this.pesoKilosTotal = aux.toDouble();
    }
    if (jsonDetalleCompraResponse["pesoLibrasTotal"].runtimeType == double) {
      this.pesoLibrasTotal = jsonDetalleCompraResponse["pesoLibrasTotal"];
    } else if (jsonDetalleCompraResponse["pesoLibrasTotal"].runtimeType ==
        int) {
      int aux = jsonDetalleCompraResponse["pesoLibrasTotal"];
      this.pesoLibrasTotal = aux.toDouble();
    }
    if (jsonDetalleCompraResponse["pesoNetoTotal"].runtimeType == double) {
      this.pesoNetoTotal = jsonDetalleCompraResponse["pesoNetoTotal"];
    } else if (jsonDetalleCompraResponse["pesoNetoTotal"].runtimeType == int) {
      int aux = jsonDetalleCompraResponse["pesoNetoTotal"];
      this.pesoNetoTotal = aux.toDouble();
    }
    this.descuentoTotal = jsonDetalleCompraResponse["descuentoTotal"];
    if (jsonDetalleCompraResponse["precio"].runtimeType == double) {
      this.precio = jsonDetalleCompraResponse["precio"];
    } else if (jsonDetalleCompraResponse["precio"].runtimeType == int) {
      int aux = jsonDetalleCompraResponse["precio"];
      this.precio = aux.toDouble();
    }
    if (jsonDetalleCompraResponse["total"].runtimeType == double) {
      this.total = jsonDetalleCompraResponse["total"];
    } else if (jsonDetalleCompraResponse["total"].runtimeType == int) {
      int aux = jsonDetalleCompraResponse["total"];
      this.total = aux.toDouble();
    }
    this.fecha = jsonDetalleCompraResponse["fecha"];
    this.saved = jsonDetalleCompraResponse["saved"];
  }

  DetalleCompraModel.fromValues(
      String id,
      String productoId,
      String proveedorId,
      int cantidadTotal,
      double pesoKilosTotal,
      double pesoLibrasTotal,
      double pesoNetoTotal,
      int descuentoTotal,
      double precio,
      double total,
      String fecha,
      bool saved) {
    this.id = id;
    this.productoId = productoId;
    this.proveedorId = proveedorId;
    this.cantidadTotal = cantidadTotal;
    this.pesoKilosTotal = pesoKilosTotal;
    this.pesoLibrasTotal = pesoLibrasTotal;
    this.pesoNetoTotal = pesoNetoTotal;
    this.descuentoTotal = descuentoTotal;
    this.precio = precio;
    this.total = total;
    this.fecha = fecha;
    this.saved = saved;
  }
}

class CompraTotalModel {
  String id = "";
  String proveedorId = "";
  double total = 0;
  String fecha = "";

  CompraTotalModel(Map jsonCompraTotalResponse) {
    this.id = jsonCompraTotalResponse["_id"];
    this.proveedorId = jsonCompraTotalResponse["proveedorId"];
    if (jsonCompraTotalResponse["total"].runtimeType == double) {
      this.total = jsonCompraTotalResponse["total"];
    } else if (jsonCompraTotalResponse["total"].runtimeType == int) {
      int aux = jsonCompraTotalResponse["total"];
      this.total = aux.toDouble();
    }
    this.fecha = jsonCompraTotalResponse["fecha"];
  }

  CompraTotalModel.fromValues(
      String id, String proveedorId, double total, String fecha) {
    this.id = id;
    this.proveedorId = proveedorId;
    this.total = total;
    this.fecha = fecha;
  }
}
