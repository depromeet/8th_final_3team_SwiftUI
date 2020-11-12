## raywenderlich 

[Toc]

### Your-first-ios-and-swiftui-app



Bullseye를 만들기 위한 솔루션

<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111195742437.png" alt="image-20201111195742437" style="zoom:25%;" />  <img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111195709209.png" alt="image-20201111195709209" style="zoom:25%;" />



Life Cycel == SwiftUI 

<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111200321551.png" alt="image-20201111200321551" style="zoom:50%;" />

```swift
@main
struct BullseyesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```





Objects, Data, Methods

<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111204637330.png" alt="image-20201111204637330" style="zoom:25%;" />



#### 버튼 구현

```swift
Button(action: {
  print("button pressed!")
}) {
  Text("Button")
}
```

<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111205553976.png" alt="image-20201111205553976" style="zoom:50%;" />



#### SwiftUI State



<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111205759522.png" alt="image-20201111205759522" style="zoom:33%;" />![image-20201111205842025](/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111205842025.png)



<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111205920303.png" alt="image-20201111205920303" style="zoom:33%;" />





```swift
 @State var alertIsVisible: Bool = false
```

https://developer.apple.com/documentation/swiftui/state

`@State` SwiftUI에서 관리하는 값을 읽고 쓸 수있는 속성 래퍼 유형입니다.

다른 뷰로 전달할 때는 `$`

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying)
        }
    }
}
```





```swift
//
//  ContentView.swift
//  Bullseyes
//
//  Created by 이규현 on 2020/11/11.
//

import SwiftUI

struct ContentView: View {
    
  //변수를 다른 Object에 전달 할때는 @State <-> $
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("welcome to my first app!")
                .fontWeight(.semibold)
                .foregroundColor(.green)
            
            Button(action: {
                print("button pressed!")
                print("before self.alertIsVisible: ", self.alertIsVisible) // false
                self.alertIsVisible = true
                print("after self.alertIsVisible: ", self.alertIsVisible) // true
            }) {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
        }
        .alert(isPresented: $alertIsVisible, content: {
            () -> Alert in
            return Alert(
                title: Text("hellow"),
                message: Text("pop-Up"),
                dismissButton: .default(Text("Awesome!"))
            )
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```



<img src="/Users/kyuhyeon/Library/Application Support/typora-user-images/image-20201111211826705.png" alt="image-20201111211826705" style="zoom:33%;" />

