import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vi_application/widgets/body.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  final List<Color> colors = [
    Colors.red,
    Colors.red,
    Colors.red,
    Colors.red,
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return customFrostedBottomBar();
  }
  FrostedBottomBar customFrostedBottomBar() {
    return FrostedBottomBar(
      opacity: 0.9,
      child: TabBar(
        indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0,),
        controller: tabController,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.yellowAccent, width: 4),
          insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
        ),
        tabs: [
          TabsIcon(
              icons: Icons.person_outline,
              color: currentPage == 0 ? colors[0] : Colors.white),
          TabsIcon(
              icons: Icons.mobile_friendly,
              color: currentPage == 1 ? colors[1] : Colors.white),
          TabsIcon(
              icons: Icons.card_giftcard,
              color: currentPage == 2 ? colors[2] : Colors.white),
          TabsIcon(
              icons: Icons.menu,
              color: currentPage == 3 ? colors[3] : Colors.white),
        ],
      ),
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(milliseconds: 800),
      hideOnScroll: true,
      body: (context, controller) => TabBarView(
        controller: tabController,
        dragStartBehavior: DragStartBehavior.down,
        physics: const BouncingScrollPhysics(),
        children: colors
            .map(
              (e) => ListView.builder(
                itemCount: 1,
                controller: controller,
                itemBuilder: (context, index) {
                  return const Body();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}
