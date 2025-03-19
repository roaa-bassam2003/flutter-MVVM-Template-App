class Failure {
  int code; //200, 201, ...
  String message; // error, success, password is wrong, email is wrong, ...
  
  Failure(
    this.code,
    this.message,
  );
}
