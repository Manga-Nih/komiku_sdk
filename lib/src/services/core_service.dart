import 'package:universal_html/controller.dart';
import 'package:universal_html/html.dart';

abstract class CoreService {
  Future<Document?> getBodyFromUrl(String url) async {
    final WindowController controller = WindowController();
    await controller.openHttp(uri: Uri.parse(url));

    return controller.window?.document;
  }
}
