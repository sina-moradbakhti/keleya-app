import 'package:keleya/_config/_config.dart';

class CreateAccountService extends HttpService {
  final String _query = 'api/users';
  final HttpServiceRequestType requestType = HttpServiceRequestType.POST;
  Map<String, dynamic> body = {};
  Map<String, String> headers = {};

  @override
  call() async {
    final url = this.httpServiceMakeUrl(host: host, query: _query);
    var response = await this.httpServiceMakeCall(
        url: url,
        reqType: requestType,
        parameters: this.body,
        headers: this.headers);
    return HttpServiceResponse(response);
  }
}
