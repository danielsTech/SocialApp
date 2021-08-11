import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:social_app/app/anim/durations.dart';
import 'package:social_app/app/data/enums.dart';
import 'package:social_app/app/debug/log.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/services/camera_service.dart';
import 'package:social_app/ui/views/camera/camera_view_model.dart';
import 'package:social_app/ui/views/camera/gallery_panel_widget.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';
import 'package:social_app/ui/views/camera/preview_screen.dart';
import 'package:stacked/stacked.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final _cameraService = AppLocator.locator<CameraService>();
  final _cameraViewModel = AppLocator.locator<CameraViewModel>();

  CameraController? _cameraController;
  late Future<void> _cameraInit;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() {
    Future.delayed(const Duration(milliseconds: 380), () {
      _cameraController = CameraController(_cameraService.deviceCameras[0], ResolutionPreset.high);
      _cameraInit = _cameraController!.initialize();
      _cameraViewModel.notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(const Duration(milliseconds: 500), () {
      _cameraController!.dispose();
      _cameraViewModel.setCameraLoaded(false, toRebuild: false);
    });
  }

  Future<bool> _onWillPop() async {
    _cameraViewModel.onWillPop(context);
    return false;
  }

  static final double _bottomBarInitialHeight = ScreenUtil.screenHeightLp * 0.03;
  static final double _bottomBarMaxHeight = ScreenUtil.screenHeightLp * 0.88 + 13.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CameraViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => _cameraViewModel,
      builder: (context, viewModel, _) => WillPopScope(
        onWillPop: _onWillPop,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(17.0)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SlidingUpPanel(
                    color: Colors.black,
                    parallaxEnabled: true,
                    parallaxOffset: .5,
                    controller: viewModel.panelController,
                    maxHeight: _bottomBarMaxHeight,
                    minHeight: _bottomBarInitialHeight,
                    panelBuilder: (controller) => GalleryPanelWidget(
                      controller: controller,
                      panelController: viewModel.panelController,
                    ),
                    onPanelSlide: (position) {
                      viewModel.setPanelAnimationPosition = position;
                    },
                    body: Stack(
                      fit: StackFit.expand,
                      children: [
                        _cameraView,
                        _bottomControlPanel,
                      ],
                    ),
                  ),
                  _closeButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _closeButton => _CloseButton();

  Widget get _cameraView {
    if (_cameraController != null) {
      return Positioned.fill(
        bottom: 52,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
          child: FutureBuilder(
            future: _cameraInit,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  if (!_cameraViewModel.cameraLoaded) {
                    _cameraViewModel.setCameraLoaded(true);
                  }
                });

                double _opacity = 1.0;

                if (_cameraViewModel.panelAnimationPosition >= 0.5) {
                  _opacity = 1.0 - (_cameraViewModel.panelAnimationPosition - 0.5) * 1.3;
                } else {
                  _opacity = 1.0;
                }

                return AnimatedOpacity(
                  duration: AnimationDurations.cameraViewFadeAnimationDuration,
                  opacity: _cameraViewModel.cameraLoaded ? 1.0 : 0.0,
                  child: CameraPreview(_cameraController!).opacity(_opacity),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget get _bottomControlPanel => Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 70.0,
        child: Container(
          width: double.infinity,
          height: 90.0,
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.filter_tilt_shift_outlined, size: 38.0, color: Colors.white.withOpacity(0.85)),
              _shootActionButton,
              GestureDetector(
                  onTap: _cameraViewModel.tooglePanel,
                  child: Icon(Icons.image_outlined, size: 38.0, color: Colors.white.withOpacity(0.85))),
            ],
          ),
        ),
      );

  Widget get _shootActionButton => Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        // fit: StackFit.expand,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: InkWell(
              onTap: () async {
                final file = await _cameraService.takePhoto(_cameraController!);
                Navigator.push(
                    context,
                    PageTransition(
                        child: PreviewScreen(
                          path: file.path,
                        ),
                        type: PageTransitionType.size,
                        alignment: Alignment.bottomCenter,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500)));
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.withOpacity(0.8), width: 2.8),
                ),
              ),
            ),
          ),
        ],
      );
}

class _CloseButton extends ViewModelWidget<CameraViewModel> {
  const _CloseButton({Key? key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, CameraViewModel viewModel) {
    return Positioned(
      left: 15.0,
      top: 15.0,
      child: GestureDetector(
          onTap: () => viewModel.onViewBack(context), child: Icon(Icons.close, size: 29.0, color: Colors.white)),
    );
  }
}
