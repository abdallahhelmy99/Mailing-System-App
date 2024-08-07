class Mail {
  int? recieverID;
  int? senderID;
  int? emailID;
  String? subject;
  String? body;
  String? date;
  String? trash;
  String? important;
  String? spam;
  String? isRead;
  String? isSent;
  String? draft;

  Mail(
      {
      required this.emailID,
      required this.subject,
      required this.body,
      required this.date,
      required this.trash,
      required this.important,
      required this.spam,
      required this.isRead,
      required this.recieverID,
      required this.senderID,
      required this.isSent,
      required this.draft,

      });

  Map<String, dynamic> toMap() {
    return {
      'emailID': emailID,
      'subject': subject,
      'body': body,
      'date': date,
      'trash': trash,
      'important': important,
      'spam': spam,
      'isRead': isRead,
      'senderID': senderID,
      'receiverID': recieverID,
      'isSent': isSent,
      'draft': draft,
      //'contacts': contacts,
    };
  }
}
