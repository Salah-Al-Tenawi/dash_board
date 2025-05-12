class ApiEndPoint {
  static const baserUrl =
      "https://dashboard.render.com/web/srv-d0gbp5a4d50c73fmctq0/api/";
  // auth
  static const login = "$baserUrl login";
  static const singin = "$baserUrl signup";
  static const logout = "$baserUrl logout";
  static const forgetPassword = "$baserUrl forgot-password";
  static const resetPassword = "$baserUrl reset-password";

  // storage
}

class ApiKey {
  // Authorization
  static const authorization = "Authorization";

  // user info
  static const id = "id";
  static const user = "user";
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const address = "address";
  static const email = "email";
  static const password = "password";
  static const passwordConfir = "password_confirmation";
  static const gender = "gender";
  static const token = "access_token";
// erorr
  static const error = "error";
}
