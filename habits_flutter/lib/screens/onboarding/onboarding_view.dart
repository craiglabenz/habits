import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_flutter/screens/onboarding/onboarding.dart';
import 'package:habits_flutter/widgets/widgets.dart';

/// {@template OnboardingScreen}
/// Initial Onboarding screen for unknown sessions.
/// {@endtemplate}
class OnboardingScreen extends StatefulWidget {
  /// {@macro OnboardingScreen}
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final OnboardingBloc bloc = OnboardingBloc();

  late TextEditingController _usernameController;
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  bool firstTimeAdvancingPastName = true;
  final children = <Widget Function(OnboardingState)>[];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _usernameController = TextEditingController()..addListener(_setUsername);
    children.addAll([
      (OnboardingState state) => _OnboardingSetUsername(
            controller: _usernameController,
            key: const Key('onboarding-username'),
          ),
      (OnboardingState state) => _OnboardingComplete(
            username: state.username,
            onPressed: _completeOnboarding,
          ),
    ]);
    _tabController = TabController(length: children.length, vsync: this);
    _tabController.addListener(
      () {
        if (firstTimeAdvancingPastName && _tabController.index > 0) {
          firstTimeAdvancingPastName = false;
          bloc.add(const OnboardingEvent.createAccount());
        }
      },
    );
  }

  void _setUsername() => bloc.add(SetUsernameEvent(_usernameController.text));
  void _completeOnboarding() => bloc.add(const OnboardingEvent.complete());

  @override
  Widget build(BuildContext context) {
    return KeyboardHider(
      child: Scaffold(
        appBar: AppBar(title: const Text('Onboarding')),
        body: SafeArea(
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            bloc: bloc,
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    controller: _pageViewController,
                    onPageChanged: _handlePageViewChanged,
                    children: state.username == '' //
                        ? <Widget>[children.first.call(state)]
                        : children
                            .map<Widget>((child) => child.call(state))
                            .toList(),
                  ),
                  if (state.username != '')
                    _PageIndicator(
                      tabController: _tabController,
                      currentPageIndex: _currentPageIndex,
                      onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await bloc.close();
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _OnboardingSetUsername extends StatelessWidget {
  const _OnboardingSetUsername({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text('What is your name?'),
          TextField(
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class _OnboardingComplete extends StatelessWidget {
  const _OnboardingComplete({
    required this.onPressed,
    required this.username,
  });

  final VoidCallback onPressed;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Welcome, $username 🎉',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          OutlinedButton(
            onPressed: onPressed,
            child: Text(
              'Done',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
