
class ResultData<T>{
  T data;
  int errorCode = 0;
  String errorMsg = "";

  ResultData(this.errorCode,this.errorMsg,{required this.data});
}