class User {
  String? name;
  String? id;
  String? email;
  String? gender;
  int? age;
  User({this.name, this.id, this.email, this.gender, this.age});

  User.fromFireStore(Map<String, dynamic>? data) {
    id = data?["id"];
    name = data?["name"];
    email = data?["email"];
    gender = data?["gender"];
    age = data?["age"];
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "gender": gender,
      "age": age,
    };
  }
}
