class User {
  // String username;
  // String password;

  // User(this.username, this.password);

  // factory User.fromJson(Map<String, dynamic> json){
  //   return User(json['username'], json['password']);
  // }
  // int id_user;
  String nip;
  String username;
  String password;

  User(this.nip, this.username, this.password);

  // var arr = ['id_user: ${id_user}'];

  // @override
  // String toString(){
  //   return 'User{nip: $nip, username: $username, password: $password}';
  // }

  factory User.fromMap(Map<String, dynamic> json){
    return User( json['nip'], json['username'], json['password'] );
    // return User(json['nip'], json['username'], pass: json['password']);
    // return User(json['nip'], json['email'], json['pass']);
  }
  // return User();

  factory User.fromJson(Map<String, dynamic> json){
    return User(json['nip'], json['username'], json['password']);
  }
}