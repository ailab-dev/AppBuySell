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

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Apple_Pay.svg
  SvgGenImage get applePay => const SvgGenImage('assets/images/Apple_Pay.svg');

  /// File path: assets/images/GPay.png
  AssetGenImage get gPay => const AssetGenImage('assets/images/GPay.png');

  /// File path: assets/images/Google_Pay.svg
  SvgGenImage get googlePay =>
      const SvgGenImage('assets/images/Google_Pay.svg');

  /// File path: assets/images/ad_group.svg
  SvgGenImage get adGroup => const SvgGenImage('assets/images/ad_group.svg');

  /// File path: assets/images/add_photo_alternate.svg
  SvgGenImage get addPhotoAlternate =>
      const SvgGenImage('assets/images/add_photo_alternate.svg');

  /// File path: assets/images/app.png
  AssetGenImage get app => const AssetGenImage('assets/images/app.png');

  /// File path: assets/images/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/images/delete.svg');

  /// File path: assets/images/delete2.svg
  SvgGenImage get delete2 => const SvgGenImage('assets/images/delete2.svg');

  /// File path: assets/images/edit_square.svg
  SvgGenImage get editSquare =>
      const SvgGenImage('assets/images/edit_square.svg');

  /// File path: assets/images/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/images/facebook.svg');

  /// File path: assets/images/github.svg
  SvgGenImage get github => const SvgGenImage('assets/images/github.svg');

  /// File path: assets/images/imageDefault.svg
  SvgGenImage get imageDefault =>
      const SvgGenImage('assets/images/imageDefault.svg');

  /// File path: assets/images/instagram.png
  AssetGenImage get instagram =>
      const AssetGenImage('assets/images/instagram.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo.svg
  SvgGenImage get logoSvg => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/images/logout.svg');

  /// File path: assets/images/pick.svg
  SvgGenImage get pick => const SvgGenImage('assets/images/pick.svg');

  /// File path: assets/images/portfolio.svg
  SvgGenImage get portfolio => const SvgGenImage('assets/images/portfolio.svg');

  /// File path: assets/images/purchase.svg
  SvgGenImage get purchase => const SvgGenImage('assets/images/purchase.svg');

  /// File path: assets/images/report.svg
  SvgGenImage get report => const SvgGenImage('assets/images/report.svg');

  /// File path: assets/images/report_finish.svg
  SvgGenImage get reportFinish =>
      const SvgGenImage('assets/images/report_finish.svg');

  /// File path: assets/images/selectImage.svg
  SvgGenImage get selectImage =>
      const SvgGenImage('assets/images/selectImage.svg');

  /// File path: assets/images/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/images/settings.svg');

  /// File path: assets/images/x.svg
  SvgGenImage get x => const SvgGenImage('assets/images/x.svg');

  /// List of all assets
  List<dynamic> get values => [
        applePay,
        gPay,
        googlePay,
        adGroup,
        addPhotoAlternate,
        app,
        delete,
        delete2,
        editSquare,
        facebook,
        github,
        imageDefault,
        instagram,
        logoPng,
        logoSvg,
        logout,
        pick,
        portfolio,
        purchase,
        report,
        reportFinish,
        selectImage,
        settings,
        x
      ];
}

class Assets {
  Assets._();

  static const String applePayConfig = 'assets/apple_pay_config.json';
  static const String googlePayConfig = 'assets/google_pay_config.json';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [applePayConfig, googlePayConfig];
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
