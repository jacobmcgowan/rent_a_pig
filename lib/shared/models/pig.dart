/// A pig that can be rented for a job.
class Pig {
  /// The name of the pig.
  String name;

  /// The farmer that is renting the pig out.
  String farmer;

  /// The price of the pig per day.
  double price;

  /// The jobs that the pig can perform.
  List<String> jobs;

  /// The path to the image of the pig.
  String imagePath;


  /// Creates a pig.
  Pig(this.name, this.farmer, this.price, this.jobs, this.imagePath);
}