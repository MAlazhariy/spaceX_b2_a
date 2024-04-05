import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({
    super.key,
    required this.heroTag,
    required this.imagePath,
  });

  final String heroTag;
  final String imagePath;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Center(
            child: Hero(
              tag: widget.heroTag,
              child: InteractiveViewer(
                maxScale: 5,
                child: Image.network(
                  widget.imagePath,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  errorBuilder: (c, o, s) => const SizedBox.shrink(),
                ),
              ),
            ),
          ),
          // close button
          SafeArea(
            child: Tooltip(
              message: 'back'.tr(),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minWidth: 0,
                color: Colors.black45,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.close,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
