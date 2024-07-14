
sealed class ProductState {}

final class ProductInitial extends ProductState{}


// Get All Product ..
final class GetAllProductLoadingState extends ProductState{}
final class GetAllProductSuccessState extends ProductState{}
final class GetAllProductErrorState extends ProductState{}
final class SearchResultsState extends ProductState{}
