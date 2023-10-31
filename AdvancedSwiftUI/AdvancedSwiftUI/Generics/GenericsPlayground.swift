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

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello World")
    
    @Published var genericStringModel = GenericModel(info: "Hello Generic String")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
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
            Text(vm.genericStringModel.info ?? "No generic string data")
            Text(vm.genericBoolModel.info?.description ?? "No generic bool data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    GenericsPlayground()
}
