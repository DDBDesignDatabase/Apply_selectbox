package sports_center; // Java bean만 모아놓을 패키지

public class Juso {
	
	/* 페이지 리로딩시 셀렉팅 목록을 유지하기 위한 전역변수*/
	/* property에 직접 접근할 수 없게 private 사용*/
	private static String sido;
	private static String sigungu;
	
	public static String getSido() {
		return sido;
	}
	
	public static void setSido(String sido) {
		Juso.sido = sido;
	}
	
	public static String getSigungu() {
		return sigungu;
	}
	
	public static void setSigungu(String sigungu) {
		Juso.sigungu = sigungu;
	}
	
	
}
