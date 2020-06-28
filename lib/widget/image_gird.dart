import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile_assignment_meetai/utils/Constants.dart';

class ImageGird extends StatefulWidget {
  final List<String> images;
  final String location;

  const ImageGird(this.images, this.location);

  @override
  _ImageGirdState createState() => _ImageGirdState();
}

class _ImageGirdState extends State<ImageGird> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.redColor.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Image(
                        width: 18.0,
                        height: 18.0,
                        image: AssetImage('assets/images/ic_location.png')),
                    const SizedBox(width: 2),
                    Text(
                      widget.location,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Constants.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              StaggeredGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                staggeredTiles: _generateStaggeredTiles(widget.images),
                children: _generateImageList(widget.images),
              ),
            ]),
      ),
    );
  }

  List<StaggeredTile> _generateStaggeredTiles(List<String> urls) {
    List<StaggeredTile> tileList = List<StaggeredTile>();
    bool isFirst = true;

    urls.forEach((url) {
      if (isFirst)
        tileList.add(StaggeredTile.count(4, 2));
      else
        tileList.add(StaggeredTile.count(2, 2));

      isFirst = false;
    });

    return tileList;
  }

  List<CachedNetworkImage> _generateImageList(List<String> urls) {
    List<CachedNetworkImage> imgList = List<CachedNetworkImage>();

    urls.forEach((url) {
      imgList.add(CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
      ));
    });

    return imgList;
  }
}
