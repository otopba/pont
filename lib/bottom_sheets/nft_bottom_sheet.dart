import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/nft_bottom_sheet/nft_bottom_sheet_cubit.dart';
import 'package:pont/cubits/nft_bottom_sheet/nft_bottom_sheet_state.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/images.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/utils/string_extension.dart';
import 'package:pont/widgets/bottom_button.dart';

const _tag = 'nft_bottom_sheet';

class NftBottomSheet extends StatefulWidget {
  const NftBottomSheet({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final ClientNft nft;

  @override
  State<NftBottomSheet> createState() => _NftBottomSheetState();
}

class _NftBottomSheetState extends State<NftBottomSheet> {
  late final _cubit = NftBottomSheetCubit(nft: widget.nft);
  late NftBottomSheetState _state;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NftBottomSheetCubit, NftBottomSheetState>(
      bloc: _cubit,
      listener: (context, state) {},
      buildWhen: (NftBottomSheetState previous, NftBottomSheetState current) {
        if (previous.error != current.error && current.error.isNotNullOrEmpty) {
          Log.d(_tag, 'Show error:${current.error}');
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text(
              current.error!,
              style: const TextStyle(color: Colors.white),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        return true;
      },
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
        _nft(),
        const SizedBox(height: 53),
        _name(),
        const SizedBox(height: 5),
        _description(),
        const SizedBox(height: 30),
        _rarity(),
        _rarityValue(),
        const SizedBox(height: 30),
        _price(),
        _priceValue(),
        const Spacer(),
        _button(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _button() {
    return BottomButton(
      onTap: _onSyncPressed,
      loading: _state.loading,
      text: 'Sync with device',
    );
  }

  Widget _priceValue() {
    return _bodyText('Unknown purchase price');
  }

  Widget _price() {
    return _headerText('Purchase price');
  }

  Widget _rarityValue() {
    return _bodyText("Unknown rarity");
  }

  Widget _rarity() {
    return _headerText('Rarity');
  }

  Widget _description() {
    return _bodyText(_state.nft.description ?? 'No description');
  }

  Widget _name() {
    return _headerText(_state.nft.name ?? 'NFT');
  }

  Widget _bodyText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.45,
          height: 0.78,
        ),
      ),
    );
  }

  Widget _headerText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.37,
          height: 1.93,
        ),
      ),
    );
  }

  Widget _nft() {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PontImage.pontCircle(
            width: 195,
            height: 195,
          ),
          if (_state.nft.image.isNotNullOrEmpty)
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: _state.nft.image!,
                fit: BoxFit.cover,
                width: 174,
                height: 174,
                errorWidget: (
                  BuildContext context,
                  String url,
                  dynamic error,
                ) {
                  Log.e(_tag, "Error loading image url = $url error = $error");
                  return _placeHolder();
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _placeHolder() {
    return Container();
  }

  Future<void> _onSyncPressed() async {
    Log.d(_tag, '_onSyncPressed');

    final result = await _cubit.sync();

    Log.d(_tag, '_onSyncPressed: result = $result');

    if (result) {
      Navigator.of(context).pop();
    }
  }
}
