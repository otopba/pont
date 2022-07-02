import 'package:built_value/built_value.dart';

part 'checkout_page_state.g.dart';

abstract class CheckoutPageState
    implements Built<CheckoutPageState, CheckoutPageStateBuilder> {
  factory CheckoutPageState([void Function(CheckoutPageStateBuilder) updates]) =
      _$CheckoutPageState;

  CheckoutPageState._();

  bool get validInput;
}
