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
