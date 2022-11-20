import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/src/ad_containers.dart';
import 'package:valo/constants/app_colors.dart';
import 'package:valo/network/rank_client.dart';
import 'package:valo/widgets/rank_screen/ranks_list.dart';

import '../adsmodule/ad_banner_listener.dart';
import '../adsmodule/ad_helper.dart';
import '../models/rank.dart';

class RanksScreen extends StatefulWidget {
  const RanksScreen({Key? key}) : super(key: key);

  @override
  State<RanksScreen> createState() => _RanksScreenState();
}

class _RanksScreenState extends State<RanksScreen> implements AdBannerListener{
  final RankClient _rankClient = RankClient();

  late Future<Iterable<Rank>> _ranks;
  @override
  void initState() {
    _ranks = _rankClient.getAllRanks();
    AdHelper.initBannerAd(this);
    AdHelper.loadBannerAd(adSize: AdSize.fullBanner, adBannerListener: this);
    AdHelper.showBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.only(top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              'Competetive Tiers',
              style: TextStyle(
                  color: white, fontFamily: 'Valorant', fontSize: 20.sp),
            ),
          ),
          FutureBuilder<Iterable<Rank>>(
            future: _ranks,
            builder: (
              BuildContext context,
              AsyncSnapshot<Iterable<Rank>> snapshot,
            ) {
              return RanksList(snapshot: snapshot);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
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
    ));
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
