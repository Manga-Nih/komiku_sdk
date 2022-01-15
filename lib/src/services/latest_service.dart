import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class LatestService extends CoreService {
  latest() async {
    String url = KomikuUrl.baseUrl;
    Document? $ = await getBodyFromUrl(url);

    return $;
  }
}
