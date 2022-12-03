import 'package:elsheikh_store/app/constants.dart';
import 'package:elsheikh_store/app/extensions.dart';
import 'package:elsheikh_store/domain/model/models.dart';

import '../response/responses.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(this?.token.orEmpty() ?? Constants.empty);
  }
}
