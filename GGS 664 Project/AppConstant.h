//
//  AppConstant.h
//  demo
//
//  Created by levir1 on 5/27/15.
//  Copyright (c) 2015 czhgorg. All rights reserved.
//

#pragma mark - Theme Color Constant
//-----------------------AV_USER_CLASS-----------------------
#define		AV_USER_CLASS_NAME                  @"_User"				//	String
#define		AV_USER_OBJECTID                    @"objectId"				//	String
#define		AV_USER_USERNAME                    @"username"				//	String
#define		AV_USER_PASSWORD                    @"password"             //	String
#define		AV_USER_PHONENUMBER                 @"mobilePhoneNumber"	//	String
#define		AV_USER_PHONEVERIFIED               @"mobilePhoneVerified"	//	String
#define		AV_USER_NICKNAME                    @"nickname"				//	String
#define		AV_USER_WHATSUP                     @"whatsup"              //	String
#define		AV_USER_AVATAR                      @"file"                 //	AVFile
#define		AV_USER_THUMBNAIL                   @"thumbnail"            //	AVFile
#define		AV_USER_VIDEO                       @"video"                //	AVFile
#define		AV_USER_GENDER                      @"gender"               //	String
#define		AV_USER_AGE                         @"age"                  //	Number
#define		AV_USER_OCCUPATION                  @"occupation"           //	String
#define		AV_USER_MARITALSTATUS               @"maritalStatus"        //	Number
#define		AV_USER_COLLEGE                     @"college"              //	String
#define		AV_USER_LOCATION                    @"location"             //	String
#define		AV_USER_SELFINTRO                   @"selfIntroduction"     //	String
#define		AV_USER_HOMETOWN                    @"hometown"             //	String
#define		AV_USER_HOBBY                       @"hobby"                //	String
#define		AV_USER_GEOPOINT                    @"geoPoint"             //	GeoPoint
#define		AV_USER_UPDATEDAT                   @"updatedAt"            //	Date
#define		AV_USER_LASTQUERYTIME               @"lastQueryTime"        //	Date
#define		AV_USER_FAVORITEROOMS               @"favoriteRooms"        //	Relation
#define		AV_USER_FRIENDS                     @"friends"              //	Relation



//-----------------------AV_POSTS_CLASS-----------------------
#define		AV_POSTS_CLASS_NAME                 @"Posts"				//	String
#define		AV_POSTS_OBJECTID                   @"objectId"             //	String
#define		AV_POSTS_SENDER                     @"sender"               //	String
#define		AV_POSTS_SENDERID                   @"senderId"             //	String
#define		AV_POSTS_TITLE                      @"title"                //	String
#define		AV_POSTS_POSTCONTENT                @"postContent"          //	String
#define		AV_POSTS_CATELOG                    @"catelog"              //	String
#define		AV_POSTS_POSTTYPE                   @"postType"             //	String
#define		AV_POSTS_POSTTYPE_1                 @"请客任务"              //	String
#define		AV_POSTS_POSTTYPE_2                 @"悬赏任务"              //	String
#define		AV_POSTS_POSTTYPE_3                 @"其他任务"              //	String
#define		AV_POSTS_POSTTYPE_4                 @"生活信息"              //	String
#define		AV_POSTS_IMAGE                      @"image"                //	AVFile
#define		AV_POSTS_THUMBNAIL                  @"thumbnail"            //	AVFile
#define		AV_POSTS_VIDEO                      @"video"                //	AVFile
#define		AV_POSTS_CREATEDAT                  @"createdAt"            //	Date
#define		AV_POSTS_GEOPOINT                   @"geoPoint"             //	GeoPoint
#define		AV_POSTS_LIKEUSERLIST               @"likeUserList"         //	Array
#define		AV_POSTS_PRICE                      @"price"                //	String
//-----------------------CORE_POSTS_CLASS-----------------------
#define		CORE_POSTS_CLASS_NAME               @"Posts"				//	String
#define		CORE_POSTS_OBJECTID                 @"objectId"             //	String
#define		CORE_POSTS_SENDERID                 @"senderId"             //	String
#define		CORE_POSTS_TITLE                    @"title"                //	String
#define		CORE_POSTS_POSTCONTENT              @"postContent"          //	String
#define		CORE_POSTS_CATELOG                  @"catelog"              //	String
#define		CORE_POSTS_POSTTYPE                 @"postType"             //	String
#define		CORE_POSTS_IMAGEURL                 @"imageUrl"             //	String
#define		CORE_POSTS_THUMBNAILURL             @"thumbnailUrl"         //	String
#define		CORE_POSTS_VIDEOURL                 @"videoUrl"             //	String
#define		CORE_POSTS_CREATEDAT                @"createdAt"            //	Date
#define		CORE_POSTS_LATITUDE                 @"latitude"             //	Double
#define		CORE_POSTS_LONGITUDE                @"longitude"            //	Double



//-----------------------AV_MESSAGES_CLASS-----------------------
#define		AV_MESSAGES_CLASS_NAME              @"Messages"				//	String
#define		AV_MESSAGES_OBJECTID                @"objectId"             //	String
#define		AV_MESSAGES_SENDER                  @"sender"               //	AVUser
#define		AV_MESSAGES_SENDERID                @"senderId"             //	String
#define		AV_MESSAGES_RECEIVERID              @"receiverId"           //	String
#define		AV_MESSAGES_CONTENT                 @"content"              //	String
#define		AV_MESSAGES_MESSAGESTYPE            @"messageType"          //	String
#define		AV_MESSAGES_MESSAGESTYPE_POSTMSG    @"postMessage"          //	String
#define		AV_MESSAGES_MESSAGESTYPE_PRIVATEMSG @"privateMessage"       //	String
#define		AV_MESSAGES_MESSAGESTYPE_ADDFRIEND  @"addFriend"            //	String
#define		AV_MESSAGES_MESSAGESTYPE_DELETEFRIEND  @"deleteFriend"      //	String
#define		AV_MESSAGES_ROOMID                  @"roomId"               //	String
#define		AV_MESSAGES_FILE                    @"file"                 //	AVFile
#define		AV_MESSAGES_THUMBNAIL               @"thumbnail"            //	AVFile
#define		AV_MESSAGES_CREATEDAT               @"createdAt"            //	Date
//-----------------------CORE_MESSAGES_CLASS-----------------------
#define		CORE_MESSAGES_CLASS_NAME            @"Messages"				//	String
#define		CORE_MESSAGES_OBJECTID              @"objectId"             //	String
#define		CORE_MESSAGES_SENDERNAME            @"senderName"           //	String
#define		CORE_MESSAGES_SENDERID              @"senderId"             //	String
#define		CORE_MESSAGES_RECEIVERID            @"receiverId"           //	String
#define		CORE_MESSAGES_CONTENT               @"content"              //	String
#define		CORE_MESSAGES_MESSAGESTYPE          @"messageType"          //	String
#define		CORE_MESSAGES_MESSAGESTYPE_POSTMSG      @"postMessage"      //	String
#define		CORE_MESSAGES_MESSAGESTYPE_PRIVATEMSG   @"privateMessage"   //	String
#define		CORE_MESSAGES_MESSAGESTYPE_ADDFRIEND    @"addFriend"        //	String
#define		CORE_MESSAGES_MESSAGESTYPE_DELETEFRIEND @"deleteFriend"     //	String
#define		CORE_MESSAGES_ROOMID                @"roomId"               //	String
#define		CORE_MESSAGES_FILEURL               @"fileUrl"              //	String
#define		CORE_MESSAGES_THUMBNAILURL          @"thumbnailUrl"         //	String
#define		CORE_MESSAGES_CREATEDAT             @"createdAt"            //	Date
#define		CORE_MESSAGES_ISNEWMSG              @"isNewMsg"             //	Boolean



//-----------------------AV_VIDEOREPLY_CLASS-----------------------
#define		AV_VIDEOREPLY_CLASS_NAME            @"VideoReply"			//	String
#define		AV_VIDEOREPLY_OBJECTID              @"objectId"             //	String
#define		AV_VIDEOREPLY_SENDER                @"sender"               //	Pointer
#define		AV_VIDEOREPLY_SENDERID              @"senderId"             //	String
#define		AV_VIDEOREPLY_POST                  @"post"                 //	Pointer
#define		AV_VIDEOREPLY_POSTID                @"postId"               //	String
#define		AV_VIDEOREPLY_CONTENT               @"replyContent"         //	String
#define		AV_VIDEOREPLY_THUMBNAIL             @"thumbnail"            //	AVFile
#define		AV_VIDEOREPLY_VIDEO                 @"video"                //	AVFile
#define		AV_VIDEOREPLY_CREATEDAT             @"createdAt"            //	Date
#define		AV_VIDEOREPLY_LIKEUSERLIST          @"likeUserList"         //	Array



//-----------------------Image Cache Type-----------------------
#define		CACHE_AVATARIMAGE                   @"avatarImage"          //	String
#define		CACHE_AVATARTHUMBNAIL               @"avatarThumbnail"		//	String
#define		CACHE_POSTIMAGE                     @"postImage"            //	String
#define		CACHE_POSTTHUMBNAIL                 @"postThumbnail"        //	String
#define		CACHE_MESSAGEIMAGE                  @"messageImage"         //	String
#define		CACHE_MESSAGETHUMBNAIL              @"messageThumbnail"     //	String
//-----------------------Image Cache Type-----------------------
#define		POSTLISTTYPE_FAVORITE               @"favoriteRooms"        //	String
#define		POSTLISTTYPE_RECENT                 @"recentRooms"          //	String
#define		POSTLISTTYPE_NEAR                   @"near"                 //	String
#define		POSTLISTTYPE_HOT                    @"hot"                  //	String