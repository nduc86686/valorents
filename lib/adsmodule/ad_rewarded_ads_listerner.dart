import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_listener.dart';

class AdRewardedAdsListener {
  void onAdLoaded(RewardedAd ad) {}


  void onAdFailedToLoad(LoadAdError error) {}

  ///Được gọi khi quảng cáo loại bỏ nội dung toàn màn hình.
  void onAdDismissedFullScreenContent(RewardedAd ad) {}

  ///Được gọi khi một quảng cáo hiển thị nội dung toàn màn hình.
  void onAdShowedFullScreenContent(RewardedAd ad) {}

  ///Được gọi khi quảng cáo không hiển thị nội dung toàn màn hình
  void onAdFailedToShowFullScreenContent(RewardedAd ad, AdError error) {}

  ///Được gọi khi một lần hiển thị quảng cáo xảy ra.
  void onAdImpression(RewardedAd ad) {}

  ///Được gọi khi quảng cáo được nhấp vào.
  void onAdClicked(RewardedAd ad) {}

  ///Chỉ dành cho iOS. Được gọi trước khi loại bỏ chế độ xem toàn màn hình.
  void onAdWillDismissFullScreenContent() {}

  ///function nhận thưởng
  void onUserEarnedReward(AdWithoutView ad, RewardItem reward) {}
}