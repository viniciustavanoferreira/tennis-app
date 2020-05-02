import 'dart:ffi';

class UserNotification {
  //variables
  int intId;
  int intUserId;
  String strTitle;
  String strBody;
  String strDate;
  String strStatus;
  String strReturn;

  // método construtor da classe
  UserNotification(
      {this.intId,
      this.intUserId,
      this.strTitle,
      this.strBody,
      this.strDate,
      this.strStatus,
      this.strReturn});

  // Método que pega os dados do arquivo Json
  UserNotification.fromJsonUserNotification(Map<String, dynamic> json) {
    this.intId = json['id'];
    this.intUserId = json['user_id'];
    this.strTitle = json['user_notification_title'];
    this.strBody = json['user_notification_body'];
    this.strDate = json['user_notification_date'];
    this.strStatus = json['user_notification_status'];
    this.strReturn = json['user_notification_return'];
  }

  //Método que constroi o arquivo Json
  Map<String, dynamic> toJsonUserNotification() {
    final Map<String, dynamic> dataUserNotification =
        new Map<String, dynamic>();
    dataUserNotification['id'] = this.intId;
    dataUserNotification['user_id'] = this.intUserId;
    dataUserNotification['user_notification_title'] = this.strTitle;
    dataUserNotification['user_notification_body'] = this.strBody;
    dataUserNotification['user_notification_date'] = this.strDate;
    dataUserNotification['user_notification_status'] = this.strStatus;
    dataUserNotification['user_notification_return'] = this.strReturn;
    return dataUserNotification;
  }
}
