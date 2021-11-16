import 'dart:convert';

import 'package:jm_alpaca/drawer/compra/model/CompraBrosa.dart';
import 'package:http/http.dart' as http;

class ProductoProvider {
  Future<ProductoResponse> obtenerProductos() async {
    var url = Uri.parse("http://10.0.2.2:8282/api/producto/all");

    print("Dentro del provider (producto).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ProductoResponse productoResponse = ProductoResponse.fromAPI(jsonResponse);

    return productoResponse;
  }

  Future<SingleProductoResponse> obtenerProductoPorId(String productoId) async {
    var url = Uri.parse("http://10.0.2.2:8282/api/producto/$productoId");

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
    var url = Uri.parse("http://10.0.2.2:8282/api/proveedor/all");

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
    var url = Uri.parse("http://10.0.2.2:8282/api/persona/" + id);

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
    var url = Uri.parse("http://10.0.2.2:8282/api/sede/" + id);

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
    var url = Uri.parse("http://10.0.2.2:8282/api/tipoDescuento/all");

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
    var url = Uri.parse("http://10.0.2.2:8282/api/compra/create");

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
          "descuento": compra.descuento
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CompraResponse compraResponse = CompraResponse.fromAPI(jsonResponse);

    return compraResponse;
  }
}

class PesoProvider {
  Future<PesosPorProviderResponse> pesosPorProvider(String proveedorId) async {
    var url =
        Uri.parse("http://10.0.2.2:8282/api/compraProveedorId/$proveedorId");

    print("Dentro del provider (pesosPorProvider).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    PesosPorProviderResponse pesosPorProviderResponse =
        PesosPorProviderResponse.fromAPI(jsonResponse);

    return pesosPorProviderResponse;
  }
}
