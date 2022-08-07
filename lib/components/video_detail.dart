import 'package:atplace/models/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:marquee/marquee.dart';
import 'package:intl/intl.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###");
    var hotelPrice = formatter.format(video.hotel.hotelPrice);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "${video.hotel.hotelName}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          ExpandableText(
            "¥${hotelPrice}〜",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            expandText: 'more',
            collapseText: 'less',
            expandOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          SizedBox(
            height: 4,
          ),
          Row(children: [
            Icon(
              CupertinoIcons.location_solid,
              size: 14,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "${video.hotel.hotelArea}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ])
        ],
      ),
    );
  }
}
