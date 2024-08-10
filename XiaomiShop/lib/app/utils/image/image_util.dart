
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xiaomishop/generated/assets.dart';

class ImageUtil {

  static Widget get defaultPlaceholder => Lottie.asset(
    Assets.lottieImageLoading,
    fit: BoxFit.contain,
    repeat: true
  );

  static const Widget error = Icon(Icons.error);

  static Widget getNetworkImageWidget(
      String url,
      {
        Alignment alignment =  Alignment.center,
        BoxFit fit = BoxFit.cover,
        Widget errorWidget = error,
        Widget placeholder = const CircularProgressIndicator()
      }
  ){
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      alignment: alignment,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => errorWidget,
    );
  }

  static Widget getAssetImageWidget(
      String path,
      {
        BoxFit fit = BoxFit.cover
      }
  ){
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}