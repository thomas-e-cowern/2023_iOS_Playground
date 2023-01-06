//
//  NotificationViewModel.swift
//  Udemy_Combine
//
//  Created by Thomas Cowern on 1/6/23.
//

import Foundation

struct Notify {
    let notification = Notification.Name("My Fotification")

    let center = NotificationCenter.default

    func notify () {
        center.addObserver(forName: notification, object: nil, queue: nil) { notification in
            print("Notification Recieved")
        }
    }
}
