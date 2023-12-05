//
//  ContentViewModel.swift
//  RectiveCombine
//
//  Created by Thomas Cowern on 12/5/23.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var value = 0
    private var cancellable: AnyCancellable?
    
    init() {
        let publisher = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .map {
                _ in self.value + 1
            }
        
        cancellable = publisher.assign(to: \.value, on: self)
    }
}
