import 'package:atplace/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _profileImageButton(widget.video.user.profileImageUrl),
          _sideBarItem('heart', widget.video.likes, style, 40),
          _sideBarItem('share', '1.2M', style, 40),
          _sideBarItem('booking', '', style, 70),
        ],
      ),
    );
  }

  _sideBarItem(
      String iconName, String label, TextStyle style, double iconSize) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/$iconName.svg',
          width: iconSize,
          height: iconSize,
          // color: Colors.white.withOpacity(0.75),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: style,
        )
      ],
    );
  }

  _profileImageButton(String imageUrl) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(25)),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
