class AddDiseaseModel{

  /** These variables hold user inputs **/
  String disease_name = '';
  String description = '';
  String symptoms = '';
  String medication = '';

  save(){
    print('Disease $disease_name saved' );
  }
}