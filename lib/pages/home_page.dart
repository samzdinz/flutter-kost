// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/provider/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: "Jakarta",
                      imageUrl: "assets/city1.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 2,
                        name: "Bandung",
                        imageUrl: "assets/city2.png",
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: "Surabaya",
                      imageUrl: "assets/city3.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: "Palembang",
                      imageUrl: "assets/city4.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 5,
                        name: "Aceh",
                        imageUrl: "assets/city5.png",
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: "Bogor",
                      imageUrl: "assets/city6.png",
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpace(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      imageUrl: 'assets/tips1.png',
                      name: 'City Guidelines',
                      date: '20 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      imageUrl: 'assets/tips2.png',
                      name: 'Jakarta Fairship',
                      date: '11 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * edge),
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23), color: Color(0xffF6F7F8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
                imageUrl: 'assets/Icon_home_solid.png', isActive: true),
            BottomNavbarItem(
                imageUrl: 'assets/Icon_card_solid.png', isActive: false),
            BottomNavbarItem(
                imageUrl: 'assets/Icon_mail_solid.png', isActive: false),
            BottomNavbarItem(
                imageUrl: 'assets/Icon_love_solid.png', isActive: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
