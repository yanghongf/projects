package com.cnlive.mz.commons;


public class Constants {
	public static String CAPTCHA = "session.captcha";
	public static String PAGE_NUMBER = "pageNumber";

	public static String VIDEO_FORMAT[] = { "mpg", "mp4", "MPEG", "MPG", "MP4" };
	public static String IMAGE_FORMAT[] = { "JPG", "PNG", "JPEG", "jpg", "png" };
	public static String TEXT_FORMAT[] = { "txt", "TXT" };
	public static String OTHER_FORMAT[] = { "sfl", "SFL" };
	public static final int PAGE_SIZE = 33;
	public static String FFMPEG_PATH_WIN = "E:/encoding_tools/ffmpeg-20140826-git-96b2ba6-win32-static/bin/ffmpeg.exe";
	public static String FFMPEG_PATH_LINUX = "ffmpeg";

	public static String FFMPEG_LENGTH = "ffmpeg";// 获取节目时长
	/********* 节目状态0-未上线 1-上线 ，2-下线，3-cms解析失败 ，4-oa发布失败 *********/
	public static final Integer ONLINE_NO = 0;
	public static final Integer ONLINE_OK = 1;
	public static final Integer ONLINE_DOWN = 2;
	public static final Integer ONLINE_CMS_FAILE = 3;
	public static final Integer ONLINE_OA_FAILE = 4;

	 
}
