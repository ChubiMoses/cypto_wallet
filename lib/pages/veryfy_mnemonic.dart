import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/pages/wallert_page.dart';
import 'package:wallet/provider/wallet_provider.dart';
class VerifyMnemonicPage extends StatefulWidget {
  final String mnemonic;

  const VerifyMnemonicPage({Key? key, required this.mnemonic})
      : super(key: key);

  @override
  _VerifyMnemonicPageState createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  bool isVerified = false;
  String verificationText = '';

  void verifyMnemonic() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    if (verificationText.trim() == widget.mnemonic.trim()) {
      walletProvider.getPrivateKey(widget.mnemonic).then((privateKey) {
        setState(() {
          isVerified = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToWalletPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WalletPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Mnemonic'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               const SizedBox(height: 200.0),
              const Text(
                'Please verify your mnemonic phrase:',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 24.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    verificationText = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText:'Enter mnemonic phrase',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor:
                        Colors.blue, // Customize button background color
                    foregroundColor: Colors.white, // Customize button text color
                    padding: const EdgeInsets.all(16.0),
                  ),
                onPressed: () {
                  verifyMnemonic();
                },
                child: const Text('Verify'),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: isVerified ? navigateToWalletPage : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}