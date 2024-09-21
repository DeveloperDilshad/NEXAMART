import 'package:flutter/material.dart';
import 'package:nexamart/models/rating.dart';
import 'package:nexamart/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  Rating _rating = Rating(
    userId: '',
    rating: 0,
  );

  Rating get rating => _rating;

  void setRating(Rating rating) {
    _rating = rating;
    notifyListeners();
  }
}
