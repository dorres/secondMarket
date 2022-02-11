package first.market.kurlyty.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class MessageService {
	public void sendMessage(String toNumber, String randomNumber) {
		String apiKey="";// = "";
		String apiSecret="";// = "";
		String fromNumber="";// = "";
		Message coolsms = new Message(apiKey, apiSecret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[grabMe] 마켓컬리티 인증 번호 ["+randomNumber+"] 입니다.");
		params.put("app_version", "test app 1.2"); // application name and version
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
