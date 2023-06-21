//
//  GroceryCategoryListScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

struct GroceryCategoryListScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        ZStack {
            if model.groceryCategories.isEmpty {
                VStack {
                    Spacer()
                    Text("Add A Category using the '+' button above")
                    Spacer()
                }
            } else {
                List {
                    ForEach(model.groceryCategories) { groceryCategory in
                        NavigationLink(value: Route.groceryCategoryDetail(groceryCategory)) {
                            HStack {
                                Circle()
                                    .fill(Color.fromHex(groceryCategory.colorCode))
                                    .frame(width: 25)
                                Text(groceryCategory.title)
                            }
                        }
                    }
                    .onDelete(perform: deleteGroceryCategory)
                    
                }
            }
        }
        .task {
            await fetchGroceryCategories()
        }
        .navigationTitle("Categories")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Log Out") {
                    
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isPresented) {
                    NavigationStack {
                        AddGroceryCategoryScreen()
                    }
                }

            }
        }
    }
    
    private func fetchGroceryCategories() async {
        do {
            try await model.getGroceryCategories()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteGroceryCategory(at offsets: IndexSet) {
        offsets.forEach { index in
            let groceryCategory = model.groceryCategories[index]
            
            Task {
                do {
                    try await model.deleteGroceryCategory(groceryCategoryId: groceryCategory.id)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct GroceryCategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GroceryCategoryListScreen()
                .environmentObject(GroceryModel())
        }
    }
}
