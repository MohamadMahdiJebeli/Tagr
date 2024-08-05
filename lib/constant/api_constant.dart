class APIconstant{
  static const hostDLURL ="https://techblog.sasansafari.com"; 
  static const baseURL = "https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems = "${baseURL}home/?command=index";
  static const getBlogsList = "${baseURL}article/get.php?command=new&user_id=";
  static const postRegister = '${baseURL}register/action.php';
  static const publishByMe = baseURL+'article/get.php?command=published_by_me&user_id=';
  static const blogPost = baseURL+"article/post.php";
  static const getPodcastList = baseURL+"podcast/get.php?command=new&user_id=";
  static const getPodcastFile = baseURL+"podcast/get.php?command=get_files&podcats_id=";
}

class APIBlogKeyConstant{
  static const title = 'title';
  static const content = 'content';
  static const catId = 'cat_id';
  static const userId = 'user_id';
  static const image = 'image';
  static const command = 'command';
  static const tagList = 'tag_list';
}