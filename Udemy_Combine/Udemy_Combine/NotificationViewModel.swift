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
        print("Completed")
    }
    
    
    typealias Input = String
    
    typealias Failure = MyError
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Recieved value", input)
        return .none
    }
    
    func receive(subscription: Subscription) {
        print("Subscription recieved")
        subscription.request(.max(2))  // backpresssure
    }
    
    
}

struct Notify {
    let notification = Notification.Name("My Fotification")
    
//    let center = NotificationCenter.default
    
    
    
    func notify () {
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", ].publisher
        
        let subscriber = StringSubscriber()
        
        publisher.subscribe(subscriber)
        
    }
}
