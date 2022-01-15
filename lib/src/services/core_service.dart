import 'package:meta/meta.dart';
import 'package:universal_html/controller.dart';
import 'package:universal_html/html.dart';

abstract class CoreService {
  @protected
  Future<Document?> getBodyFromUrl(String url) async {
    final WindowController _controller = WindowController();
    await _controller.openHttp(uri: Uri.parse(url));

    return _controller.window?.document;
  }
}
