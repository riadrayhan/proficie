import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/detail_mentor_cover.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/icons/close_icon.png",
                    width: width / 8.5,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/more_vert_icon.png",
                    width: width / 8.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.5 - shrinkOffset,
          right: 0,
          left: 0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              height: 90,
              width: 90,
              decoration:  BoxDecoration(
                border: Border.all(color: Colors.white,width: 4.5),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/list_mentor_1.jpg",
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
