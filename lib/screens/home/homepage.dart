import 'package:flutter/material.dart';
import 'package:rimotech/constants/colors.dart';
import 'package:rimotech/constants/size_config.dart';
import 'package:rimotech/screens/home/homepageViewModel.dart';
import 'package:rimotech/util/helpers/helpers.dart';
import 'package:rimotech/widgets/grid_button.dart';
import 'package:rimotech/widgets/transaction_card.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int _current = 0;

  Widget _pageIndicator(bool isCurrentPage, int index) {
    return GestureDetector(
      onTap: () => _controller.animateToPage(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        height: 5.0,
        width: isCurrentPage ? 16.0 : 10.0,
        decoration: BoxDecoration(
          color: isCurrentPage ? AppColors.primaryColor : Colors.grey[400],
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
        viewModelBuilder: () => HomepageViewModel(),
        builder: (context, model, child) => WillPopScope(
            onWillPop: () {
              return null;
            },
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/user_img.png'))),
                                ),
                              ),
                              customXMargin(10),
                              Text(
                                'Hi ${model.name},',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    customYMargin(20),
                    CarouselSlider(
                      items: model.carouselImg,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: false,
                          //enlargeCenterPage: true,
                          aspectRatio: 2.5,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    customYMargin(10),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < model.carouselImg.length; i++)
                            _current == i
                                ? _pageIndicator(true, i)
                                : _pageIndicator(false, i)
                        ],
                      ),
                    ),
                    customYMargin(20),
                    Text('Get Started',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    customYMargin(20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                          shrinkWrap: true,
                          children: List<Widget>.generate(4, (index) {
                            return GridButton(data: model.gridList[index]);
                          }),
                        ),
                      ),
                    ),
                    customYMargin(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Transactions',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        TextButton(
                          onPressed: () {},
                          child: Text('See all',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor)),
                        ),
                      ],
                    ),
                    customYMargin(20),
                    Column(
                        children: model.transaction
                            .map((e) => TransactionCard(data: e))
                            .toList())
                  ],
                ),
              ),
            )));
  }

  kWidth(int i, BuildContext context) {}
}
