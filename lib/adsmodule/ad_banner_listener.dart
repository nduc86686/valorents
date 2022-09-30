import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_listener.dart';

class AdBannerListener {
  void onAdLoaded(Ad ad) {}

  void onAdFailedToLoad(Ad ad,LoadAdError error) {}

  void onAdOpened(Ad ad) {}

  void onAdClosed(Ad ad) {}

  ///Được gọi khi một lần hiển thị quảng cáo xảy ra.
  void onAdImpression(Ad ad) {}

  ///Được gọi khi quảng cáo được nhấp vào.
  void onAdClicked(Ad ad) {}

  ///Chỉ dành cho iOS. Được gọi trước khi loại bỏ chế độ xem toàn màn hình.
  void onAdWillDismissScreen(Ad ad) {}
}