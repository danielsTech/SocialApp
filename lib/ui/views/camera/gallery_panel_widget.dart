import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/ui/views/camera/camera_view_model.dart';

class GalleryPanelWidget extends StatelessWidget {
  final ScrollController? controller;
  final PanelController? panelController;

  GalleryPanelWidget({
    Key? key,
    this.controller,
    this.panelController,
  }) : super(key: key);

  final _cameraViewModel = AppLocator.locator<CameraViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (scroll) {
          scroll.disallowGlow();
          return false;
        },
        child: Column(
          children: [
            _panelHeader,
            SizedBox(height: 1),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 4, right: 4, bottom: 4),
                child: GridView.count(
                  controller: controller,
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: List.generate(
                    20,
                    (index) => Container(
                      color: Colors.white24,
                      child: Center(child: Icon(Icons.image_outlined, color: Colors.white, size: 38.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _panelHeader => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _cameraViewModel.tooglePanel,
        child: Container(
          width: double.infinity,
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      );
}
