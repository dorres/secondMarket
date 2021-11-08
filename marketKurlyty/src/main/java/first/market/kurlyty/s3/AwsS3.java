package first.market.kurlyty.s3;

import java.io.File;
import java.io.InputStream;

import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.mybatis.spring.SqlSessionTemplate;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import first.market.kurlyty.user.controller.SecurityUtil;

public class AwsS3 {
	private SqlSessionTemplate sqlSession;
	private AmazonS3 s3Client;
	private String accessKey;
	private String secretKey;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "kurlybuc";
	
	public AwsS3() {}
	public AwsS3(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		createS3Client();
	}
	
	private void createS3Client() {
		S3KeyVO keyVO = sqlSession.selectOne("CategoryDAO.getS3Key");
		SecretKey decodingKey = new SecretKeySpec(keyVO.getDecoding_key().getBytes(),"AES");
		IvParameterSpec decodingIv = new IvParameterSpec(keyVO.getDecoding_iv().getBytes());
		try {
			accessKey = SecurityUtil.decrypt("AES/CBC/PKCS5Padding",
					decodingKey, decodingIv,
					  keyVO.getAccesskey());
			secretKey = SecurityUtil.decrypt("AES/CBC/PKCS5Padding",
					decodingKey, decodingIv,
					  keyVO.getSecretkey());
		} catch (Exception e) {
			e.printStackTrace();
		}
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		this.s3Client=AmazonS3ClientBuilder.standard().withCredentials(
				new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
	}
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata metadata = new ObjectMetadata();
		metadata.setContentType(contentType);
		metadata.setContentLength(contentLength);
		
		uploadToS3(new PutObjectRequest(this.bucket, key, is, metadata));
	}
	
	private void uploadToS3(PutObjectRequest request) {
		try {
			this.s3Client.putObject(request);
			System.out.println(String.format("[%s] upload complete", request.getKey()));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
