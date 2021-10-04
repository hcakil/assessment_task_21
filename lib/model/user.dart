class MyUser {
  MyUser({
    this.id,
    this.photo,
    this.name,
    this.surname,
    this.identityNumber,
    this.fatherName,
    this.motherName,
    this.gender,
    this.birthday,
    this.birthPlace,
    this.maritalStatus,
    this.city,
    this.town,
    this.dateOfDeath,
  });

  String id;
  String photo;
  String name;
  String surname;
  String identityNumber;
  String fatherName;
  String motherName;
  String gender;
  String birthday;
  String birthPlace;
  String maritalStatus;
  String city;
  String town;
  dynamic dateOfDeath;


  MyUser.withUserId(this.id, this.photo, this.name, this.surname, this.identityNumber,
      this.fatherName, this.motherName, this.gender, this.birthday,
      this.birthPlace, this.maritalStatus, this.city, this.town,
      this.dateOfDeath);


  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
    id: json["id"],
    photo: json["photo"],
    name: json["name"],
    surname: json["surname"],
    identityNumber: json["identity_number"],
    fatherName: json["father_name"],
    motherName: json["mother_name"],
    gender: json["gender"],
    birthday: json["birthday"],
    birthPlace: json["birth_place"],
    maritalStatus: json["marital_status"],
    city: json["city"],
    town: json["town"],
    dateOfDeath: json["date_of_death"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
    "name": name,
    "surname": surname,
    "identity_number": identityNumber,
    "father_name": fatherName,
    "mother_name": motherName,
    "gender": gender,
    "birthday": birthday,
    "birth_place": birthPlace,
    "marital_status": maritalStatus,
    "city": city,
    "town": town,
    "date_of_death": dateOfDeath,
  };
}
