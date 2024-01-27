import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/landscape.jpg',
          ),
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                _buildProfileImage(),
                _buildProfilDetails(),
                _buildProfileActions()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile-image.jpg',
            fit: BoxFit.fitWidth,
            scale: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildProfilDetails() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Manuel Montolio',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _ratingBar(),
          const SizedBox(
            height: 10,
          ),
          _buildDetaillRow('Degree', 'Software Ing.'),
          _buildDetaillRow('Experience', '12')
        ],
      ),
    );
  }

  RatingBar _ratingBar() {
    return RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget _buildProfileActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(Icons.sports_baseball, 'Sports'),
        _buildIcon(Icons.computer_rounded, 'Technologies'),
        _buildIcon(Icons.gamepad, 'Games'),
      ],
    );
  }

  Widget _buildDetaillRow(String lable, String value) {
    return Row(
      children: [
        Text('$lable: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value)
      ],
    );
  }

  Widget _buildIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          Text(label)
        ],
      ),
    );
  }
}
