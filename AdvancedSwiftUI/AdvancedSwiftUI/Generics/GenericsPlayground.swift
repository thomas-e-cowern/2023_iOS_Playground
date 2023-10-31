//
//  GenericsPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/31/23.
//

import SwiftUI

class GenericsViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        dataArray = ["One", "Two", "Three"]
    }
    
    func removeDataFromDataArray() {
        dataArray.removeAll()
    }
}

struct GenericsPlayground: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            ForEach(vm.dataArray, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        vm.removeDataFromDataArray()
                    }
            }
        }
    }
}

#Preview {
    GenericsPlayground()
}
