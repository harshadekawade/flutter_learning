class BirdsDataModel {
  //data Type
  int? id;
  String? name;
  String? imageURL;
  String? description;

  // constructor
  BirdsDataModel({this.id, this.name, this.imageURL, this.description});

  //method that assign values to respective datatype variables
  BirdsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageURL = json['imageUrl'];
    description = json['description'];
  }
}

List<BirdsDataModel> birdsList = [
  BirdsDataModel(
      id: 0,
      name: "Peacock",
      imageURL:
          'https://images.pexels.com/photos/4475253/pexels-photo-4475253.jpeg',
      description:
          "Peacocks are a type of large pheasant known for their beautiful colored feathers. Their tail feathers, also called coverts, make up more than 60 percent of the birds total body length, with only males having the colorful blue and green iridescent feathers."),
  BirdsDataModel(
      id: 1,
      name: "Duck",
      imageURL:
          'https://images.pexels.com/photos/7025579/pexels-photo-7025579.jpeg',
      description:
          "The stereotypical “duck” has a torpedo shaped body, rounded head, and a slightly flattened and rounded bill. Some species are quite small, while others are larger, but they are smaller than geese and swans."),
  BirdsDataModel(
      id: 2,
      name: "Hen",
      imageURL:
          'https://images.pexels.com/photos/1405930/pexels-photo-1405930.jpeg',
      description:
          "A hen is a female chicken. People often keep hens in order to eat them or sell their eggs. The female of any bird can be referred to as a hen."),
  BirdsDataModel(
      id: 3,
      name: "Cock",
      imageURL:
          'https://images.pexels.com/photos/1769271/pexels-photo-1769271.jpeg',
      description:
          "Rooster or cock is a term for an adult male bird, and younger male may be called a cockerel. A male that has been castrated is a capon. ... There are more chickens in the world than any other bird."),
  BirdsDataModel(
      id: 4,
      name: "Swan",
      imageURL:
          'https://images.pexels.com/photos/8224249/pexels-photo-8224249.jpeg',
      description:
          "Swans are gracefully long-necked, heavy-bodied, big-footed birds that glide majestically when swimming and fly with slow wingbeats and with necks outstretched.\n"),
  BirdsDataModel(
      id: 5,
      name: "Parrot",
      imageURL:
          'https://images.pexels.com/photos/1661179/pexels-photo-1661179.jpeg',
      description:
          "Parrots are birds of the order Psittaciformes. ... Parrots are intelligent birds. They have relatively large brains, they can learn, and they can use simple tools. Because some species have the ability to make sounds like human voices and have plumages with bright colors, many species are kept as pets."),
  BirdsDataModel(
      id: 6,
      name: "Cuckoo",
      imageURL:
          'https://images.pexels.com/photos/7025579/pexels-photo-7025579.jpeg',
      description:
          "a largely grayish-brown European bird (Cuculus canorus) that is a parasite given to laying its eggs in the nests of other birds which hatch them and rear the offspring broadly : any of a large family (Cuculidae of the order Cuculiformes) to which this bird belongs."),
  BirdsDataModel(
      id: 7,
      name: "Sparrow",
      imageURL:
          'https://images.pexels.com/photos/326900/pexels-photo-326900.jpeg',
      description:
          "A sparrow is a member of the genus Passer. They are small passerine birds which belong to the family Passeridae. They are also known as old-world sparrows. Sparrows often make their nests near houses or buildings. This means they are one of the easiest birds to see in the wild."),
  BirdsDataModel(
      id: 8,
      name: "Crow",
      imageURL:
          'https://images.pexels.com/photos/802255/pexels-photo-802255.jpeg',
      description:
          "Crows are black birds known for their intelligence and adaptability, and for their loud, harsh \"caw.\""),
  BirdsDataModel(
      id: 9,
      name: "Eagle",
      imageURL:
          'https://images.pexels.com/photos/632452/pexels-photo-632452.jpeg',
      description:
          "Eagles are large, powerful Birds of Prey. ... An Eagle may resemble a Vulture in build and flight characteristics but has a fully feathered (often crested) head and strong feet equipped with great curved talons.")
];
