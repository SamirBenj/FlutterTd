class User {
  final int? id;
  final String Nom;
  final String Prenom;
  final int age;

  User({
    this.id,
    required this.Nom,
    required this.Prenom,
    required this.age,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'Nom': Nom,
  //     'Prenom': Prenom,
  //     'age': age,
  //   };
  // }
  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        Nom = res["Nom"],
        Prenom = res["Prenom"],
        age = res["Age"];

  // @override
  Map<String, Object?> toMap() {
    // return 'User{id:$id, Nom:$Nom,Prenom: $Prenom,age:$age}';
    return {
      'id': id,
      'Nom': Nom,
      'Prenom': Prenom,
      'age': age,
    };
  }
}
