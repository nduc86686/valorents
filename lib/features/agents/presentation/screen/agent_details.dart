import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/src/ad_containers.dart';
import 'package:valo/container_injector.dart';

import '../../../../adsmodule/ad_banner_listener.dart';
import '../../../../adsmodule/ad_helper.dart';
import '../cubit/detail_agent_cubit/detail_agents_cubit.dart';

class AgentsDetails extends StatefulWidget {
  final String ?uuid;
  AgentsDetails({Key? key,this.uuid}) : super(key: key);

  @override
  State<AgentsDetails> createState() => _AgentsDetailsState();
}

class _AgentsDetailsState extends State<AgentsDetails> implements AdBannerListener{
  DetailAgentsCubit ?_cubit;
  @override
  void initState() {
    AdHelper.initBannerAd(this);
    AdHelper.loadBannerAd(adSize: AdSize.fullBanner, adBannerListener: this);
    AdHelper.showBannerAd();
    context.read<DetailAgentsCubit>().getDetailsAgent(uuid: '${widget.uuid}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          titleSpacing: 10.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Agents Details",
            style: GoogleFonts.bowlbyOneSc(
                color: NowUIColors.beyaz,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            icon: Image.asset('assets/img/back.png'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: NowUIColors.homecolorr,
        body: BlocBuilder<DetailAgentsCubit, DetailAgentsState>(
          builder: (context, state) {
            if (state is DetailAgentsLoaded) {
              return Stack(
                children: <Widget>[
                  Container(
                    height: 389,
                    width: 390,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                              "assets/img/agentdetailsbg.png",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          color: Colors.transparent,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: "${state.agents?.fullPortrait}",
                                    height: 300,
                                    width: 300,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Origin:",
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: NowUIColors.redhome,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 170,
                                  ),
                                  Text(
                                    "${state.agents?.displayName}",
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: NowUIColors.beyaz,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: NowUIColors.beyaz,
                                thickness: 1.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Type:",
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: NowUIColors.redhome,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Text(
                                    "${state.agents?.developerName}",
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: NowUIColors.beyaz,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 5),
                              // Divider(
                              //   color: NowUIColors.beyaz,
                              //   thickness: 1.0,
                              // ),
                              // new Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: <Widget>[
                              //     Text(
                              //       "Points For Ultimate:",
                              //       style: GoogleFonts.bowlbyOneSc(
                              //         color: NowUIColors.redhome,
                              //         fontSize: 12,
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 180,
                              //     ),
                              //     Text(
                              //       "6",
                              //       style: GoogleFonts.bowlbyOneSc(
                              //         color: NowUIColors.beyaz,
                              //         fontSize: 12,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: NowUIColors.beyaz,
                                thickness: 1.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Description:",
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: NowUIColors.redhome,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                child: Text(
                                  "${state.agents?.description}",
                                  style: GoogleFonts.bowlbyOneSc(
                                    color: NowUIColors.beyaz,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: NowUIColors.beyaz,
                                thickness: 1.0,
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Abilities:",
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: NowUIColors.redhome,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  ListView.builder(
                                   physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:(context,int){
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: NowUIColors.redhome,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              color: NowUIColors.homecolorr,
                                              height: 200,
                                              width: 308,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 36.0, left: 12, top: 10),
                                                child: Wrap(
                                                  spacing: 30,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              "Incendiary:",
                                                              style:
                                                              GoogleFonts.bowlbyOneSc(
                                                                color: NowUIColors.redhome,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            CachedNetworkImage(
                                                              height: 35,
                                                              width: 35,
                                                              imageUrl: "${state.agents?.abilities?[int].displayIcon}",
                                                              placeholder: (context, url) => CircularProgressIndicator(),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "Type:",
                                                              style:
                                                              GoogleFonts.bowlbyOneSc(
                                                                color: NowUIColors.redhome,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "No data",
                                                              style:
                                                              GoogleFonts.bowlbyOneSc(
                                                                color: NowUIColors.beyaz,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              width: 40,
                                                            ),
                                                            Text(
                                                              "Cost:",
                                                              style:
                                                              GoogleFonts.bowlbyOneSc(
                                                                color: NowUIColors.redhome,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "No data",
                                                              style:
                                                              GoogleFonts.bowlbyOneSc(
                                                                color: NowUIColors.beyaz,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              "Description:",
                                                              style:
                                                              GoogleFonts.bowlbyOneSc(
                                                                color: NowUIColors.redhome,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            "${state.agents?.abilities?[int].description}",
                                                            style: GoogleFonts.bowlbyOneSc(
                                                              color: NowUIColors.beyaz,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: state.agents?.abilities?.length,
                                  ),
                                ],
                              )
                            ],
                          ),
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
                ],
              );
            }
            return const SizedBox.shrink();
          },
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

class CustomeShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 2 / 3, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomeShape oldClipper) => false;
}

class NowUIColors {
  static const Color black = Color(0xFF000000);

  static const Color homecolorr = Color(0xFF0F1923);
  static const Color redhome = Color(0xFFFF4655);

  static const Color statusbar = Color(0xFF252836);

  static const Color textField = Color(0xFF1F1D2B);

  static const Color card = Color(0xFFF252836);
  static const Color beyaz = Color(0xFFFFFFFF);
  static const Color dashbeyaz = Color(0xFFFFEFEFE);

  static const Color signupbtn = Color(0xFFf5f5f5);

  static const Color anasite = Color(0xFF377dff);
  static const Color textColor = Color(0xFF8A8D9F);
  static const Color morcuk = Color(0xFF676ABB);
  static const Color altmenubg = Color(0xFF21325B);
  static const Color bartrn = Color(0xFFfd7e14);
  static const Color loginbg = Color(0xFF16151E);

  static const Color defaultColor = Color.fromRGBO(136, 136, 136, 1.0);

  static const Color primary = Color.fromRGBO(249, 99, 50, 1.0);

  static const Color secondary = Color.fromRGBO(68, 68, 68, 1.0);

  static const Color label = Color.fromRGBO(254, 36, 114, 1.0);

  static const Color neutral = Color.fromRGBO(255, 255, 255, 0.2);

  static const Color tabs = Color.fromRGBO(222, 222, 222, 0.3);

  static const Color info = Color.fromRGBO(44, 168, 255, 1.0);

  static const Color error = Color.fromRGBO(255, 54, 54, 1.0);

  static const Color success = Color.fromRGBO(24, 206, 15, 1.0);

  static const Color warning = Color.fromRGBO(255, 178, 54, 1.0);

  static const Color text = Color.fromRGBO(44, 44, 44, 1.0);

  static const Color bgColorScreen = Color.fromRGBO(255, 255, 255, 1.0);

  static const Color border = Color.fromRGBO(231, 231, 231, 1.0);

  static const Color inputSuccess = Color.fromRGBO(27, 230, 17, 1.0);

  static const Color input = Color.fromRGBO(220, 220, 220, 1.0);

  static const Color inputError = Color.fromRGBO(255, 54, 54, 1.0);

  static const Color muted = Color.fromRGBO(136, 152, 170, 1.0);

  // static const Color text = Color.fromRGBO(50, 50, 93, 1.0);

  static const Color time = Color.fromRGBO(154, 154, 154, 1.0);

  static const Color priceColor = Color.fromRGBO(234, 213, 251, 1.0);

  static const Color active = Color.fromRGBO(249, 99, 50, 1.0);

  static const Color buttonColor = Color.fromRGBO(156, 38, 176, 1.0);

  static const Color placeholder = Color.fromRGBO(159, 165, 170, 1.0);

  static const Color switchON = Color.fromRGBO(249, 99, 50, 1.0);

  static const Color switchOFF = Color.fromRGBO(137, 137, 137, 1.0);

  static const Color gradientStart = Color.fromRGBO(107, 36, 170, 1.0);

  static const Color gradientEnd = Color.fromRGBO(172, 38, 136, 1.0);

  static const Color socialFacebook = Color.fromRGBO(59, 89, 152, 1.0);

  static const Color socialTwitter = Color.fromRGBO(91, 192, 222, 1.0);

  static const Color socialDribbble = Color.fromRGBO(234, 76, 137, 1.0);
}
