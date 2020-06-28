class User {
  final String username;
  final String name;
  final int birthdate;
  final String work;
  final String education;
  final String bio;
  final List<String> images;

  User({
    this.username,
    this.name,
    this.birthdate,
    this.work,
    this.education,
    this.bio,
    this.images,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<String> imgList = List<String>();
    var jsonImages = json['profile']['images'];

    jsonImages.forEach((image) {
      imgList.add(image);
    });

    return User(
      username: json['profile']['username'],
      name: json['profile']['name'],
      birthdate: json['profile']['birthdate'],
      work: json['profile']['work'],
      education: json['profile']['education'],
      bio: json['profile']['bio'],
      images: imgList,
    );
  }
}
