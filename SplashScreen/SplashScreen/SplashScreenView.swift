//
//  SplashScreenView.swift
//  SplashScreen
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("Naners")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .clipShape(.circle)
        }
    }
}

#Preview {
    SplashScreenView()
}
