import 'package:flutter/material.dart';
import 'package:pont/images.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/widgets/bottom_button.dart';

const _tag = 'buy_ok_page';

class BuyOk extends StatefulWidget {
  static const routeName = 'buy-ok';

  const BuyOk({
    Key? key,
  }) : super(key: key);

  @override
  State<BuyOk> createState() => _BuyOkState();
}

class _BuyOkState extends State<BuyOk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        _image(),
        const Spacer(),
        _title(),
        const SizedBox(height: 45),
        _button(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _image() {
    return Align(
      alignment: Alignment.center,
      child: PontImage.buyOk(width: 212, height: 212),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 33),
      child: Text(
        "Done.\nWe'll call\nyou soon",
        style: TextStyle(
          fontSize: 62,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.56,
          height: 0.98,
        ),
      ),
    );
  }

  Widget _button() {
    return BottomButton(
      onTap: _onOkPressed,
      text: 'Ok',
    );
  }

  void _onOkPressed() {
    Log.d(_tag, '_onOkPressed');

    Navigator.of(context).pop();
  }
}
