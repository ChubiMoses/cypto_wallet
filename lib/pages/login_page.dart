import 'package:flutter/material.dart';
import 'package:wallet/pages/create_import_page.dart';
import 'package:wallet/pages/wallert_page.dart';
import 'package:wallet/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      // If private key doesn't exist, load CreateOrImportPage
      return const CreateOrImportPage();
    } else {
      // If private key exists, load WalletPage
      return const WalletPage();
    }
  }
}