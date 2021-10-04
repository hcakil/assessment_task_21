
class Auth {
  Auth({
    this.id,
    this.name,
    this.surname,
    this.status,
    this.photo,
  });

  String id;
  String name;
  String surname;
  String status;
  String photo;

  @override
  String toString() {
    return 'Auth{id: $id, name: $name, surname: $surname, status: $status, photo: $photo}';
  }

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"] == null ? null : json["surname"],
    status: json["status"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? "No Name" : name,
    "surname": surname == null ? "No Surname" : surname,
    "status": status,
    "photo": photo,
  };
}
