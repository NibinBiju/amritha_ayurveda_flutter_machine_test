import 'package:dartz/dartz.dart';

abstract class HomePageRepository {
  Future<Either> getBookings();
}
