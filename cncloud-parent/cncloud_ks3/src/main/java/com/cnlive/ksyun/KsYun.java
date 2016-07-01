package com.cnlive.ksyun;

import java.io.File;
import java.util.List;

import org.apache.log4j.Logger;

import com.ksyun.ks3.dto.Authorization;
import com.ksyun.ks3.dto.CannedAccessControlList;
import com.ksyun.ks3.dto.CreateBucketConfiguration;
import com.ksyun.ks3.dto.CreateBucketConfiguration.REGION;
import com.ksyun.ks3.dto.HeadObjectResult;
import com.ksyun.ks3.dto.ObjectMetadata;
import com.ksyun.ks3.dto.PutObjectResult;
import com.ksyun.ks3.exception.serviceside.NotFoundException;
import com.ksyun.ks3.service.Ks3;
import com.ksyun.ks3.service.Ks3Client;
import com.ksyun.ks3.service.Ks3ClientConfig;
import com.ksyun.ks3.service.Ks3ClientConfig.PROTOCOL;
import com.ksyun.ks3.service.request.CreateBucketRequest;
import com.ksyun.ks3.service.request.HeadObjectRequest;
import com.ksyun.ks3.service.request.PutObjectRequest;

public class KsYun {
	private static String KEY_ID = "fWUN8KDtJZJGo0ArQ4qo";
	private static String KEY_SECRET = "UIWPYVeaV8kq2vWImDkLBvWs/pwmTJVF9MCNHDsC";
	private static String WAN_END_POINT = "ks3-cn-beijing.ksyun.com";
	private static String LAN_END_POINT = "ks3-cn-beijing-internal.ksyun.com";
	private Ks3 client = null;
	private Logger log = Logger.getLogger("KsYun");

	/**
	 * 
	 * @param isLan
	 *            �Ƿ�ͨ�������ϴ�
	 */
	public KsYun(boolean isLan) {
		Authorization authorization = new Authorization(KEY_ID, KEY_SECRET);
		client = new Ks3Client(authorization);
		Ks3ClientConfig config = client.getKs3config();
		if (isLan) {
			config.setEndpoint(LAN_END_POINT);
		} else {
			config.setEndpoint(WAN_END_POINT);
		}
		config.setProtocol(PROTOCOL.http);
		System.out.println(config.getEndpoint());
	}

	/**
	 * ����ļ��ϴ�
	 * 
	 * @param resultFileName
	 * @param subStr
	 *            Ҫ��ŵ�·��key�Ľ�ȡ
	 * @param bucketName
	 */
	public void batchPut(List<String> resultFileName, String subStr, String bucketName) {
		for (int i = 0; i < resultFileName.size(); i++) {
			String path = resultFileName.get(i);
			log.info("batchPut:start" + path);
			int index = path.indexOf(subStr);
			String strPath = path.substring(index);
			strPath = strPath.replaceAll("\\\\", "/");
			PutObjectRequest request = new PutObjectRequest(bucketName, strPath, new File(path));
			request.setCannedAcl(CannedAccessControlList.PublicRead);
			PutObjectResult result = client.putObject(request);
			log.info("batchPut:stop" + result.getRequestId());
		}
	}

	/**
	 * �����ļ��ϴ�
	 * 
	 * @param filePath
	 *            �ļ�·����
	 * @param key
	 *            Ҫ��ŵ�·��key
	 * @param bucketName
	 *            �������֡�
	 */
	public boolean singlePut(String bucketName, String key, File file) {
		log.info("singlePut:start" + file.getPath());
		PutObjectRequest request = new PutObjectRequest(bucketName, key, file);
		request.setCannedAcl(CannedAccessControlList.PublicRead);
		PutObjectResult result = client.putObject(request);
		log.info("singlePut:stop" + result.getRequestId());
		return isExists(bucketName, key);
	}

	/**
	 * �½�bucket��ʱ������bucket�Ĵ洢�ص�ͷ���Ȩ��
	 * 
	 * @param bucketName
	 *            bucket����
	 */
	public void createBucket(String bucketName) {
		CreateBucketRequest request = new CreateBucketRequest(bucketName);
		// ����bucket�Ĵ洢�ص�
		CreateBucketConfiguration config = new CreateBucketConfiguration(REGION.BEIJING);
		request.setConfig(config);
		// ����bucket�ķ���Ȩ��
		request.setCannedAcl(CannedAccessControlList.PublicReadWrite);
		// ִ�в���
		client.createBucket(request);
	}

	/**
	 * ɾ��һ�������ռ�
	 * 
	 * @param bucketName
	 *            �����ռ�
	 */
	public void deleteBucket(String bucketName) {
		client.deleteBucket(bucketName);
	}

	/**
	 * ��<bucket����>����洢�ռ��µ�<object key>ɾ��
	 * 
	 * @param bucketName
	 * @param key
	 *            ɾ�����ļ�·��
	 */
	public void deleteFile(String bucketName, String key) {
		client.deleteObject(bucketName, key);
	}

	/**
	 * �ж��ļ��Ƿ���ڽ�ɽ����
	 * 
	 * @param bucketName
	 * @param path
	 * @return
	 */
	public boolean isExists(String bucketName, String key) {
		try {
			HeadObjectRequest request = new HeadObjectRequest(bucketName, key);
			HeadObjectResult h = client.headObject(request);
			ObjectMetadata matedata = h.getObjectMetadata();
			return true;
		} catch (NotFoundException e) {
			return false;
		}
	}

	public static void main(String[] args) {
		KsYun ksYun = new KsYun(false);
		ksYun.singlePut("video-web", "video/data3/2016/0520/live1_20160520132506.mp4", new File("e:/a.mp4"));

	}
}
