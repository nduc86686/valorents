import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_listener.dart';

class AdInterstitialAdsListener {
  void onAdLoaded(InterstitialAd ad) {}

  void onAdFailedToLoad(LoadAdError error) {}

  ///Được gọi khi quảng cáo loại bỏ nội dung toàn màn hình.
  void onAdDismissedFullScreenContent(InterstitialAd ad) {}

  ///Được gọi khi một quảng cáo hiển thị nội dung toàn màn hình.
  void onAdShowedFullScreenContent(InterstitialAd ad) {}

  ///Được gọi khi quảng cáo không hiển thị nội dung toàn màn hình
  void onAdFailedToShowFullScreenContent(InterstitialAd ad, AdError error) {}

  ///Được gọi khi một lần hiển thị quảng cáo xảy ra.
  void onAdImpression(InterstitialAd ad) {}

  ///Được gọi khi quảng cáo được nhấp vào.
  void onAdClicked(InterstitialAd ad) {}

  ///Chỉ dành cho iOS. Được gọi trước khi loại bỏ chế độ xem toàn màn hình.
  void onAdWillDismissFullScreenContent() {}
}