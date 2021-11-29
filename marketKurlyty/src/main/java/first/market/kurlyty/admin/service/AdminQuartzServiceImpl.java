package first.market.kurlyty.admin.service;

import org.springframework.stereotype.Service;

@Service("couponService")
public class AdminQuartzServiceImpl implements AdminQuartzService {
	@Override
	public void testJobMethod() {
		System.out.println("test job....");

	}
}
