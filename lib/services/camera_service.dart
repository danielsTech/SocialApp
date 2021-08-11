import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/services/path_service.dart';

class CameraService {
  final _pathService = AppLocator.locator<PathService>();

  List<CameraDescription> _deviceCameras = [];
  List<CameraDescription> get deviceCameras => _deviceCameras;

  void getAvailableDeviceCameras() async => _deviceCameras = await availableCameras();

  Future<XFile> takePhoto(CameraController controller) async => await controller.takePicture();
}
