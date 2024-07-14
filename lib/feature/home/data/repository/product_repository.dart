import 'package:dartz/dartz.dart';
import 'package:route_task/feature/home/data/models/product_model.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service_locator.dart';

class ProductRepository {

  //get products
  Future<Either<String, GetAllProductsModel>> getProducts() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.products,
      );
      return Right(GetAllProductsModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

}
