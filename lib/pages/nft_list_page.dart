import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/bottom_sheets/nft_bottom_sheet.dart';
import 'package:pont/cubits/nft_list/nft_list_page_cubit.dart';
import 'package:pont/cubits/nft_list/nft_list_page_state.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/images.dart';
import 'package:pont/pont_bottom_sheet.dart';
import 'package:pont/utils/animations.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/utils/string_extension.dart';

const _tag = 'nft_list_page';

class NftListPage extends StatefulWidget {
  const NftListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NftListPage> createState() => _NftListPageState();
}

class _NftListPageState extends State<NftListPage>
    with AutomaticKeepAliveClientMixin {
  final _cubit = NftListPageCubit();
  late NftListPageState _state;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<NftListPageCubit, NftListPageState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        _state = state;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: _body(),
          ),
        );
      },
    );
  }

  Widget _body() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: <Widget>[
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        _top(),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        _grid(),
      ],
    );
  }

  Widget _top() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _title(),
            _plusButton(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Collection",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
        height: 1.17,
      ),
    );
  }

  Widget _plusButton() {
    return GestureDetector(
      onTap: _onPlusPressed,
      child: PontImage.plus(
        width: 36,
        height: 36,
      ),
    );
  }

  Widget _grid() {
    return SliverGrid.count(
      crossAxisCount: 2,
      children: _state.nftList.map(_nft).toList(),
    );
  }

  Widget _nft(ClientNft nft) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => _onNftPressed(nft),
        child: SizedBox(
          width: 152,
          height: 152,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PontImage.pontCircle(
                width: 152,
                height: 152,
              ),
              if (nft.image.isNotNullOrEmpty)
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: nft.image!,
                    fit: BoxFit.cover,
                    width: 136,
                    height: 136,
                    errorWidget: (
                      BuildContext context,
                      String url,
                      dynamic error,
                    ) {
                      Log.e(_tag,
                          "Error loading image url = $url error = $error");
                      return _placeHolder();
                    },
                  ),
                ),
              AnimatedOpacity(
                opacity: _state.activeNftAddress == nft.address ? 1.0 : 0.0,
                curve: _state.activeNftAddress == nft.address
                    ? Animations.appearCurve
                    : Animations.disappearCurve,
                duration: Animations.duration,
                child: Align(
                  alignment: Alignment.topRight,
                  child: PontImage.check(
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeHolder() {
    return Container();
  }

  void _onPlusPressed() {
    Log.d(_tag, '_onPlusPressed');

    _cubit.plusNft();
  }

  Future<void> _onNftPressed(ClientNft nft) async {
    Log.d(_tag, '_onNftPressed: nft = $nft');

    await showPontBottomSheet(
      context: context,
      child: NftBottomSheet(nft: nft),
    );
  }
}
