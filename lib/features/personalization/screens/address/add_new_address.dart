import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.person), labelText: 'Name')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.phone), labelText: 'Phone Number')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.house), labelText: 'Street'))),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.signpost), labelText: 'Postal Code'))),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.location_city), labelText: 'City'))),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.local_activity), labelText: 'State'))),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.language_rounded), labelText: 'Country')),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('Save'))),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
