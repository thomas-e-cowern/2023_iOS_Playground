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
            Text("Welcome Friend!")
                .foregroundStyle(.white)
                .bold()
                .font(.largeTitle)
        }
    }
}

#Preview {
    SplashScreenView()
}
