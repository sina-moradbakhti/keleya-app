import 'package:keleya/_config/_config.dart';
import 'package:keleya/_global/_local_cache/_local_cache_manager.dart';

class RefreshTokenService extends HttpService {
  final String _query = 'api/users/auth/refresh-token';
  final HttpServiceRequestType requestType = HttpServiceRequestType.POST;
  final Map<String, dynamic> _body = {
    'id': LocalCacheManager.shared.getData.uid,
    'email': LocalCacheManager.shared.getData.email,
    'token': LocalCacheManager.shared.getData.token
  };

  @override
  call() async {
    final url = this.httpServiceMakeUrl(host: host, query: _query);
    var response = await this.httpServiceMakeCall(
        url: url, reqType: requestType, parameters: this._body, headers: null);
    return HttpServiceResponse(response);
  }
}
