import 'dart:convert';

import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:http/http.dart' as http;

class ProductoProvider {
  Future<ProductoResponse> obtenerProductos() async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/producto/all");

    print("Dentro del provider (producto).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ProductoResponse productoResponse = ProductoResponse.fromAPI(jsonResponse);

    return productoResponse;
  }

  Future<SingleProductoResponse> obtenerProductoPorId(String productoId) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/producto/$productoId");

    print("Dentro del provider (producto single).");

    var responseHttp =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    SingleProductoResponse productoResponse =
        SingleProductoResponse.fromAPI(jsonResponse);

    return productoResponse;
  }
}

class ProveedorProvider {
  Future<ProveedorResponse> obtenerProveedores() async {
    var url =
        Uri.parse("https://floating-coast-42195.herokuapp.com/api/proveedor/all");

    print("Dentro del provider (proveedor).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ProveedorResponse proveedorResponse =
        ProveedorResponse.fromAPI(jsonResponse);

    return proveedorResponse;
  }
}

class PersonaProvider {
  Future<PersonaResponse> obtenerPersonaPorId(String id) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/persona/" + id);

    print("Dentro del provider (persona).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    PersonaResponse personaResponse = PersonaResponse.fromAPI(jsonResponse);

    return personaResponse;
  }
}

class SedeProvider {
  Future<SedeResponse> obtenerSedePorId(String id) async {
    var url =
        Uri.parse("https://floating-coast-42195.herokuapp.com/api/sede/" + id);

    print("Dentro del provider (sede).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    SedeResponse sedeResponse = SedeResponse.fromAPI(jsonResponse);

    return sedeResponse;
  }
}

class TipoDescuentoProvider {
  Future<TipoDescuentoResponse> obtenerTipoDescuento() async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/tipoDescuento/all");

    print("Dentro del provider (tipo descuento).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    TipoDescuentoResponse tipoDescuentoResponse =
        TipoDescuentoResponse.fromAPI(jsonResponse);

    return tipoDescuentoResponse;
  }
}

class CompraProvider {
  Future<CompraResponse> crearCompra(CompraModel compra) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compra/create");

    print("Dentro del provider (compra).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "proveedorId": compra.proveedorId,
          "fecha": compra.fecha,
          "unidadDeMasa": compra.unidadDeMasa,
          "productoId": compra.productoId,
          "tipoDescuentoId": compra.tipoDescuentoId,
          "cantidad": compra.cantidad,
          "pesoKilos": compra.pesoKilos,
          "pesoLibras": compra.pesoLibras,
          "pesoNeto": compra.pesoNeto,
          "descuento": compra.descuento,
          "saved": compra.saved
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraResponse compraResponse = CompraResponse.fromAPI(jsonResponse);

    return compraResponse;
  }

  Future<CompraResponseUpdate> updateCompra(CompraModel compra) async {
    var url =
        Uri.parse("https://floating-coast-42195.herokuapp.com/api/compra/edit");

    print("Dentro del provider (compra update).");

    var responseHttp = await http.put(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "_id": compra.id,
          "proveedorId": compra.proveedorId,
          "fecha": compra.fecha,
          "unidadDeMasa": compra.unidadDeMasa,
          "productoId": compra.productoId,
          "tipoDescuentoId": compra.tipoDescuentoId,
          "cantidad": compra.cantidad,
          "pesoKilos": compra.pesoKilos,
          "pesoLibras": compra.pesoLibras,
          "pesoNeto": compra.pesoNeto,
          "descuento": compra.descuento,
          "saved": compra.saved
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraResponseUpdate compraResponse =
        CompraResponseUpdate.fromAPI(jsonResponse);

    return compraResponse;
  }
}

class PesoProvider {
  Future<PesosPorProviderResponse> pesosPorProvider(String proveedorId) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compraProveedorId/$proveedorId");

    print("Dentro del provider (pesosPorProvider).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    PesosPorProviderResponse pesosPorProviderResponse =
        PesosPorProviderResponse.fromAPI(jsonResponse);

    return pesosPorProviderResponse;
  }
}

class DetalleCompraProvider {
  Future<DetalleCompraResponse> obtenerDetallesCompraPorProveedorId(
      String proveedorId) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/detalleCompraProveedorId/$proveedorId");

    print("Dentro del provider (detalle compra por proveedor).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    DetalleCompraResponse detalleCompraResponse =
        DetalleCompraResponse.fromAPI(jsonResponse);

    return detalleCompraResponse;
  }

  Future<ComprasResponse> obtenerDetallesCompraPorProveedorIdTrue(
      String proveedorId) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compraProveedorIdTrue/$proveedorId");

    print("Dentro del provider (detalle compra por proveedor).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ComprasResponse detalleCompraResponse =
        ComprasResponse.fromAPI(jsonResponse);

    return detalleCompraResponse;
  }

  Future<DetalleCompraResponseCreate> crearDetalleCompra(
      DetalleCompraModel detalleCompra) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/detalleCompra/create");

    print("Dentro del provider (detalle compra create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "productoId": detalleCompra.productoId,
          "proveedorId": detalleCompra.proveedorId,
          "cantidadTotal": detalleCompra.cantidadTotal,
          "pesoKilosTotal": detalleCompra.pesoKilosTotal,
          "pesoLibrasTotal": detalleCompra.pesoLibrasTotal,
          "pesoNetoTotal": detalleCompra.pesoNetoTotal,
          "descuentoTotal": detalleCompra.descuentoTotal,
          "precio": detalleCompra.precio,
          "total": detalleCompra.total,
          "fecha": detalleCompra.fecha,
          "saved": detalleCompra.saved
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    DetalleCompraResponseCreate detalleCompraResponse =
        DetalleCompraResponseCreate.fromAPI(jsonResponse);

    return detalleCompraResponse;
  }

  Future<DetalleCompraResponseUpdate> updateDetalleCompra(
      DetalleCompraModel detalleCompra) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/detalleCompra/edit");

    print("Dentro del provider (detalle compra update).");

    var responseHttp = await http.put(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "_id": detalleCompra.id,
          "productoId": detalleCompra.productoId,
          "proveedorId": detalleCompra.proveedorId,
          "cantidadTotal": detalleCompra.cantidadTotal,
          "pesoKilosTotal": detalleCompra.pesoKilosTotal,
          "pesoLibrasTotal": detalleCompra.pesoLibrasTotal,
          "pesoNetoTotal": detalleCompra.pesoNetoTotal,
          "descuentoTotal": detalleCompra.descuentoTotal,
          "precio": detalleCompra.precio,
          "total": detalleCompra.total,
          "fecha": detalleCompra.fecha,
          "saved": detalleCompra.saved
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    DetalleCompraResponseUpdate detalleCompraResponse =
        DetalleCompraResponseUpdate.fromAPI(jsonResponse);

    return detalleCompraResponse;
  }
}

class CompraTotalProvider {
  Future<CompraTotalResponse> obtenerComprasTotales() async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compraTotal/all");

    print("Dentro del provider (compras totales).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraTotalResponse compraTotalResponse =
        CompraTotalResponse.fromAPI(jsonResponse);

    return compraTotalResponse;
  }

  Future<CompraTotalResponsePorProveedor> obtenerComprasTotalesPorProveedorId(
      String proveedorId) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compraTotalProveedorId/$proveedorId");

    print("Dentro del provider (compra total por proveedor id).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraTotalResponsePorProveedor compraTotalPorProveedorResponse =
        CompraTotalResponsePorProveedor.fromAPI(jsonResponse);

    return compraTotalPorProveedorResponse;
  }

  Future<CompraTotalResponse> createCompraTotal(
      CompraTotalModel compraTotal) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compraTotal/create");

    print("Dentro del provider (compra total create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "proveedorId": compraTotal.proveedorId,
          "total": compraTotal.total,
          "fecha": compraTotal.fecha
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraTotalResponse compraTotalResponse =
        CompraTotalResponse.fromAPI(jsonResponse);

    return compraTotalResponse;
  }

  Future<CompraTotalResponseUpdate> updateCompraTotal(
      CompraTotalModel compraTotal) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/compraTotal/edit");

    print("Dentro del provider (compra total update).");

    var responseHttp = await http.put(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "_id": compraTotal.id,
          "proveedorId": compraTotal.proveedorId,
          "total": compraTotal.total,
          "fecha": compraTotal.fecha
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraTotalResponseUpdate compraTotalResponse =
        CompraTotalResponseUpdate.fromAPI(jsonResponse);

    return compraTotalResponse;
  }
}
