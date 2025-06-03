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
  static const data = "data";
  static const success = "success";
  static const error = "error";
  static const token = "access_token";

  // User Info
  static const userId = "user_id";
  static const id = "id";
  static const user = "user";
  static const fullName = "full_name";
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const address = "address";
  static const email = "email";
  static const password = "password";
  static const passwordConfirm = "password_confirmation";
  static const gender = "gender";
  static const profilePhoto = "profile_photo";
  static const description = "description";
  static const verificationStatus = "verification_status";
  static const numberOfRides = "number_of_rides";
  //toDo edit the key 
  //toDo don't forget this
  //ToDo show me salah
  static const rate = "rate";
  static const numberRating = "number_rating";

  // Car Info
  static const typeOfCar = "type_of_car";
  static const colorOfCar = "color_of_car";
  static const numberOfSeats = "number_of_seats";
  static const carPic = "car_pic";
  static const radio = "radio";
  static const smoking = "smoking";

    // Documents
  static const documents = "documents";
  static const faceIdPic = "face_id_pic";
  static const backIdPic = "back_id_pic";
  static const licensePic = "license_pic";
  static const mechanicCardPic = "mechanic_card_pic";

  // Comments
  
  static const name = "name";
  static const comments = "comments";
  static const comment = "comment";
  static const commenter = "commenter";
  static const createdAt = "created_at";
}
