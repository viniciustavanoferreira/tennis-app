abstract class Repository{

  Future get(String urn);
  Future delete(String urn);
  Future put(String body, String urn);
  Future post(String body, String urn);

}