//
//  GenericsPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/31/23.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello World")
    
    func removeData() {
        stringModel = stringModel.removeInfo()
    }
//    @Published var dataArray: [String] = []
//    
//    init() {
//        dataArray = ["One", "Two", "Three"]
//    }
//    
//    func removeDataFromDataArray() {
//        dataArray.removeAll()
//    }
}

struct GenericsPlayground: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            Text(vm.stringModel.info ?? "No Data")
                .onTapGesture {
                    vm.removeData()
                }
        }
    }
}

#Preview {
    GenericsPlayground()
}
