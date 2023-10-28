//
//  CustomTabBar3.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

enum Tab3: String, CaseIterable {
    case house
    case message
    case person
    case leaf
    case gearshape
}

struct CustomTabBar3: View {
    
    @Binding var selectedTab: Tab3
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .green
        case .person:
            return .indigo
        case .leaf:
            return .purple
        case .gearshape:
            return .yellow
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab3.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab  ? 1.25 : 1.0)
                        .foregroundStyle(selectedTab == tab ? tabColor : Color.gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(height: 60)
            .background(.thinMaterial)
            .clipShape(Rectangle())
            .padding()
        }
    }
}

#Preview {
    CustomTabBar3(selectedTab: .constant(.house))
}
