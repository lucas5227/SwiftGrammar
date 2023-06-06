"""
///열거형
"""
//열거형은 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목값 외에는 추가/수정이 불가합니다. 그렇기 때문에 딱 정해진 값만 열거형 값에 속할수 있습니다.
//• 제한된선택지를주고싶을때
//• 정해진값외에는입력받고싶지않을때
//• 예상된입력값이한정되어있을때
//  • 무선통신 방식: WIFI, 블루투스, LTE, 3G. 기타
//  • 학생: 초등학생, 중학생, 고등학생, 대학생, 대학원생. 기타
//  • 지역: 강원도, 경기도, 경상도, 전라도, 제주도, 충청도
//switch문과 함께 사용하면 효과적이다
"""
///기본열거형
"""
enum School{
    case primary
    case elementry
    case middle
    case high
    case collage
    case university
    case graduate
}

enum SchoolGrade {
    case primary, elementry, middle, high, collage, university, graduate
}

var highestEducationLevel: School = School.university
var highestEducationLevel2: School = .university
// 같은타입인School 나부의항목으로만highestEducationlevel 의값을변경해줄수있습니다.
highestEducationLevel = .graduate
