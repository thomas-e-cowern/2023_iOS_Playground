//
//  NotificationViewModel.swift
//  Udemy_Combine
//
//  Created by Thomas Cowern on 1/6/23.
//

import Foundation
import SwiftUI
import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    func receive(completion: Subscribers.Completion<MyError>) {
        <#code#>
    }
    
    
    typealias Input = String
    
    typealias Failure = MyError
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Recieved value", input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Commpleted")
    }
    
    func receive(subscription: Subscription) {
        print("Subscription recieved")
        subscription.request(.max(3))  // backpresssure
    }
    
    
}

struct Notify {
    let notification = Notification.Name("My Fotification")
    
//    let center = NotificationCenter.default
    
    
    
    func notify () {
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", ].publisher
        
        let subscriber = StringSubscriber()
        
        publisher.subscribe(subscriber)
        
//        let publisher = NotificationCenter.default.publisher(for: notification)
//
//
//
//        let subscription = publisher.sink { _ in
//            print("Notification recieved")
//        }
//
//        NotificationCenter.default.post(name: notification, object: nil)
//
//        subscription.cancel()
//
//        NotificationCenter.default.post(name: notification, object: nil)
        
        
//        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
//            print("Notification Recieved")
//        }
//
//        center.post(name: notification, object: nil)
//
//        center.removeObserver(observer)
    }
}
