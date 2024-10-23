package Lake.Final_PJT.Service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class TmpServiceTest {

	@Autowired
	private TmpService tmpService;

	@Test
	public void testAdd(){
		int result = tmpService.add(2, 3);
		assertEquals(4, result, "2 + 3 = 5");
	}
}