import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()

func getRandomPhoto() -> AnyPublisher<Data, Never> {
    let url = URL(string: "https://source.unsplash.com/random")!
    
    return URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .replaceError(with: Data())
        .eraseToAnyPublisher()
}

let publisher1 = getRandomPhoto()
let publisher2 = getRandomPhoto()
let publisher3 = getRandomPhoto()
let publisher4 = getRandomPhoto()

publisher1
    .zip(publisher2, publisher3, publisher4)
    .handleEvents { (subscription) in
        print("==== subscription: \(subscription)")
    } receiveOutput: { (a, b, c, d) in
        print("\n==== a: \(a)")
        print("==== b: \(b)")
        print("==== c: \(c)")
        print("==== d: \(d)")
        
    } receiveCompletion: { completion in
        print("\n==== completion: \(completion)")
    } receiveCancel: {
        print("\n==== receiveCancel")
    } receiveRequest: { subscribers_demand in
        print("\n==== subscribers_demand: \(subscribers_demand)")
    }
    .sink(receiveValue: { _ in })
    .store(in: &subscriptions)

    
//    .handleEvents(receiveOutput: { (randomPhotoData, weeklyPhotoData, 2, 3) in
//        let randomPhoto = UIImage(data: randomPhotoData)
//        let weeklyPhoto = UIImage(data: weeklyPhotoData)
//
//        print(randomPhoto ?? "")
//        print(weeklyPhoto ?? "")
//    })
//    .sink(receiveValue: { _ in })
//    .store(in: &subscriptions)
