import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pont/cubits/pont_bottom_sheet/pont_bottom_sheet_cubit.dart';
import 'package:pont/cubits/pont_bottom_sheet/pont_bottom_sheet_state.dart';
import 'package:pont/data/client/client_pont.dart';
import 'package:pont/pages/checkout_page.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/widgets/bottom_button.dart';

const _tag = 'pont_bottom_sheet';

class PontBottomSheet extends StatefulWidget {
  const PontBottomSheet({
    Key? key,
    required this.pont,
  }) : super(key: key);

  final ClientPont pont;

  @override
  State<PontBottomSheet> createState() => _PontBottomSheetState();
}

class _PontBottomSheetState extends State<PontBottomSheet> {
  final _numberFormat = NumberFormat('#,###');
  late final _cubit = PontBottomSheetCubit(pont: widget.pont);
  late PontBottomSheetState _state;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PontBottomSheetCubit, PontBottomSheetState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        _state = state;

        return _body();
      },
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 64),
        _image(),
        const SizedBox(height: 43),
        _title(),
        const SizedBox(height: 5),
        _description(),
        const SizedBox(height: 30),
        _historyTitle(),
        const SizedBox(height: 5),
        _history(),
        const Spacer(),
        _button(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _image() {
    return Center(
      child: _state.pont.type.getImage(width: 195, height: 195),
    );
  }

  Widget _button() {
    return BottomButton(
      onTap: _onBuyPressed,
      text:
          "${_numberFormat.format(_state.pont.price).replaceAll(',', ' ')} TON",
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        _state.pont.name,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.19,
          letterSpacing: 0.37,
        ),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        _state.pont.description,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.27,
          letterSpacing: -0.45,
        ),
      ),
    );
  }

  Widget _historyTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "History",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.19,
          letterSpacing: 0.37,
        ),
      ),
    );
  }

  Widget _history() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        _state.pont.history,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.27,
          letterSpacing: -0.45,
        ),
      ),
    );
  }

  void _onBuyPressed() {
    Log.d(_tag, '_onBuyPressed');

    Navigator.of(context).pushNamed(CheckoutPage.routeName);
  }
}
