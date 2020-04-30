import 'dart:ffi';

class ClubComment {
  //variables
  int intId;
  int intClubId;
  int intUserId;
  String strTitle;
  String strBody;
  String strStatus;
  String strDatetime;

  // método construtor da classe
  ClubComment(
      {this.intId,
      this.intClubId,
      this.intUserId,
      this.strTitle,
      this.strBody,
      this.strStatus,
      this.strDatetime});

  // Método que pega os dados do arquivo Json dos comentarios sobre o club
  ClubComment.fromJsonClubComment(Map<String, dynamic> json) {
    this.intId = json['id'];
    this.intClubId = json['club_id'];
    this.intUserId = json['user_id'];
    this.strTitle = json['club_comment_title'];
    this.strBody = json['club_comment_body'];
    this.strStatus = json['club_comment_status'];
    this.strDatetime = json['club_comment_datetime'];
  }

  //Método que constroi o arquivo Json dos comentarios sobre o club
  Map<String, dynamic> toJsonClubComment() {
    final Map<String, dynamic> dataClubComment = new Map<String, dynamic>();
    dataClubComment['id'] = this.intId;
    dataClubComment['club_id'] = this.intClubId;
    dataClubComment['user_id'] = this.intUserId;
    dataClubComment['club_comment_title'] = this.strTitle;
    dataClubComment['club_comment_body'] = this.strBody;
    dataClubComment['club_comment_status'] = this.strStatus;
    dataClubComment['club_comment_datetime'] = this.strDatetime;
    return dataClubComment;
  }
}
