// Model for errands
class KuyaModel {
  String kuya;
  String imagePath;
  String work;
  String location;

  KuyaModel({
    required this.kuya,
    required this.imagePath,
    required this.work,
    required this.location,
  });

  static List<KuyaModel> getkuyas() {
    List<KuyaModel> kuyas = [];

    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Shai', 
        imagePath: 'assets/icons/shai.png',
        work: 'Tech Specialist',
        location: 'San Fernando, Pampanga',
      )
    );


    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Rocky', 
        imagePath: 'assets/icons/asap.png',
        work: 'Cleaner',
        location: 'Mabalacat, Pampanga',
      )
    );

    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Ye', 
        imagePath: 'assets/icons/ye.png',
        work: 'Shopping God',
        location: 'Angeles City, Pampanga',
      )
    );

    kuyas.add(
      KuyaModel(
        kuya: 'Kuya Bron', 
        imagePath: 'assets/icons/lebron.png',
        work: 'Pet Sitter',
        location: 'Porac, Pampanga',
      ),
    );
    return kuyas;
  }
}