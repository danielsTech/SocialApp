import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathService {
  Future<Directory> getTempDirectory() async => await getTemporaryDirectory();
}
