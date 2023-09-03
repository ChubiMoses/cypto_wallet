import 'package:flutter/material.dart';
import 'package:wallet/pages/generate_mnemonic.dart';
import 'package:wallet/pages/import_wallet.dart';

class CreateOrImportPage extends StatelessWidget {
  const CreateOrImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             const SizedBox(height: 100.0),

            Container(
              alignment: Alignment.center,
              child: const Text(
                'Crypto Wallet',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          
            const SizedBox(height: 200.0),

            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenerateMnemonicPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  backgroundColor:
                      Colors.blue, // Customize button background color
                  foregroundColor: Colors.white, // Customize button text color
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Text(
                  'Create Wallet',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24.0),
             // Register button
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  // Add your register logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImportWallet(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor:
                        Colors.white, // Customize button background color
                    foregroundColor: Colors.black, // Customize button text color
                    padding: const EdgeInsets.all(16.0),
                  ),
                child: const Text(
                  'Login to  Wallet',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}