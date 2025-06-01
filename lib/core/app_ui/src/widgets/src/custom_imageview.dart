import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:personal/core/app_ui/app_ui.dart';

class CustomImageView extends StatelessWidget {
  final String path;
  final ImageType sourceType;
  final double? height;
  final double? width;
  final BoxFit fit;

  const CustomImageView({
    Key? key,
    required this.path,
    required this.sourceType,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (sourceType) {
      case ImageType.asset:
        return Image.asset(path, height: height, width: width, fit: fit);

      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: path,
          height: height,
          width: width,
          fit: fit,
          placeholderFadeInDuration: const Duration(milliseconds: 500),
          placeholder:
              (context, url) => CustomWidgets.customContainer(
                h: 30,
                w: 30,
                color: AppColors.hex3E3f,
              ),
          imageBuilder: (context, imageProvider) {
            return _AnimatedImageWrapper(
              image: Image(
                image: imageProvider,
                height: height,
                width: width,
                fit: fit,
              ),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );

      case ImageType.file:
        return Image.file(File(path), height: height, width: width, fit: fit);
    }
  }
}

class _AnimatedImageWrapper extends StatefulWidget {
  final Widget image;

  const _AnimatedImageWrapper({required this.image});

  @override
  State<_AnimatedImageWrapper> createState() => _AnimatedImageWrapperState();
}

class _AnimatedImageWrapperState extends State<_AnimatedImageWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  )..forward();

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 0.96,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(scale: _scaleAnimation, child: widget.image),
    );
  }
}
