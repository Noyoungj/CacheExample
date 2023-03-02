# CacheExample

 <img src="https://img.shields.io/badge/Swift-3178C6?style=flat&logo=Swift&logoColor=white"/>

#### 'Kingfisher' 같은 이미지 캐싱 라이브러리의 구현된 방식으 알아보고자 공부해보자!

## Cache란?
#### 컴퓨터의 성능을 향상시키기 위해 사용되는 메모리. 주기억장치와 CPU사이에 위치하여 자주 사용하느 데이터를 저장해놨다가 빠르게 불러올 수 있도록 하는 것.

## Caching이란?
#### Cache 영역으로 데이터를 가져와서 접근하는 방식. 또는 메모리 상의 데이터를 연산할 때, 연산 속도가 빠르 CPU 메모리 영역으로 가져와서 처리하는 방식.
#### 미리 복사해둔 데이터에 접근하는 것이기 때문에 애플리케이션 처리 속도를 높여준다.

## Caching의 종류
#### (클라이언트, 서버 기준) Server-side Caching and Client-side Caching
#### (저장 위치 기준) Disk Cache and Memory Cache

### Memory Cache
#### Memory Cache는 애플리캐이션의 메모리 영역의 일정 부분으 캐싱에 사용한다. 애플리케이션이이 종료되어 메모리 할당이 해제되면 저장된 내용들은 비워진다.
#### Swift에선 NSCache를 사용하여 구현할 수 있다.

### Disk Cache
#### Disk Cache는 'File Manager' 이용 데이터를 파일형태로 디스크에 저장한다. 기기 안에 저장되어 있기 때문에 애플리케이션을 껐다 켜도 저장된 내용이 남아있다.
#### Ex. 카카오톡의 채팅방의 이미지들은 껐다 켜도 해당 방에 들어가면 바로 볼 수 있다.

## NSCache란?
Swift에서 캐싱하는 것에 주로 사용된다.
공식 문서에는 'A mutable collection you use to temporarily store transient key-value pairs that are subject to eviction when resources are low.'락 적혀있는데, 이를 해석하면 '리소스가 부족할 때 제거될 수 있는 임시 key-value 쌍을 임시로 저장하는 데 사용하는 변경 가능한 컬렉션입니다.'라고 한다.

추가적으로 다른 가변 컬렉션과 Cache의 다른 점으로는
- NSCahce 클래스는 캐시가 시스템 메모리를 너무 많이 사용하지 않도록 자동 제거 정책이 있다. 다른 애플리케이션에서 메모릭 필요한 경우, 이러한 정책은 캐시에서 일부 항목을 제거하여 메모리 공간을 최소호 한다.
- 캐시를 직접 lock하지 않고도 다른 Thread에서 캐시의 항목을 추가, 삭제 및 쿼리를 진행할 수 있다.<span style="color:red"> Thread Safe 라고 한다. 나중에 알아보자. </span>)
- <span style="color:red"> NSMutableDictionary </span>와 달리 캐시는 캐싱 저장된 키 개체를 복사하지 않는다.

#### 결론적으로 생성하는데 비용이 많이 드는 임시 데이터를 저장할 때 NSCache를 사용하는 것 같다. 이러하 객체를 재사용함으로써 해당 값을 다시 계산할 필요가 없기 때문에 성능상의 이점을 얻을 수 있다.

### 참고자료
https://velog.io/@allie/캐시-충전하러-가자
