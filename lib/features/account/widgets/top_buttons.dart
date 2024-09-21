import 'package:flutter/material.dart';
import 'package:nexamart/features/account/services/account_services.dart';
import 'package:nexamart/features/account/widgets/account_button.dart';
import 'package:nexamart/features/auth/screens/auth_screen.dart';
import 'package:nexamart/provider/user_provider.dart';
import 'package:provider/provider.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  final AccountServices accountServices = AccountServices();

  void navigateToAuthScreen() {
    Navigator.pushNamed(
      context,
      AuthScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: () {}),
            AccountButton(text: 'Turn seller', onTap: () {})
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            userProvider.user.token.isNotEmpty
                ? AccountButton(
                    text: 'Logout',
                    onTap: () => accountServices.logout(context),
                  )
                : AccountButton(
                    onTap: () => navigateToAuthScreen(),
                    text: 'Login',
                  ),
            AccountButton(text: 'Your Wish List', onTap: () {})
          ],
        )
      ],
    );
  }
}
