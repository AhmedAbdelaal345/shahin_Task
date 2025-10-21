import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahin_task/manager/database/local_database_helper.dart';
import 'package:shahin_task/manager/home_cubit.dart/home_model.dart';
import 'package:shahin_task/utils/app_constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadSampleData() async {
    try {
      emit(HomeLoading());

      final products = [
        HomeModel(
          title: 'جاكيت من الصوف مناسب',
          imagePath: AppConstants.sweetShirtImage,
          newPrice: '320جم',
          oldPrice: '600جم',
        ),
        HomeModel(
          title: 'حذاء رياضي مريح',
          imagePath: AppConstants.sportShoesImage,
          newPrice: '450جم',
          oldPrice: '800جم',
        ),
        HomeModel(
          title: 'قميص كاجوال أنيق',
          imagePath: AppConstants.shirtImage,
          newPrice: '850جم',
          oldPrice: '1,200جم',
        ),
        HomeModel(
          title: 'منزل عصري جميل',
          imagePath: AppConstants.homeImage,
          newPrice: '150,000جم',
          oldPrice: '200,000جم',
        ),
      ];

      final snapshot = await _firestore.collection('products').get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      for (var product in products) {
        await _firestore.collection('products').add(product.toJson());
      }

      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> getDataFromFirebase() async {
    try {
      emit(HomeLoading());

      final connected = await _isConnected();
      if (connected) {
        final snapshot = await _firestore.collection('products').get();

        final List<HomeModel> products = snapshot.docs
            .map((doc) => HomeModel.fromJson(doc.data()))
            .toList();
        await LocalDatabaseHelper().clearProducts();

        await LocalDatabaseHelper().insertProducts(products);
        emit(HomeLoaded(products));
      } else {
        final localProducts = await LocalDatabaseHelper().getProducts();

        if (localProducts.isEmpty) {
          emit(HomeFailure("لا توجد بيانات محفوظة محليًا."));
        } else {
          emit(HomeLoaded(localProducts));
        }
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> getDataFromLocal() async {
    try {
      emit(HomeLoading());
      final products = await LocalDatabaseHelper().getProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<bool> _isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
