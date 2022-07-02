import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/profile/profile_page_cubit.dart';
import 'package:pont/cubits/profile/profile_page_state.dart';
import 'package:pont/images.dart';
import 'package:pont/pages/login_page.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/widgets/app_menu.dart';
import 'package:url_launcher/url_launcher.dart';

const _tag = 'profile_page';

class ProfilePage extends StatefulWidget {
  static const routeName = 'profile';

  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _cubit = ProfilePageCubit();
  late ProfilePageState _state;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePageCubit, ProfilePageState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        _state = state;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: _body(),
          ),
        );
      },
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _top(),
              const SizedBox(height: 30),
              _wallet(),
              const SizedBox(height: 38),
              _teamTitle(),
              const SizedBox(height: 5),
              _teamSubtitle(),
              const SizedBox(height: 27),
              _team(),
            ],
          ),
        ),
        _menu(),
      ],
    );
  }

  Widget _team() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _teamMember(
          icon: PontImage.otopba1(width: 79, height: 79),
          name: "Developer",
          contact: "otopba1",
        ),
        _teamMember(
          icon: PontImage.idrewha(width: 79, height: 79),
          name: "Designer",
          contact: "idrewha",
        ),
        _teamMember(
          icon: PontImage.emil151997(width: 79, height: 79),
          name: "Engineer",
          contact: "emil151997",
        ),
      ],
    );
  }

  Widget _teamMember({
    required Widget icon,
    required String name,
    required String contact,
  }) {
    return GestureDetector(
      onTap: () => _onContactPressed(contact),
      child: Column(
        children: [
          icon,
          const SizedBox(height: 9),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.45,
              height: 1.27,
            ),
          ),
          const SizedBox(height: 9),
          PontImage.telegram(
            width: 26,
            height: 26,
          ),
        ],
      ),
    );
  }

  Widget _teamSubtitle() {
    return const Text(
      'This project was done at a hackathon in 48 hours. Do you want to talk to us more? Here are the contacts:',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.45,
        height: 1.27,
      ),
    );
  }

  Widget _teamTitle() {
    return const Text(
      'Team',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
        height: 1.9,
      ),
    );
  }

  Widget _wallet() {
    return Container(
      width: double.maxFinite,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: _onAddressPressed,
        child: Row(
          children: [
            Expanded(
              child: Text(
                _state.address,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.45,
                  height: 1.27,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 28),
            PontImage.copy(width: 24, height: 24),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: AppMenu(activeType: AppMenuType.profile),
      ),
    );
  }

  Widget _top() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title(),
        _exitButton(),
      ],
    );
  }

  Widget _title() {
    return const Text(
      "Profile",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
        height: 1.17,
      ),
    );
  }

  Widget _exitButton() {
    return GestureDetector(
      onTap: _onExitPressed,
      child: PontImage.exit(
        width: 36,
        height: 36,
      ),
    );
  }

  Future<void> _onExitPressed() async {
    Log.d(_tag, '_onExitPressed');

    final result = await _cubit.exit();

    Log.d(_tag, '_onExitPressed: result = $result');

    if (!result) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginPage.routeName,
      ModalRoute.withName('/'),
    );
  }

  Future<void> _onAddressPressed() async {
    Log.d(_tag, '_onAddressPressed');

    await Clipboard.setData(
      ClipboardData(text: _state.address),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Address copied')),
    );
  }

  void _onContactPressed(String contact) {
    Log.d(_tag, '_onContactPressed: contact = $contact');

    launchUrl(
      Uri.parse('https://t.me/$contact'),
      mode: LaunchMode.externalApplication,
    );
  }
}
