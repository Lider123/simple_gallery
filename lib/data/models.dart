class Album {
  final num id;
  final num userId;
  final String title;

  Album(this.id, this.userId, this.title);

  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'];
}

class Post {
  final num id;
  final num userId;
  final String title;
  final String body;

  Post(this.id, this.userId, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        body = json['body'];
}

class User {
  final num id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'],
        company = Company.fromJson(json['company']);
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company(this.name, this.catchPhrase, this.bs);

  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        catchPhrase = json['catchPhrase'],
        bs = json['bs'];
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Address.fromJson(Map<String ,dynamic> json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'],
        geo = Geo.fromJson(json['geo']);
}

class Geo {
  final String lat;
  final String lng;

  Geo(this.lat, this.lng);

  Geo.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lng = json['lng'];
}
