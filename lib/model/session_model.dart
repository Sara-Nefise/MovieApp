class sessionModel {
  String? sessionId;

  sessionModel({this.sessionId});

  sessionModel.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    return data;
  }
}
