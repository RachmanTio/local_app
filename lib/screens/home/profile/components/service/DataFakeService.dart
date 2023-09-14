import 'package:local_app/API/data_fake.dart';
import 'package:http/http.dart' as http;

class DataFakeService {
  static final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future getDataFake() async{
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      print(response.body);
      return dataFakeFromJson(response.body.toString());
    } else {
      throw Exception('failed to load');
    }
  }
}