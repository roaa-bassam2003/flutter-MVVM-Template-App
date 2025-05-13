// form of the request from me to the api
// --------------Common----------------
// login Request
class LoginRequest {
  String email;
  String password;
  
  LoginRequest(
    this.email,
    this.password,
  );
}

// change Password
class ChangePasswordRequest {
  String passwordOne;
  String passwordTwo;
  
  ChangePasswordRequest(
    this.passwordOne,
    this.passwordTwo,
  );
}

// report
class ReportRequest {
  String userName;
  String reportMessage;
  
  ReportRequest(
    this.userName,
    this.reportMessage,
  );
}
// ------------------Client----------------------
// ------------------Service Provider------------