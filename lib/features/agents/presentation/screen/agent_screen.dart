import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/src/ad_containers.dart';
import 'package:valo/constants/app_colors.dart';

import '../../../../adsmodule/ad_banner_listener.dart';
import '../../../../adsmodule/ad_helper.dart';
import 'widget/widget_agent.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> implements AdBannerListener {

  @override
  void initState() {
    AdHelper.initBannerAd(this);
    AdHelper.loadBannerAd(adSize: AdSize.fullBanner, adBannerListener: this);
    // AdHelper.showBannerAd();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 13.w),
                child: const Text(
                  'Agents',
                  style: TextStyle(
                      color: white, fontSize: 30, fontFamily: 'Valorant'),
                  textAlign: TextAlign.start,
                ),
              ),

              // Agent Filters
              const AgentTab(),

              const AgentListWidget(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: AdHelper.bannerAd?.size.width.toDouble(),
                    height: AdHelper.bannerAd?.size.height.toDouble(),
                    child: Container(

                      ///Để hiển thị qc như một widget dùng AdWidget sau khi gọi [load]
                      child: AdWidget(ad: AdHelper.bannerAd!),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onAdClicked(Ad ad) {
    // TODO: implement onAdClicked
  }

  @override
  void onAdClosed(Ad ad) {
    // TODO: implement onAdClosed
  }

  @override
  void onAdFailedToLoad(Ad ad, LoadAdError error) {
    // TODO: implement onAdFailedToLoad
  }

  @override
  void onAdImpression(Ad ad) {
    // TODO: implement onAdImpression
  }

  @override
  void onAdLoaded(Ad ad) {
    // TODO: implement onAdLoaded
  }

  @override
  void onAdOpened(Ad ad) {
    // TODO: implement onAdOpened
  }

  @override
  void onAdWillDismissScreen(Ad ad) {
    // TODO: implement onAdWillDismissScreen
  }
}






