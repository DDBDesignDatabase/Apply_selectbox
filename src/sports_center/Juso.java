package sports_center; // Java bean�� ��Ƴ��� ��Ű��

public class Juso {
	
	/* ������ ���ε��� ������ ����� �����ϱ� ���� ��������*/
	/* property�� ���� ������ �� ���� private ���*/
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
