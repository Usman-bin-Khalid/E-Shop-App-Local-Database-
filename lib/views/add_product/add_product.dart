// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../model/custom_appBar.dart';
// import '../../model/model_class_product.dart';
//
// class AddProduct extends StatefulWidget {
//   final int imageIndex;
//   final String productImage;
//
//   AddProduct({Key? key, required this.imageIndex, required this.productImage})
//       : super(key: key);
//
//   @override
//   State<AddProduct> createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//
//   void _saveProduct() {
//     if (_nameController.text.isEmpty ||
//         _descriptionController.text.isEmpty ||
//         _priceController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please fill all fields")),
//       );
//       return;
//     }
//
//     // Use the passed product image
//     final newProduct = ProductModelClass(
//       id: DateTime.now().millisecondsSinceEpoch,
//       // Unique ID
//       title: _nameController.text.trim(),
//       description: _descriptionController.text.trim(),
//       price: int.tryParse(_priceController.text.trim()) ?? 0,
//       image: widget.productImage,
//       // Image from the existing productList
//       quantity: 1,
//     );
//
//     Navigator.pop(context, newProduct);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//         title: "Add Product",
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28),
//                 child: Container(
//                   width: double.infinity,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//                       hintText: 'Name',
//                       hintStyle: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: Icon(Icons.title, color: Colors.grey),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.black, width: 0.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(
//                             color: Theme.of(context).primaryColor, width: 0.5),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 1,
//                   height: 95.5,
//                   child: TextField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: 4,
//                     // Allows text to wrap and go to the next line
//                     minLines: 1,
//                     controller: _descriptionController,
//                     // decoration: InputDecoration(hintText: "Edit your message"),
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//                       hintText: 'Description',
//                       hintStyle: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: Icon(Icons.description, color: Colors.grey),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.black, width: 0.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(
//                             color: Theme.of(context).primaryColor, width: 0.5),
//                       ),
//                     ),
//
//                     // scrollPadding: EdgeInsets.all(20),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28),
//                 child: Container(
//                   width: double.infinity,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TextField(
//                     keyboardType: TextInputType.number,
//                     controller: _priceController,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//                       hintText: 'Price',
//                       hintStyle: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                       prefixIcon: Icon(Icons.price_check, color: Colors.grey),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.black, width: 0.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(
//                             color: Theme.of(context).primaryColor, width: 0.5),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28.0),
//                 child: Container(
//                   height: 300,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(widget.productImage.toString()),
//                           fit: BoxFit.fill),
//                       borderRadius: BorderRadius.circular(10)),
//                   margin: EdgeInsets.symmetric(horizontal: 6),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _saveProduct,
//                     child: Ink(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Color(0xff6a11cb), Color(0xff2575fc)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.white, width: 1),
//                       ),
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.add_box, color: Colors.white),
//                             SizedBox(width: 10),
//                             Text(
//                               'Add Product',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       maximumSize: Size(double.infinity, 48),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/custom_appBar.dart';
import '../../model/model_class_product.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveProduct() {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _quantityController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields and select an image")),
      );
      return;
    }

    // Create new product with user-uploaded image
    final newProduct = ProductModelClass(
      id: DateTime.now().millisecondsSinceEpoch, // Unique ID
      title: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      price: int.tryParse(_priceController.text.trim()) ?? 0,
      image: _selectedImage!.path, // Save image path
      quantity: int.tryParse(_quantityController.text.trim()) ?? 1,
    );

    Navigator.pop(context, newProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Add Product",
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: _selectedImage != null
                        ? Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    )
                        : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, color: Colors.grey),
                          Text("Tap to upload image",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.title, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Price',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.price_check, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _quantityController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Quantity',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.production_quantity_limits, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 95.5,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    minLines: 1,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.description, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveProduct,
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_box, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Add Product',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      maximumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
