import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'userId', defaultValue: 0)
  int userId;

  /// 昵称
  @JsonKey(name: 'nickname', defaultValue: '')
  String nickname;

  /// 真是姓名
  @JsonKey(name: 'name', defaultValue: '')
  String name;

  ///用户类型 4是渠道
  @JsonKey(name: 'kind', defaultValue: 2)
  int kind;

  @JsonKey(name: 'avatar', defaultValue: '')
  String avatar;

  @JsonKey(name: 'avatarKey', defaultValue: '')
  String avatarKey;

  @JsonKey(name: 'gender', defaultValue: 0)
  int gender;

  @JsonKey(name: 'position', defaultValue: '')
  String position;

  @JsonKey(name: 'followNumber', defaultValue: 0)
  int followNumber;

  @JsonKey(name: 'fanNumber', defaultValue: 0)
  int fanNumber;

  @JsonKey(name: 'feedNumber', defaultValue: 0)
  int feedNumber;

  @JsonKey(name: 'projectLikeNumber', defaultValue: 0)
  int projectLikeNumber;

  @JsonKey(name: 'feedLikeNumber', defaultValue: 0)
  int feedLikeNumber;

  @JsonKey(name: 'courseLikeNumber', defaultValue: 0)
  int courseLikeNumber;

  @JsonKey(name: 'newsLikeNumber', defaultValue: 0)
  int newsLikeNumber;

  @JsonKey(name: 'projectNumber', defaultValue: 0)
  int projectNumber;

  @JsonKey(name: 'birthday', defaultValue: '')
  String birthday;

  @JsonKey(name: 'city', defaultValue: '')
  String city;

  @JsonKey(name: 'cityName', defaultValue: '')
  String cityName;

  @JsonKey(name: 'signature', defaultValue: '')
  String signature;

  @JsonKey(name: 'company', defaultValue: '')
  String company;

  @JsonKey(name: 'companyAddress', defaultValue: '')
  String companyAddress;

  @JsonKey(name: 'unreadNumber', defaultValue: 0)
  int unreadNumber;

  @JsonKey(name: 'mobile', defaultValue: '')
  String mobile;

  @JsonKey(name: 'a2b', defaultValue: false)
  bool a2b;

  @JsonKey(name: 'b2a', defaultValue: false)
  bool b2a;

  @JsonKey(name: 'isMySelf', defaultValue: false)
  bool isMySelf;

  @JsonKey(name: 'isNew', defaultValue: false)
  bool isNew;

  @JsonKey(name: 'encryptedMobile', defaultValue: '')
  String encryptedMobile;

  @JsonKey(name: 'prompt', defaultValue: '')
  String prompt;

  @JsonKey(name: 'canEditName', defaultValue: false)
  bool canEditName;

  @JsonKey(name: 'shareUrl', defaultValue: '')
  String shareUrl;

  @JsonKey(name: 'passwordStatus', defaultValue: false)
  bool passwordStatus;

  @JsonKey(name: 'info', defaultValue: [])
  List<String> info;

  @JsonKey(name: 'isProfession', defaultValue: false)
  bool isProfession;

  @JsonKey(name: 'isRealName', defaultValue: false)
  bool isRealName;

  @JsonKey(name: 'isBindApple', defaultValue: false)
  bool isBindApple;

  @JsonKey(name: 'isBindWechat', defaultValue: false)
  bool isBindWechat;

  @JsonKey(name: 'isMaster', defaultValue: false)
  bool isMaster;

  @JsonKey(name: 'hasMP', defaultValue: false)
  bool hasMP;

  /// 供应商名字
  @JsonKey(name: 'supplierName', defaultValue: '')
  String supplierName;

  @JsonKey(name: 'vipKind', defaultValue: 0)
  // 0普通设计师3渠道用户
  int vipKind;

  @JsonKey(name: 'vipIcon', defaultValue: '')
  String vipIcon;

  @JsonKey(name: 'newProjectNum', defaultValue: 0)
  int newProjectNum;

  @JsonKey(name: 'jurisdiction', defaultValue: '')
  String jurisdiction;

  @JsonKey(name: 'auditStatus', defaultValue: 0)
  //资料审核状态
  int auditStatus;

  User({
    this.id,
    this.userId,
    this.nickname,
    this.name,
    this.kind,
    this.avatar,
    this.avatarKey,
    this.gender,
    this.position,
    this.followNumber,
    this.fanNumber,
    this.feedNumber,
    this.birthday,
    this.city,
    this.cityName,
    this.signature,
    this.company,
    this.companyAddress,
    this.unreadNumber,
    this.mobile,
    this.a2b,
    this.b2a,
    this.isMySelf,
    this.isNew,
    this.encryptedMobile,
    this.prompt,
    this.canEditName,
    this.info,
    this.isBindApple,
    this.isBindWechat,
    this.isMaster,
    this.hasMP,
    this.supplierName,
    this.vipKind,
    this.vipIcon,
    this.newProjectNum,
    this.jurisdiction,
    this.auditStatus,
    this.courseLikeNumber,
    this.newsLikeNumber,
    this.feedLikeNumber,
    this.projectLikeNumber,
  });

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
