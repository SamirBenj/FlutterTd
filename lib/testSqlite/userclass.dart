class Users {
  final int? id;
  final String Nom;
  final String Prenom;
  final int age;

  Users({
    this.id,
    required this.Nom,
    required this.Prenom,
    required this.age,
  });

  Users.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        Nom = res["Nom"],
        Prenom = res["Prenom"],
        age = res["Age"];

  // @override
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'Nom': Nom,
      'Prenom': Prenom,
      'age': age,
    };
  }
}
