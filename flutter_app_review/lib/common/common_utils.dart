import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:common_utils/common_utils.dart' as CommonUtils;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:device_id/device_id.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

const Map<int, String> ROLE_MAP = {
  0: "ROLE_INIT", //未激活
  1: "ROLE_USER", //店长
  2: "ROLE_MANAGER", //店主，老板
  3: "ROLE_FACILICATION", //一级服务商
  4: "ROLE_REFERRER", //推荐人
  7: "ROLE_USER_CLERK", //普通店员
  8: "ROLE_SUB_FACI", //子服务商
  16: "ROLE_ASSISTANT", //运维
  17: "ROLE_ASSISTANT_MANAGER", //运维经理
  21: "ROLE_ACCOUNTANT", //会计
  40: "BRANDER_ADMIN", //品牌商
  41: "BRANDER_GENERAL", //品牌商普通用户
  127: "ROLE_ADMIN", //管理员
  1001: "ROLE_SELLER_ADMIN", //商户操盘手
  1002: "ROLE_SELLER_PM", //商户产品经理
  1003: "ROLE_SELLER_FM", //商户财务
  1100: "ROLE_SELLER_REGION_MANAGER", //商户区域经理
  1101: "ROLE_SELLER_REGION_ASSISTANT", //商户区域助理
};

const Map<int, String> ROLE_LIST_MAP = {
  0: "未激活", //未激活
  1: "店长", //店长
  2: "Boss", //店主，老板
  3: "一级服务商", //一级服务商
  4: "推荐人", //推荐人
  7: "店员", //普通店员
  8: "子服务商", //子服务商
  16: "运维", //运维
  17: "运维经理", //运维经理
  21: "会计", //会计
  40: "品牌商", //品牌商
  41: "品牌商用户", //品牌商普通用户
  127: "管理员", //管理员
  1001: "操盘手", //商户操盘手
  1002: "产品经理", //商户产品经理
  1003: "财务", //商户财务
  1100: "区域经理", //商户区域经理
  1101: "区域助理", //商户区域助理
};

const Map<String, String> ROLE_STR_MAP = {
  "ROLE_INIT": "",
  "ROLE_USER": "店长",
  "ROLE_MANAGER": "老板",
  "ROLE_FACILICATION": "一级服务商",
  "ROLE_REFERRER": "推荐人",
  "ROLE_USER_CLERK": "店员",
  "ROLE_SUB_FACI": "子服务商", //子服务商
  "ROLE_ASSISTANT": "运维", //运维
  "ROLE_ASSISTANT_MANAGER": "运维经理", //运维经理
  "ROLE_ACCOUNTANT": "会计", //会计
  "BRANDER_ADMIN": "品牌商", //品牌商
  "BRANDER_GENERAL": "品牌商普通用户", //品牌商普通用户
  "ROLE_ADMIN": "管理员", //管理员
  "ROLE_SELLER_ADMIN": "操盘手", //商户操盘手
  "ROLE_SELLER_PM": "产品经理", //商户产品经理
  "ROLE_SELLER_FM": "财务", //商户财务
  "ROLE_SELLER_REGION_MANAGER": "区域经理", //商户区域经理
  "ROLE_SELLER_REGION_ASSISTANT": "区域助理", //商户区域助理
};

//判断角色权限
String checkRolePermission(int roleId) {
  String roleName = ROLE_MAP[roleId] ?? 'ROLE_INIT';
  switch (roleName) {
    case "ROLE_USER":
      return "MANAGER";
    case "ROLE_MANAGER":
    case "ROLE_SELLER_ADMIN":
    case "ROLE_SELLER_PM":
    case "ROLE_SELLER_FM":
      return "BOSS";
    case "ROLE_SELLER_REGION_MANAGER":
    case "ROLE_SELLER_REGION_ASSISTANT":
      return "REGION";
    case "ROLE_USER_CLERK":
      return "USER";
    default:
      return "OTHER";
  }
}

const double mjsToolbarHeight = 44.0;

///段位图标
const Map<String, String> divisionIconsMap = {
  "S+": "images/king_division.png",
  "S": "images/master_division.png",
  "A+": "images/diamond_division.png",
  "A": "images/platnum_division.png",
  "B+": "images/gold_division.png",
  "B": "images/silver_division.png",
  "C": "images/bronze_division.png",
  "--": ""
};

///冠军亚军季军图片
const Map<String, String> top3Images = {
  "1": "images/No1_crown.png",
  "2": "images/No2_crown.png",
  "3": "images/No3_crown.png",
};

///手机号正则
///'^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$'
const phoneReg = '^(1)\\d{10}\$';

///ip地址正则
const ipReg = "^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\$";

///收款金额正则
const payMoneyReg = "(^(\\d{0,8})?(\\.\\d{0,2})?\$)|(^(d{0,8})\$)";

///购物袋收款金额正则
const inspectionPayMoneyReg = "(^(\\d{0,6})?(\\.\\d{0,2})?\$)|(^(d{0,6})\$)";

//数字字母转换
const LETTERS = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

/// 是否为true
bool isTrue(var data) {
  return !isEmpty(data) && data.toString().toLowerCase() == 'true';
}

/// 转换为int
int toInt(var data) {
  return int.tryParse(data?.toString()) ?? 0;
}

/// 转换为double
double toDouble(var data) {
  return double.tryParse(data?.toString()) ?? 0.0;
}

//格式化小数转为字符串,默认保留两位
String formatDoubleToStr(double data, {int fixedNum = 2}) {
  if (data != null && "$data".contains(".")) {
    String _decimal = "$data".split(".")[1];
    if (_decimal.length <= fixedNum) {
      return "$data";
    } else {
      return "${data.toStringAsFixed(fixedNum)}";
    }
  }
  return "--";
}

//double型转为百分比字符串
String doubleToPercentStr(double doubleNum, {bool isFloor = true, int fixedNum = 2}) {
  String percentStr = '--';
  if (doubleNum != null && doubleNum >= 0) {
    String _tempNum = '${(doubleNum * 100)}';
    if (_tempNum.split(".").length <= 1 || _tempNum.split(".")[1] == "0") {
      int _intPercent = int.tryParse('${_tempNum.split(".")[0]}');
      percentStr = "$_intPercent%";
    } else if (isFloor) {
      int dotIndex = _tempNum.indexOf(".");
      if (_tempNum.length > dotIndex + fixedNum) {
        percentStr = _tempNum.substring(0, dotIndex + 1 + fixedNum) + "%";
      } else {
        percentStr = (doubleNum * 100).toStringAsFixed(fixedNum) + '%';
      }
    } else {
      percentStr = (doubleNum * 100).toStringAsFixed(fixedNum) + '%';
    }
    return percentStr;
  }
  return percentStr;
}

bool judgeTime(String time) {
  if (time != null && time.length > 0) {
    DateFormat format = new DateFormat('yyyy-MM-dd HH:mm:ss');
    var parse = format.parse(time);
    return parse.add(new Duration(days: 2)).millisecondsSinceEpoch < DateTime.now().millisecondsSinceEpoch;
  }
  return false;
}

bool comparedTime(DateTime m, DateTime n) {
  DateFormat format = new DateFormat('yyyy-MM-dd');
  if (format.format(m) == format.format(n)) {
    return true;
  } else {
    return false;
  }
}

int getNowYear() {
  DateFormat format = new DateFormat('yyyy');
  return toInt(format.format(DateTime.now()));
}

/// MDF5 加密
String md5Encode(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

/// 检查时间是否在未来
bool checkDateIsFuture(DateTime t) {
  return t.millisecondsSinceEpoch > DateTime.now().millisecondsSinceEpoch;
}

/// 检查时间是否在以前
bool checkDateIsPass(DateTime t) {
  return t.millisecondsSinceEpoch < DateTime.now().millisecondsSinceEpoch;
}

/// 检查时间t1是否大于t2
bool checkDateIsLarger(DateTime t1, DateTime t2) {
  return t1.millisecondsSinceEpoch > t2.millisecondsSinceEpoch;
}

/// 格式化时间为 2018/1/1 1:1:1格式
String parseDate(DateTime t) {
  initializeDateFormatting("zh_CN", null).then((_) => {});
  DateFormat format = new DateFormat('yyyy/MM/dd HH:mm:ss');
  return format.format(t);
}

String parseDateFrom(DateTime t) {
  initializeDateFormatting("zh_CN", null).then((_) => {});
  DateFormat format = new DateFormat('yyyy-MM-dd HH:mm:ss');
  return format.format(t);
}

/// 格式化时间为 2018/1/1 1:1:1格式
String parseDateTime(DateTime t) {
  initializeDateFormatting("zh_CN", null).then((_) => {});
  DateFormat format = new DateFormat('yyyy-MM-dd HH:mm');
  return format.format(t);
}

/// 获取device id
Future<String> getDeviceId() async {
  // IOS下获取device id 会报错
  return await DeviceId.getID ?? '0000000000000000';
  // return Platform.isIOS ? 'ios' : await DeviceId.getID ?? '0000000000000000';
}

//Future<String> platformVersion() async {
//  return version;
//}
//
//Future<String> projectVersion() async {
//  return version;
//}

Future<String> hardWareVersion() async {
  DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    return iosInfo.model;
  } else if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    return androidDeviceInfo.model;
  }
}

Future<String> softWareVersion() async {
  DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    return iosInfo.systemVersion;
  } else if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.version.release;
  }
}

Future<Null> launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}

//获取字符串长度，中文字符长度为2
int getStringPhysicLength(String val) {
  if (val != null && val.isNotEmpty) {
    int len = 0;
    for (int i = 0; i < val.length; i++) {
      if (utf8.encode(val[i]).length == 1) {
        len++;
      } else if (utf8.encode(val[i]).length == 3) {
        len += 2;
      }
    }
    return len;
  }
  return 0;
}

//根据当前版本号和库里的版本判断是否需要更新
bool checkVersionNeedUpdate({String currentVer, String updateVer}) {
  bool isNeed = false;
  if (currentVer != null && currentVer.isNotEmpty && updateVer != null && updateVer.isNotEmpty) {
    List<String> _curVerList = currentVer.split(".");
    List<String> _updateVerList = updateVer.split(".");

    for (int i = 0; i < _updateVerList.length; i++) {
      int _currVerIterate = 0;
      if (i < _curVerList.length) {
        _currVerIterate = int.tryParse(_curVerList[i]);
      }
      int _updateVerIterate = int.tryParse(_updateVerList[i]);
      if (_currVerIterate > _updateVerIterate) {
        break;
      }
      isNeed = _currVerIterate < _updateVerIterate || isNeed;
    }
  }
  return isNeed;
}

///
/// 将数字转为特定字符串
/// formatType : "W" 超过10000转为以W为单位
///              "," 整数部分每三个字符间逗号隔开
/// fixedNum : 保留小数位
/// isFloor : 只对format = “W，w”时有用
String formatNumToString(num number,
    {String formatType = "W", int fixedNum = 2, isFloor = true, bool isMoney = false}) {
  assert(number != null);

//  print("number =0- 900adwio8dwaoawdoadw  $number");

  String suffixStr = isMoney ? "¥" : "";
  switch (formatType) {
    case "W":
    case "w":
      String _str = "";
      if (number >= 10000) {
        double _wNum = CommonUtils.NumUtil.divide(number, 10000);
        if (isFloor && "$_wNum".contains("\.")) {
          String _mStr = "$_wNum".split("\.")[1];
          if (_mStr.length > fixedNum) {
            _str = "$_wNum".substring(0, "$_wNum".indexOf("\.") + 1 + fixedNum);
          } else {
            _str = "$_wNum";
          }
//          _str = "${Decimal.tryParse("${_wNum.toStringAsFixed(fixedNum)}")}";
        } else {
          _str = "${_wNum.toStringAsFixed(fixedNum)}";
        }
        return suffixStr + _str + "$formatType";
      }
      _str = number.toStringAsFixed(fixedNum + 1);
      String _mStr = "$_str".split("\.")[1];
      if (isFloor && number is double && _mStr.length > fixedNum) {
        _str = "$_str".substring(0, "$_str".indexOf("\.") + 1 + fixedNum);
      } else {
        _str = "${number.toStringAsFixed(fixedNum)}";
      }
//      _str = _str.substring(0, _str.length - 1);
      return suffixStr + _str;
    case ",":
    case "，":
      if ("$number".contains("\.")) {
        int _frontNum = number >= 0 ? number.floor() : number.ceil();
        String sign = number < 0 ? "-" : "";
        String _frontNumStr = "${_frontNum.abs()}";
        String _backNumStr = "${number.toStringAsFixed(fixedNum)}".split("\.")[1];

        String _tempRes = "";

        if (_frontNumStr.length > 3) {
          int n = 0;
          for (int i = _frontNumStr.length - 1; i >= 0; i--) {
            if (n != 0 && (n % 3) == 0) _tempRes = formatType + _tempRes;
            _tempRes = _frontNumStr[i] + _tempRes;
            n++;
          }
          _tempRes = _tempRes + "\." + _backNumStr;
        } else {
          _tempRes = "${number.abs().toStringAsFixed(fixedNum)}";
        }

        return suffixStr + sign + _tempRes;
      } else {
        String _tmpRes = "";
        String sign = number < 0 ? "-" : "";
        String _numStr = "${number.abs()}";
        if (_numStr.length > 3) {
          int n = 0;
          for (int i = _numStr.length - 1; i >= 0; i--) {
            if (n != 0 && (n % 3) == 0) _tmpRes = formatType + _tmpRes;
            _tmpRes = _numStr[i] + _tmpRes;
            n++;
          }
          return suffixStr + sign + _tmpRes;
        } else {
          return suffixStr + sign + _numStr;
        }
      }
      break;
    default:
      return suffixStr + "${number.toStringAsFixed(fixedNum)}";
  }
}

//构造类型
String buildGoalType(String type) {
  switch (type) {
    case 'SALE_MONEY':
      return '销售额';
    case 'SALE_NUM':
      return '销售量';
    case 'GROSS_PROFIT':
    case 'PROFIT':
      return '总毛利';
    default:
      return '';
  }
}

//无昵称情况下默认昵称
String buildNickName(dynamic clerkInfo) {
  int _roleId = 0;
  if (clerkInfo != null && clerkInfo['roleId'] != null) {
    _roleId = clerkInfo['roleId'];
  }
  if (isEmpty(clerkInfo['nickName'])) {
    return ROLE_STR_MAP[ROLE_MAP[_roleId]];
  } else
    return "${clerkInfo['nickName']}";
}

//百分比 大于1的返回100%
String buildProgressStr(num progress) {
  if (progress == null) {
    return "0%";
  }
  if (progress >= 10) {
    return "999.99%";
  } else {
//    return '${(progress * 100).toStringAsFixed(2)}%';
    return doubleToPercentStr(progress);
  }
}

//获取当月第一天
DateTime firstDayOfMonth(DateTime datetime) {
  return DateTime.parse(DateFormat('yyyy-MM-01').format(datetime));
//  return datetime.add(Duration(days: 1 - datetime.day));
}

//获取当天第一秒的时间戳
int firstSecondOfDayToMilliseconds(DateTime datetime) {
  return DateTime.parse(DateFormat('yyyy-MM-dd 00:00:00').format(datetime)).millisecondsSinceEpoch;
}

//获取当天最后一秒的时间戳
int lastSecondOfDayToMilliseconds(DateTime datetime) {
  return lastSecondOfDayToDateTime(datetime.millisecondsSinceEpoch).millisecondsSinceEpoch;
}

DateTime lastSecondOfDayToDateTime(int dateTimeMs) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dateTimeMs);
  return DateTime.parse(DateFormat('yyyy-MM-dd 23:59:59').format(dateTime));
}

//毫秒转为分钟
String millisecondToMinutesStr(int milliSeconds, {int fixed = 1}) {
  if (milliSeconds == null || milliSeconds == 0) {
    return "0";
  }

  if (milliSeconds < 0.01 * 60 * 1000 && fixed == 2) {
    return "0.01";
  }
  if (milliSeconds < 0.1 * 60 * 1000 && fixed == 1) {
    return "0.1";
  }
  return CommonUtils.NumUtil.divideDec(double.tryParse("$milliSeconds"), 1000 * 60).toStringAsFixed(fixed);
}

///自定义字体
class MyFontFamily {
  /// The encoded integer value of this font weight.
  final String fontFamilyStr;

  /// Thin, the least thick
  static const String moneyStyle = "DINAlternateBold";

  static const String robotoStyle = "Roboto";

  static const String lato = "Lato";

  MyFontFamily(this.fontFamilyStr);
}

/// 是否不为空
bool isNotEmpty(dynamic v) => null != v && (v is String ? v.toString().trim().length > 0 : true);

/// 是否为空
bool isEmpty(dynamic v) => v is String ? !isNotEmpty(v) : v is List ? v.length == 0 : null == v;

/// 宽度比例
double commonWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width / 375;
}

/// 获取与当前时间差别的天数
getDiffDays(mills) {
  if (null == mills) {
    return 0;
  }
  DateTime entryTime = DateTime.fromMillisecondsSinceEpoch(mills);
  Duration duration = DateTime.now().difference(entryTime);
  return duration.inDays + 1;
}

/// 获取四位随机字符串
String getRandomString() {
  String var1 = Random.secure().nextInt(10).toString();
  String var2 = Random.secure().nextInt(10).toString();
  String var3 = Random.secure().nextInt(10).toString();
  String var4 = Random.secure().nextInt(10).toString();
  return '$var1$var2$var3$var4';
}

//将月份转为汉字月份
String getMonthToCharacter(_month) {
  String month;
  switch (_month) {
    case '01':
    case "1":
      month = '一月';
      break;
    case '02':
    case '2':
      month = '二月';
      break;
    case '03':
    case '3':
      month = '三月';
      break;
    case '04':
    case '4':
      month = '四月';
      break;
    case '05':
    case '5':
      month = '五月';
      break;
    case '06':
    case '6':
      month = '六月';
      break;
    case '07':
    case '7':
      month = '七月';
      break;
    case '08':
    case '8':
      month = '八月';
      break;
    case '09':
    case '9':
      month = '九月';
      break;
    case '10':
      month = '十月';
      break;
    case '11':
      month = '十一月';
      break;
    case '12':
      month = '十二月';
      break;
  }

  return month;
}

/// 跳转页面
Future goto(BuildContext context, Widget w) {
  return Navigator.of(context).push(new CupertinoPageRoute(builder: (c) => w));
}
