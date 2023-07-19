
import 'package:http/http.dart' as http;



/// https://randomuser.me/api/?page=1&results=10
class DemoApiCall {
  static final DemoApiCall _demoApiCall = DemoApiCall();

  static DemoApiCall getInstance() {
    return _demoApiCall;
  }

  Future<http.Response> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return response;
  }


  Future<http.Response> getBookingList({required int pageNumber,required int pageSize }) async {
    final http.Response response =
    await _demoApiCall.get("https://randomuser.me/api/?page=$pageNumber&results=$pageSize");
    return response;
  }

}
