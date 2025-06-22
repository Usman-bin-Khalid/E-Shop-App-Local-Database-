// import 'package:flutter/material.dart';
// import 'package:newzler/model/model_class_product.dart';
//
// import '../../model/custom_appBar.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   final List<ProductModelClass> favoriteProducts;
//   final Function(ProductModelClass) onRemoveFavorite;
//
//   const FavoriteScreen(
//       {super.key,
//       required this.favoriteProducts,
//       required this.onRemoveFavorite});
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   backgroundColor: Colors.white,
//       //   title: Text(
//       //     "Favourite Products",
//       //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       appBar: CustomAppBar(
//         title: "Favorite Products",
//         backgroundColor: Colors.white,
//       ),
//       body: widget.favoriteProducts.isEmpty
//           ? Center(child: Text('No favorite products'))
//           : Expanded(
//               child: ListView.builder(
//                 itemCount: widget.favoriteProducts.length,
//                 itemBuilder: (context, index) {
//                   final product = widget.favoriteProducts[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Card(
//                       child: ListTile(
//                         leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(25),
//                             child: Image.asset(product.image,
//                                 width: 50, height: 50)),
//                         title: Text(product.title),
//                         subtitle: Text(
//                           'Price: Rs ${product.price} PKR',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         trailing: IconButton(
//                             onPressed: () {
//                               widget.favoriteProducts.removeAt(index);
//                               setState(() {});
//                               widget.onRemoveFavorite(product);
//                             },
//                             icon: Icon(
//                               Icons.favorite,
//                               color: Colors.red,
//                             )),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newzler/model/model_class_product.dart';

import '../../model/custom_appBar.dart';

class FavoriteScreen extends StatefulWidget {
  final List<ProductModelClass> favoriteProducts;
  final Function(ProductModelClass) onRemoveFavorite;

  const FavoriteScreen({
    super.key,
    required this.favoriteProducts,
    required this.onRemoveFavorite,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  /// Determines the appropriate ImageProvider for the given image path.
  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('assets/')) {
      return AssetImage(imagePath);
    } else {
      return FileImage(File(imagePath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Favorite Products",
        backgroundColor: Colors.white,
      ),
      body: widget.favoriteProducts.isEmpty
          ? Center(
        child: Text(
          'No favorite products',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      )
          : ListView.builder(
        itemCount: widget.favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = widget.favoriteProducts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                    image: _getImageProvider(product.image),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  product.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Price: Rs ${product.price} PKR',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.favoriteProducts.removeAt(index);
                      widget.onRemoveFavorite(product);
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
