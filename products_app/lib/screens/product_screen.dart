import 'package:flutter/material.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
                Positioned(
                  top: 60,
                  left: 30,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new, size: 40,)
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 30,
                  child: IconButton(
                      onPressed: () {
                        // Cam logic goes here
                      },
                      icon: const Icon(Icons.camera_alt_rounded, size: 40,)
                  ),
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  }, // ToDo saving logic to firebase
        child: const Icon(Icons.save_as_outlined,
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _boxDecoration(),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecorations.inputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.inputDecoration(labelText: 'Price'),
                ),
                const SizedBox(height: 30,),
                SwitchListTile.adaptive(
                  title: const Text('Available'),
                  activeColor: Colors.indigo,
                  value: true, 
                  onChanged: (value) { } // Implement switch logic
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0,5),
        blurRadius: 5,
      ),
    ],
  );
}
