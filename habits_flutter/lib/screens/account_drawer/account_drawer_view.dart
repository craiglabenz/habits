import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:app_client/app_client.dart';
import 'package:app_shared/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habits_flutter/screens/account_drawer/account_drawer.dart';

/// {@template AccountDrawer}
/// Main Scaffold drawer for logged in users.
/// {@endtemplate}
class AccountDrawer extends StatefulWidget {
  /// {@macro AccountDrawer}
  const AccountDrawer({super.key});

  @override
  State<AccountDrawer> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends State<AccountDrawer> {
  final bloc = AccountDrawerBloc();

  @override
  void initState() {
    bloc.add(const InitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authRepo = GetIt.I<BaseAuthRepository<AuthUser>>();
    final user = authRepo.lastUser.$1;
    return Drawer(
      child: BlocBuilder<AccountDrawerBloc, AccountDrawerState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(user.id),
              ),
              const ListTile(
                title: Text('Timezone'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: _TimezoneDropdown(
                  selected: state.user?.timezone,
                  onChanged: (Timezone? tz) => bloc.add(SetTimezoneEvent(tz)),
                ),
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: authRepo.logOut,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TimezoneDropdown extends StatelessWidget {
  const _TimezoneDropdown({required this.onChanged, required this.selected});

  final void Function(Timezone?) onChanged;
  final String? selected;

  @override
  Widget build(BuildContext context) {
    final timezoneRepository = GetIt.I<TimezoneRepository>();

    return CustomDropdown<Timezone>.search(
      hintText: 'Select timezone',
      items: timezoneRepository.timezones,
      overlayHeight: 342,
      onChanged: onChanged,
      initialItem: selected != null //
          ? timezoneRepository.findByName(selected!)
          : null,
      listItemBuilder: (context, timezone, isSelected, onItemSelect) {
        return Text(timezone.display);
      },
      headerBuilder: (context, timezone) {
        return Text(timezone.displayName);
      },
    );
  }
}
