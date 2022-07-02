import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/checkout/checkout_page_state.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/utils/string_extension.dart';

const _tag = 'checkout_page_cubit';

class CheckoutPageCubit extends Cubit<CheckoutPageState> {
  String? _address;
  String? _date;
  String? _phoneNumber;

  CheckoutPageCubit()
      : super(
          CheckoutPageState(
            (b) => b..validInput = false,
          ),
        ) {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }

  void changeAddress(String rawAddress) {
    Log.d(_tag, 'changeAddress: rawAddress = $rawAddress');

    final address = rawAddress.trim();
    if (_address == address) return;

    _address = address;

    _validateInput();
  }

  void changeDate(String rawDate) {
    Log.d(_tag, 'changeDate: rawDate = $rawDate');

    final date = rawDate.trim();
    if (_date == date) return;

    _date = date;

    _validateInput();
  }

  void changePhoneNumber(String rawPhoneNumber) {
    Log.d(_tag, 'changePhoneNumber: rawPhoneNumber = $rawPhoneNumber');

    final phoneNumber = rawPhoneNumber.trim();
    if (_phoneNumber == phoneNumber) return;

    _phoneNumber = phoneNumber;

    _validateInput();
  }

  void _validateInput() {
    bool validInput = _address.isNotNullOrEmpty &&
        _date.isNotNullOrEmpty &&
        _phoneNumber.isNotNullOrEmpty;

    if (state.validInput == validInput) return;

    emit(state.rebuild((b) => b..validInput = validInput));
  }
}
