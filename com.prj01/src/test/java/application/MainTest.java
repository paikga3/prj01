package application;

public class MainTest {

	public static void main(String[] args) {
		boolean res = simpleMatch("asd*abc*a*", "asdffklsdfjlsksdkfabca");
		System.out.println(res);
	}
	
	public static boolean simpleMatch(String pattern, String str) {
		System.out.println("호출!");
		
		// 두번째 호출시 패턴은 *abc* 문자열은 "ffklsdfjlsksdkfabc"
		System.out.println(pattern);
		System.out.println(str);
		
		
		if (pattern == null || str == null) {
			return false;
		}
		int firstIndex = pattern.indexOf('*');
		/** 만약 패턴에서 *을 발견할 수 없다면 패턴을 문자열과 있는 그대로 비교한다. */
		if (firstIndex == -1) {
			return pattern.equals(str);
		}
		/** 만약 패턴이 *로 시작한다면 */
		if (firstIndex == 0) {
			/** 만약 패턴이 *이라면 */
			if (pattern.length() == 1) {
				return true;
			}
			/** 다음 *이 있는 위치를 찾는다 패턴이 *로 시작하므로 fisrIndex + 1부터 찾기시작한다. */
			int nextIndex = pattern.indexOf('*', firstIndex + 1);
			/** 패턴이 *로 시작하는거 외에 더이상 *이 없다면 */
			if (nextIndex == -1) {
				/** *을 제외한 나머지 패턴으로 대상 문자열이 끝나는지 검사한다. */
				return str.endsWith(pattern.substring(1));
			}
			
			/** 패턴이 *로 시작하고 뒤에 *이 또 있다면 *과 *사이의 패턴을 얻어온다. */
			String part = pattern.substring(1, nextIndex);
			// 대상문자열에서 잘라낸 패턴으로 시작하는 인덱스를 구해온다.
			int partIndex = str.indexOf(part);
			
			while (partIndex != -1) {
				// nextIndex는 다음 *이 위치하는 인덱스이다.
				// str.substring(partIndex + part.length()) 은 part바로 뒤의 문자열을 가져온다. part는 포함되지 않음.
				// 가령 part가 "abc"이고 문자열이 "abcefg"라면 "efg"를 가져옴.
				if (simpleMatch(pattern.substring(nextIndex), str.substring(partIndex + part.length()))) {
					return true;
				}
				partIndex = str.indexOf(part, partIndex + 1);
			}
			
			// 대상문자열에서 잘라낸 패턴으로 시작하는 부분문자열이 없다면 패턴에 매치되어지는 것이 없으므로 false를 리턴한다.
			return false;
		}
		return (str.length() >= firstIndex &&
				pattern.substring(0, firstIndex).equals(str.substring(0, firstIndex)) &&
				simpleMatch(pattern.substring(firstIndex), str.substring(firstIndex)));
	}
}
