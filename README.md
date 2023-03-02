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
