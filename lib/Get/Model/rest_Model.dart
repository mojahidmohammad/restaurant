class restaurants {
  int id;
  String name;
  String cuisine;
  int rate;
  String status;
  String prices;
  List<TopComments> topComments;
  List<String> images;

  restaurants(
      {this.id,
        this.name,
        this.cuisine,
        this.rate,
        this.status,
        this.prices,
        this.topComments,
        this.images});

  restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json[0]['name'];
    cuisine = json['cuisine'];
    rate = json['rate'];
    status = json['status'];
    prices = json['prices'];
    if (json['top_comments'] != null) {
      topComments = new List<TopComments>();
      json['top_comments'].forEach((v) {
        topComments.add(new TopComments.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cuisine'] = this.cuisine;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['prices'] = this.prices;
    if (this.topComments != null) {
      data['top_comments'] = this.topComments.map((v) => v.toJson()).toList();
    }
    data['images'] = this.images;
    return data;
  }
}

class TopComments {
  String body;

  TopComments({this.body});

  TopComments.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    return data;
  }
}