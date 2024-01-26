import 'package:rick_morty/infrastructure/models/character_model.dart';

class CharacterResponse {
    final Info info;
    final List<CharacterModel> results;

    CharacterResponse({
        required this.info,
        required this.results,
    });

    factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        info: Info.fromJson(json["info"]),
        results: List<CharacterModel>.from(json["results"].map((x) => CharacterModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    final int count;
    final int pages;
    final String? next;
    final String? prev;

    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}



