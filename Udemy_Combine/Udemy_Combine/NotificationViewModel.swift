//
//  NotificationViewModel.swift
//  Udemy_Combine
//
//  Created by Thomas Cowern on 1/6/23.
//

import Foundation
import SwiftUI
import UIKit

struct Notify {
    let notification = Notification.Name("My Fotification")
    
//    let center = NotificationCenter.default
    
    
    
    func notify () {
        
        let publisher = NotificationCenter.default.publisher(for: notification)
        
        NotificationCenter.default.post(name: notification, object: nil)
        
        let subscription = publisher.sink { _ in
            print("Notification recieved")
        }
//        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
//            print("Notification Recieved")
//        }
//
//        center.post(name: notification, object: nil)
//
//        center.removeObserver(observer)
    }
}
