import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: cardBoxDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: const [
            _BackgroundImage(),
            _ProductDetails(),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag()
            ),

            // Show this conditionaly
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable()
            ),
          ]
        ),
      ),
    );
  }

  BoxDecoration cardBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 10
          ),
        ],
      );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Not Available', style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$123.99', style: TextStyle(color: Colors.white, fontSize: 20),),
        )
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _boxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hard Drive', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow:  TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text('ID', style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() =>  const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
  );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
          placeholder: AssetImage('assets/no-image.png'), 
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
