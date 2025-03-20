class ResponseCitation {
  int status;
  List<Citation> citation;

  ResponseCitation({required this.status, required this.citation});

  Map<String, dynamic> toMap() {
    return {'status': this.status, 'citation': this.citation};
  }

  factory ResponseCitation.fromMap(Map<String, dynamic> map) {
    return ResponseCitation(
      status: map['status'] as int,
      citation:
          (map['citation'] as List)
              .map((cit) => Citation.fromMap(cit))
              .toList(),
    );
  }
}

class Citation {
  String citation;
  String saison;
  String personnage;

  Citation({
    required this.citation,
    required this.saison,
    required this.personnage,
  });

  Map<String, dynamic> toMap() {
    return {
      'citation': this.citation,
      'saison': this.saison,
      'personnage': this.personnage,
    };
  }

  factory Citation.fromMap(Map<String, dynamic> map) {
    return Citation(
      citation: map['citation'] as String,
      saison: map['infos']['saison'] as String,
      personnage: map['infos']['personnage'] as String,
    );
  }
}
