import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/checkout/checkout_page_cubit.dart';
import 'package:pont/cubits/checkout/checkout_page_state.dart';
import 'package:pont/images.dart';
import 'package:pont/pages/buy_ok_page.dart';
import 'package:pont/pages/shop_page.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/widgets/bottom_button.dart';

const _tag = 'checkout_page';

class CheckoutPage extends StatefulWidget {
  static const routeName = 'checkout';

  const CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _cubit = CheckoutPageCubit();
  late CheckoutPageState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutPageCubit, CheckoutPageState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        _state = state;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(),
          body: SafeArea(
            top: false,
            child: _body(),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Checkout',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.55,
          height: 1.05,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        color: Colors.black,
        icon: PontImage.back(width: 26, height: 26),
        onPressed: _onBackPressed,
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        _addressField(),
        const Spacer(),
        _dateFiled(),
        const Spacer(),
        _phoneNumberFiled(),
        const Spacer(),
        _button(),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _button() {
    return BottomButton(
      text: "Complete",
      backgroundColor:
          _state.validInput ? Colors.black : const Color(0xFFE8E8E8),
      textColor: _state.validInput ? Colors.white : const Color(0x33000000),
      onTap: _onCompletePressed,
    );
  }

  Widget _phoneNumberFiled() {
    return _field(hint: 'Phone number', onChanged: _cubit.changePhoneNumber);
  }

  Widget _dateFiled() {
    return _field(hint: 'Date', onChanged: _cubit.changeDate);
  }

  Widget _addressField() {
    return _field(hint: 'Address', onChanged: _cubit.changeAddress);
  }

  Widget _field({
    required String hint,
    required ValueSetter<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: onChanged,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.45,
          height: 1.27,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          fillColor: const Color(0xFFF4F4F4),
          filled: true,
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.45,
            height: 1.27,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  void _onBackPressed() {
    Log.d(_tag, '_onBackPressed');

    Navigator.pop(context);
  }

  void _onCompletePressed() {
    Log.d(_tag, '_onCompletePressed');

    if (!_state.validInput) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      BuyOk.routeName,
      ModalRoute.withName(ShopPage.routeName),
    );
  }
}
