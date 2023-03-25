import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/product.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  'https://imgs.search.brave.com/1ecaP8O5bPAlR_hozoSs3smcs45tXcLIr0i9ChcV0pA/rs:fit:280:280:1/g:ce/aHR0cHM6Ly9pY2Nv/bnRyb2xzLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvTmV3LVBy/b2R1Y3QtSWNvbi5w/bmc',
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover, frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              }),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: FontSizeSetting.h4),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    product.description,
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: FontSizeSetting.h5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
