library apppalma2.globals;

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;

String responsable = "";

initResponsable() async {
  const storage = secure.FlutterSecureStorage();
  responsable = await storage.read(key: 'cc_usuario') ?? "";
}
