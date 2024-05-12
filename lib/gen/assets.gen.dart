/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Edit Picture.png
  AssetGenImage get editPicture =>
      const AssetGenImage('assets/icons/Edit Picture.png');

  /// File path: assets/icons/Fav Blog.png
  AssetGenImage get favBlog => const AssetGenImage('assets/icons/Fav Blog.png');

  /// File path: assets/icons/Fav Podcast.png
  AssetGenImage get favPodcast =>
      const AssetGenImage('assets/icons/Fav Podcast.png');

  /// File path: assets/icons/about.png
  AssetGenImage get about => const AssetGenImage('assets/icons/about.png');

  /// File path: assets/icons/add.png
  AssetGenImage get add => const AssetGenImage('assets/icons/add.png');

  /// File path: assets/icons/back.png
  AssetGenImage get back => const AssetGenImage('assets/icons/back.png');

  /// File path: assets/icons/blogs.png
  AssetGenImage get blogs => const AssetGenImage('assets/icons/blogs.png');

  /// File path: assets/icons/customer-support.png
  AssetGenImage get customerSupport =>
      const AssetGenImage('assets/icons/customer-support.png');

  /// File path: assets/icons/down-arrow.png
  AssetGenImage get downArrow =>
      const AssetGenImage('assets/icons/down-arrow.png');

  /// File path: assets/icons/hashtags.png
  AssetGenImage get hashtags =>
      const AssetGenImage('assets/icons/hashtags.png');

  /// File path: assets/icons/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/icons/heart.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/icons/logout.png');

  /// File path: assets/icons/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/icons/podcast.png');

  /// File path: assets/icons/remove.png
  AssetGenImage get remove => const AssetGenImage('assets/icons/remove.png');

  /// File path: assets/icons/share.png
  AssetGenImage get share => const AssetGenImage('assets/icons/share.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        editPicture,
        favBlog,
        favPodcast,
        about,
        add,
        back,
        blogs,
        customerSupport,
        downArrow,
        hashtags,
        heart,
        home,
        logout,
        podcast,
        remove,
        share,
        user
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Bot Sticker.png
  AssetGenImage get botStickerPng =>
      const AssetGenImage('assets/images/Bot Sticker.png');

  /// File path: assets/images/Bot Sticker.svg
  SvgGenImage get botStickerSvg =>
      const SvgGenImage('assets/images/Bot Sticker.svg');

  /// File path: assets/images/MJ 21 No Bg.png
  AssetGenImage get mJ21NoBg =>
      const AssetGenImage('assets/images/MJ 21 No Bg.png');

  /// File path: assets/images/PodTestImg.png
  AssetGenImage get podTestImg =>
      const AssetGenImage('assets/images/PodTestImg.png');

  /// File path: assets/images/Tagr Logo No BG.png
  AssetGenImage get tagrLogoNoBG =>
      const AssetGenImage('assets/images/Tagr Logo No BG.png');

  /// File path: assets/images/Tagr Splash Screen.png
  AssetGenImage get tagrSplashScreen =>
      const AssetGenImage('assets/images/Tagr Splash Screen.png');

  /// File path: assets/images/tagrLogo.png
  AssetGenImage get tagrLogo =>
      const AssetGenImage('assets/images/tagrLogo.png');

  /// File path: assets/images/test1.png
  AssetGenImage get test1 => const AssetGenImage('assets/images/test1.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// List of all assets
  List<dynamic> get values => [
        botStickerPng,
        botStickerSvg,
        mJ21NoBg,
        podTestImg,
        tagrLogoNoBG,
        tagrSplashScreen,
        tagrLogo,
        test1,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
