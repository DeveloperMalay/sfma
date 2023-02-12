import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sfma/models/custom_error.dart';
import 'package:sfma/repositories/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SigninState> {
  SignInCubit({required this.authRepository}) : super(SigninState.initial());
  final AuthRepository authRepository;
  Future<void> signin({required String email, required String password}) async {
    emit(state.copyWith(signinStatus: SigninStatus.submitting));
    try {
      await authRepository.signin(email: email, password: password);

      emit(state.copyWith(signinStatus: SigninStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(
        signinStatus: SigninStatus.error,
        error: e,
      ));
    }
  }
}
