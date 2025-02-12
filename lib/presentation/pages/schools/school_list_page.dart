import 'package:champions_chromo_app/domain/entities/school_entity.dart';
import 'package:champions_chromo_app/presentation/pages/albums/school_album_list_page.dart';
import 'package:champions_chromo_app/presentation/pages/cart/cart_icon_button.dart';
import 'package:flutter/material.dart';

class SchoolListPage extends StatelessWidget {
  final List<School> schools = [
    School(
      id: '1',
      name: 'Escola Municipal João Silva',
      address: 'Rua das Flores, 123',
    ),
    School(
      id: '2',
      name: 'Colégio Estadual Maria Santos',
      address: 'Av. Principal, 456',
    ),
    School(
      id: '3',
      name: 'Instituto de Educação Pedro Lima',
      address: 'Praça Central, 789',
    ),
  ];

  SchoolListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecione a escola',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          CartIconButton(),
        ],
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: schools.length,
              itemBuilder: (context, index) {
                final school = schools[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SchoolAlbumListPage(schoolName: school.name),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    school.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    school.address,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
