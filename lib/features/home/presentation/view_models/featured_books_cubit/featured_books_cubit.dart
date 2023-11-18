import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_states.dart';
import '../../../data/repos/home_repo.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookStates> {
  final HomeRepo homeRepo;

  FeaturedBookCubit(this.homeRepo) : super(InitialState());

  // List<String> thumbnails ;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
     // print(failure.errorMessage);
      emit(FeaturedBooksErrorState(error: failure.errorMessage));
    }, (featuredBooks) {
      // print(featuredBooks.items[3].volumeInfo!.imageLinks!.thumbnail!);

      emit(FeaturedBooksSuccessState(bookModel: featuredBooks));
    });
  }
}
