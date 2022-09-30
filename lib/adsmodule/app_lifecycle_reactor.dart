
import 'package:flutter/material.dart';
import 'ad_helper.dart';
import 'ad_open_ads_listerner.dart';

class AppLifecycleReactor extends WidgetsBindingObserver
    with AdOpenAdsListener {
  late final AdHelper adHelper;

  AppLifecycleReactor({required this.adHelper});

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print('resumed');
    if (state == AppLifecycleState.resumed) {
      // appOpenAdManager.showAdIfAvailable();
      AdHelper.showAdIfAvailable(this);
    }
  }
}