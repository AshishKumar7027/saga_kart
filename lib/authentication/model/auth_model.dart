class User {
  String username;
  String password;

  User({required this.username, required this.password});

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  // Create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }
}

void main() {
  // Example of creating a User object
  User user = User(username: "mno", password: "7070");

  // Convert the User object to JSON
  Map<String, dynamic> json = user.toJson();
  print("User as JSON: $json");

  // Create a User object from JSON
  User newUser = User.fromJson(json);
  print("User created from JSON: ${newUser.username}, ${newUser.password}");
}
