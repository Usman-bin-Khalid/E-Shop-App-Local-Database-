import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/custom_appBar.dart';
import '../../model/model_class_product.dart';
class EditProductScreen extends StatefulWidget {
  final ProductModelClass product;
  final ValueChanged<ProductModelClass> onSave;
  const EditProductScreen({
    super.key,
    required this.product,
    required this.onSave,
  });
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}
class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _quantityController;

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title);
    _priceController = TextEditingController(text: widget.product.price.toString());
    _descriptionController = TextEditingController(text: widget.product.description);
    _quantityController = TextEditingController(text: widget.product.quantity.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveChanges() {
    final updatedProduct = ProductModelClass(
      id: widget.product.id,
      image: _selectedImage?.path ?? widget.product.image,
      title: _titleController.text,
      price: int.parse(_priceController.text),
      description: _descriptionController.text,
      quantity: int.parse(_quantityController.text),
    );
    widget.onSave(updatedProduct);
    Navigator.pop(context);
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
                      image: _selectedImage != null
                          ? DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.cover,
                      )
                          : widget.product.image.isNotEmpty
                          ? (widget.product.image.startsWith("assets/images/")
                          ? DecorationImage(
                        image: AssetImage(widget.product.image),
                        fit: BoxFit.cover,
                      )
                          : DecorationImage(
                        image: FileImage(File(widget.product.image)),
                        fit: BoxFit.cover,
                      ))
                          : null,
                    ),
                    child: (_selectedImage == null && widget.product.image.isEmpty)
                        ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, color: Colors.grey),
                          Text("Tap to upload image",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                        : null,
                  ),
                ),
              ),


              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 48,
                  child: TextField(
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      label: Text('Product Name', style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.title,
                            color: Colors.grey,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color is black
                          width: 0.5, // Border width is 0.5px
                        ),
                      ),
                      // Border when the TextField is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColor, // Default color (theme-based)
                          width: 0.5, // Border width remains 0.5px
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 48,
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      label: Text('Product Price', style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.price_check,
                            color: Colors.grey,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color is black
                          width: 0.5, // Border width is 0.5px
                        ),
                      ),
                      // Border when the TextField is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColor, // Default color (theme-based)
                          width: 0.5, // Border width remains 0.5px
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 48,
                  child: TextField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      label: Text('Product Description', style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.description,
                            color: Colors.grey,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color is black
                          width: 0.5, // Border width is 0.5px
                        ),
                      ),
                      // Border when the TextField is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColor, // Default color (theme-based)
                          width: 0.5, // Border width remains 0.5px
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 48,
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      label: Text('Product Quantity', style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.production_quantity_limits,
                            color: Colors.grey,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color is black
                          width: 0.5, // Border width is 0.5px
                        ),
                      ),
                      // Border when the TextField is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColor, // Default color (theme-based)
                          width: 0.5, // Border width remains 0.5px
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveChanges,
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
                            Icon(Icons.edit, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Edit Product',
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
