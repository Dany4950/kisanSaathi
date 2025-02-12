import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/checkout/paymentProvider.dart';
import 'package:provider/provider.dart';

class DropdownPaymentButton extends StatelessWidget {
  const DropdownPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return DropdownButton<String>(
      hint: const Text("Select Payment Method"),
      value: (paymentProvider.selectedPaymentMethod != null &&
              paymentProvider.selectedPaymentMethod!.isNotEmpty)
          ? paymentProvider.selectedPaymentMethod
          : null, // Ensures it does not throw an error if null
      items: const [
        DropdownMenuItem(value: "COD", child: Text("Cash on Delivery (COD)")),
      ],
      onChanged: (value) {
        if (value != null) {
          paymentProvider.setPaymentMethod(value);
        }
      },
    );
  }
}
