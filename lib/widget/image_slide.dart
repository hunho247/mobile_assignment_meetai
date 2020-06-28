import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlide extends StatefulWidget {
  final List<String> images;
  final double width;
  final double height;

  const ImageSlide(
    this.images, {
    this.width = 0,
    this.height = 0,
  });

  @override
  _ImageSlideState createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlide> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: widget.images
              .map(
                (item) => CachedNetworkImage(
                  imageUrl: item,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((url) {
            int index = widget.images.indexOf(url);
            return Container(
              width: _current == index ? 17.0 : 4.0,
              height: 4.0,
              margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: _current == index
                    ? const Color(0xFF4BA9FF)
                    : const Color(0xFFC0DFFB),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
