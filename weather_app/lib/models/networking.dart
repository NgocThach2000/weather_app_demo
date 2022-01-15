import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({required this.url});
  Future getData() async {
    var response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Mã lỗi: ${response.statusCode} không có phản hồi từ máy chủ!!!');
    }
  }
}
