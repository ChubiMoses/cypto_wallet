import 'package:http/http.dart' as http;

Future<String> getBalances(String address, String chain) async {
  final url = Uri.http('10.0.2.2:5000', '/get_token_balance', {
    'address': address,
    'chain': chain,
  });

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to get balances');
  }
}