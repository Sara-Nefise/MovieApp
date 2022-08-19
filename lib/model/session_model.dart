class sessionModel {
  String? sessionId;

  sessionModel({this.sessionId});

  sessionModel.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_id'] = sessionId;
    return data;
  }
}
