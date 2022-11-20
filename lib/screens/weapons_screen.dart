import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:valo/models/weapon.dart';
import 'package:valo/network/weapon_client.dart';
import 'package:valo/widgets/weapon_screen/weapon_list.dart';

import '../adsmodule/ad_banner_listener.dart';
import '../adsmodule/ad_helper.dart';
import '../constants/app_colors.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({Key? key}) : super(key: key);

  @override
  State<WeaponScreen> createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> implements AdBannerListener{
  // Weapons Client
  final WeaponsClient _weaponsClient = WeaponsClient();

  // Weapons List
  late Future<Iterable<Weapon>> _weapons;
  @override
  void initState() {
    _weapons = _weaponsClient.getWeapons();
    AdHelper.initBannerAd(this);
    AdHelper.loadBannerAd(adSize: AdSize.fullBanner, adBannerListener: this);
    AdHelper.showBannerAd();
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Weapons',
              style: TextStyle(
                  color: white, fontFamily: 'Valorant', fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<Iterable<Weapon>>(
              future: _weapons,
              builder: (
                BuildContext context,
                AsyncSnapshot<Iterable<Weapon>> snapshot,
              ) {
                return WeaponsList(snapshot: snapshot);
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
