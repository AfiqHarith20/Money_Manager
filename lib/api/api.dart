import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> getExchangeRate(String fromCurrency, String toCurrency) async {
  final String url =
      "https://openexchangerates.org/api/latest.json?app_id=573cc675cce44bef92d46f222efebc19&base=$fromCurrency";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final exchangeRate = data['rates'];
    final rate = exchangeRate[toCurrency];
    if (rate != null) {
      return rate.toDouble();
    }
  }
  throw Exception(
      'Failed to get exchange rate from $fromCurrency to $toCurrency');
}
