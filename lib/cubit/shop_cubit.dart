
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/DioHelper/DioHelper.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());
  static ShopCubit get(context) => BlocProvider.of(context);



  bool isSecure = false;
  showPassword() {
    isSecure = !isSecure;
    emit(ShowPassword());
  }

  void login({
    required String email,
    required password,
  }) {
    emit(LoginLoadingState());
    DioHelper.signin(email: email, password: password).then((value) {
      print(value.data.toString());
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void register({required String email, required password, required name, required phone}) {
    emit(RegisterLoadingState());
    DioHelper.signup(email: email, password: password, name: name, phone: phone).then((value) {
      print(value.data.toString());
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErroeState());
    });
  }
}
