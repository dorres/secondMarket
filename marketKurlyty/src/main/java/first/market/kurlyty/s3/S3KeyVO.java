package first.market.kurlyty.s3;

import lombok.Data;

@Data
public class S3KeyVO {
	private String decoding_key;
	private String decoding_iv;
	private String accesskey;
	private String secretkey;
}
