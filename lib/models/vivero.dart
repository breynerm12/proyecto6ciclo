class Vivero {
  final id;
  String nombrempresa;
  String propietario;
  String cantorq;
  String contacto;
  String ubicacion;

  Vivero({this.id='', this.nombrempresa='', this.propietario='', this.cantorq='', this.contacto='', this.ubicacion=''});

  factory Vivero.fromJson(Map<String, dynamic> json) {
    return Vivero(
      id: json['id'],
      nombrempresa: json['nombrempresa'],
      propietario: json['propietario'],
      cantorq: json['cantorq'],
      contacto: json['contacto'],
      ubicacion: json['ubicacion'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'nombrempresa': nombrempresa,
    'propietario': propietario,
    'cantorq': cantorq,
    'contacto': contacto,
    'ubicacion': ubicacion,
  };
  @override
  String toString() {
    return 'Vivero{nombrempresa: $nombrempresa, propietario: $propietario, cantorq: $cantorq, contacto: $contacto, ubicacion: $ubicacion}';
  }

}