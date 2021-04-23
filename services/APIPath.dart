class APIPath{
  //static String user(String uid) => 'users/$uid';
  static String addToFavorite(String uid) => 'users/$uid';
  static String pro(String productId) =>'product/$productId';
  static String pros() => 'product';
  static String jobpath(String jobId) => 'job/$jobId';
  static String shoppath(String shopId) => 'shop/$shopId';
  static String shop()=>'shop';
  static String job()=> 'job';
}