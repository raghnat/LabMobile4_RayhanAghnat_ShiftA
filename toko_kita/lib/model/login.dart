class Login {
  int? code;
  bool? status;
  String? token;
  int? userID;
  String? userEmail;

  // Constructor
  Login({this.code, this.status, this.token, this.userID, this.userEmail});

  // Factory constructor to create an instance from JSON
  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      code: obj['code'],
      status: obj['status'],
      token: obj['data']['token'],
      userID: obj['data']['user']['id'],
      userEmail: obj['data']['user']['email'], // Added userEmail from JSON
    );
  }
}
