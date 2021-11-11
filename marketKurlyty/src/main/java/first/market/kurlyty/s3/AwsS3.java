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
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import first.market.kurlyty.user.controller.SecurityUtil;

public class AwsS3 {
	//github로 파일 공유시 AwsS3에서 받은 키값이 노출되어 본사에서 전화가옴
	// 해결하기 위해 받은 키값을 db에 넣고 불러오기 위해 mybatis를 사용한거임
	private SqlSessionTemplate sqlSession;
	
	//Amazon-s3-sdk
	private AmazonS3 s3Client;
	private String accessKey; //->IAM 에서 만든 엑세스 키
	private String secretKey; //->IAM 에서 받은 시크릿 엑세스 키
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "kurlybuc"; //버킷 명

	
	public AwsS3() {}
	public AwsS3(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		createS3Client();
	}

	// asw S3 Client 생성
	private void createS3Client() {
		//db에 넣은 암호화된 s3키값을 가져온다
		S3KeyVO keyVO = sqlSession.selectOne("CategoryDAO.getS3Key");
		
		//암호화된 s3키를 복호화 하기위한 decodingKey, decodingIv 값을 가져와서 바이트형태?로 바꾼다?
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
	
	}//end createS3Client()
	
	//file 올릴때
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	//multipartFile을 사용해서 올릴때
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

	public void delete(String key) {
		try {
			//Delete 객체 생성
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			//Delete
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complete", key));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
}
