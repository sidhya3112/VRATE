import 'dart:async';
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './reviewmodel.dart';
part 'reviews_phy.g.dart';
class Reviews = ReviewsBase with _$Reviews;
abstract class ReviewsBase with Store {
  @observable
  ObservableList<ReviewModel> reviews = ObservableList.of([]);

  @observable
  double averageStars = 0;

  @computed
  int get numberOfReviews => reviews.length;

  int totalStars = 0;

  @action
  void addReview(ReviewModel newReview) {
    //to update list of reviews
    reviews.add(newReview);
    // to update the average number of stars
    averageStars = _calculateAverageStars(newReview.stars);
    // to update the total number of stars
    totalStars += newReview.stars;
    // to store the reviews using Shared Preferences
    _persistReview(reviews);
  }

  @action
  Future<void> initReviews() async {
    await _getReviews().then((onValue) {
      reviews = ObservableList.of(onValue);
      for (ReviewModel review in reviews) {
        totalStars += review.stars;
      }
    });
    averageStars = totalStars / reviews.length;
  }

  double _calculateAverageStars(int newStars) {
    return (newStars + totalStars) / numberOfReviews;
  }

  void _persistReview(List<ReviewModel> updatedReviews) async {
    List<String> reviewsStringList = [];
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    for (ReviewModel review in updatedReviews) {
      Map<String, dynamic> reviewMap = review.toJson();
      String reviewString = jsonEncode(ReviewModel.fromJson(reviewMap));
      reviewsStringList.add(reviewString);
    }
    _preferences.setStringList('userReviews', reviewsStringList);
  }

  Future<List<ReviewModel>> _getReviews() async {
    final SharedPreferences _preferences =
    await SharedPreferences.getInstance();
    final List<String> reviewsStringList =
        _preferences.getStringList('userReviews') ?? [];
    final List<ReviewModel> retrievedReviews = [];
    for (String reviewString in reviewsStringList) {
      Map<String, dynamic> reviewMap = jsonDecode(reviewString);
      ReviewModel review = ReviewModel.fromJson(reviewMap);
      retrievedReviews.add(review);
    }
    return retrievedReviews;
  }
}