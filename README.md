[toc]



# 8th_final_3team_SwiftUI

iOS SwiftUI Version



## 11월 18일

https://unnnyong.me/2020/05/19/swiftui-view-%EC%9D%98-%EC%82%AC%EC%9D%B4%EC%A6%88-%EC%A1%B0%EC%A0%88-frame-padding-spacer/



**Frame** 은 View 본인의 height, width. 사이즈를 지정할 때.
**Padding** 은 View 의 top, bottom, leading, trailing 를 지정할 때.
**Spacer** 는 Stack 에 소속된 View들 사이의 일정한 거리를 지정할 때.
**GeometryReader** 는 View의 부모뷰의 사이즈를 기준으로 본인의 사이즈를 조절할 때.



```swift
//ContentView는 edgesIgnoringSafeArea 무시합니다.
ContentView()
.background(Color.blue.edgesIgnoringSafeArea(.bottom))
```





### 11월 16일

---

RxSwift 
Observalbe -> AnyPulisher
subscribe -> sink

onReceive -> RxCocoa .rx
Publisher 넣어준 이벤트에 따라 action이 수행됨 

**변수에 넣는**

`@State` 변수의 값을 관찰하다가 이를 사용하는 view를 업뎃
  : view가 없어지기 전까지 메모리에 영원히 존재 할수 있음 **외부에서 절대 사용 X**
**String, Int, Bool** 단순 로컬 프로퍼티에 적합
$을 붙히면 쓰기 가능

`@ObservableObject` @State와 같은 역활이나, 같은 View에 선언된 변수가 아닌 외부의 값에 의해 변화 될때 사용
※ ObjectBinding -> ObservableObject 변경됨.

EnvironmentObject



### [SwiftUI] Data Flow 

---

**ObservableObject** 를 준수하는 클래스는 

`@Published` 속성으로 선언된 변수의 값이 변하려고 할때, `willSet` 외부에 퍼블리싱함.

```swift
class UserModel: ObservableObject {
    @Published var userID: String = ""
}

struct SignInView: View {
    @StateObject var user = UserModel()
    var body: some View {
        VStack {
          // UserModel의 값이 변경될 때 전달 받을 수 있음
            if !uesr.userID.isEmpty { Text("Hi, \(user.userID)) }
            SignInButton()
                .onTapGesture { user.userID = "Jaesung" }
        }
    }
}
```





```swift
class TimeCounter: ObservableObject {
    @Published var count: Int = 0
    func increase() {
        count += 1
    }
}
```

`@ObservedObject`는 뷰 라이프 사이클에 의존

CountView의 body가 State 속성의 프로퍼티에 의해 업데이트가 된다면 TimeCounter = 0으로 초기화 됨

```swift
struct CountView: View {
    @ObservedObject var counter = TimeCounter()
    var body: some View {
        VStack { 
            Text(counter.count)
            Button(action: counter.increase) {
                Text("Tap")
            }
        }
    }
}
```



`@StateObjects`는 독립개체

CountView의 body가 State 속성의 프로퍼티에 의해 업데이트가 되고 0으로 초기화 되지 않음

```swift
struct CountView: View {
    @StateObject var counter = TimeCounter()
    ...
}
```



### environmentObject

Observable 오브젝트를 Environment 오브젝트로 변환하면, 첫번째 뷰에서 두번째 뷰로 참조체를 전달할 필요없이 모든 뷰에서 Environment 오브젝트에 접근이 가능하다



### SwiftUI의 View는 Function of State?





[참고 블로그](https://jaesung0o0.medium.com/swiftui-data-flow-stateobject-vs-observedobject-e32a37d80dd2)





https://eunjin3786.tistory.com/68

https://zeddios.tistory.com/1153



루트뷰 전환

https://www.python2.net/questions-750586.htm

### 11월 12일

----





```swift
curl -X GET "https://dapi.kakao.com/v2/local/search/keyword.json?page=1&size=15&sort=accuracy&query=%EB%B6%84%EC%8B%9D&category_group_code=FD6&x=126.9710952&y=37.554108&radius=500" \
	-H "Authorization: KakaoAK {REST_API_KEY}"
```



```swift
https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&query=%EB%B6%84%EC%8B%9D&page=1&size=15&sort=accuracy&x=126.9710952&y=37.554108&radius=500
```



적용하기
https://www.raywenderlich.com/9335365-core-data-with-swiftui-tutorial-getting-started



----

내가 원하는건 SplashView -> MainView 전환 시 
rootVC 인데 풀커버를 하게되면 아래처럼 덮어짐 모달임

```swift
Image("splash")
    .edgesIgnoringSafeArea(.all)
    .fullScreenCover(isPresented: .constant(true), content: {
        
        MainView()
    })
```



<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201112172932249.png" alt="image-20201112172932249" style="zoom:50%;" />





[SwiftUI Data Flow](https://developer.apple.com/documentation/swiftui/state-and-data-flow)

#### 로티 적용하기

https://designcode.io/swiftui-handbook-lottie-animation



### 11월 10일

---

카카오맵 적용

https://aircook.tistory.com/entry/Kakao-Maps-API-with-Swift

카카오 지도

https://clein8.tistory.com/entry/SwiftUI%EB%A1%9C-%EB%8B%A4%EC%9D%8C%EC%A7%80%EB%8F%84-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-DaumMap



현재 위치 

https://adrianhall.github.io/swift/2019/11/05/swiftui-location/



네트워크

https://www.swiftcompiled.com/mvvm-swiftui-and-combine/



컴바인

https://blog.gangnamunni.com/post/SwiftUI+CombineQuickLook/



컴바인 Zip

https://gist.github.com/zafarivaev/41241de9bb4b178950352f92733e4009
https://medium.com/better-programming/observe-the-completion-of-2-network-requests-using-combine-in-swift-5-6fc9e7304e4f

Advanced Combining Operator

https://sujinnaljin.medium.com/combine-advanced-combining-operator-1ee9928bc873



네트워크

https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/

https://github.com/freshOS/Networking

https://www.userdesk.io/blog/swift-networking-with-combine/

### 커스텀 폰트 적용

```swift
.font(.custom("AppleSDGothicNeo-Medium", size: 25))
```

Tine
Light
Regular
Medium
SemiBold
Bold