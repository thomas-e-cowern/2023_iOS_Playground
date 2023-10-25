//
//  TabBarModel.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/25/23.
//

import SwiftUI

struct TabBar: Identifiable {
    var id = UUID()
    var icon: String
    var tab: TabIcon
}

enum TabIcon: String {
    case Home
    case Card
    case Favorite
    case Purchases
    case Notification
}
