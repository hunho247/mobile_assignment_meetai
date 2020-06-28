class Moment {
  final String username;
  final String location;
  final String latlong;
  final int date;
  final List<String> images;

  Moment({
    this.username,
    this.location,
    this.latlong,
    this.date,
    this.images,
  });

  factory Moment.fromJson(Map<String, dynamic> json) {
    var moment = json['profile']['moment'][0];
    List<String> imgList = List<String>();
    var jsonImages = moment['images'];

    jsonImages.forEach((image) {
      imgList.add(image);
    });

    return Moment(
      username: json['profile']['username'],
      location: moment['location'],
      latlong: moment['latlong'],
      date: moment['date'],
      images: imgList,
    );
  }
}
