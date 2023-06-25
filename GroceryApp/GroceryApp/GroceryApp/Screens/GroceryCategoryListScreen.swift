//
//  GroceryCategoryListScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

struct GroceryCategoryListScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    @EnvironmentObject private var appState: AppState
    
    @State private var isPresented: Bool = false
    @State private var isShoppingListPresented: Bool = false
    
    var body: some View {
        
        ZStack {
            if model.groceryCategories.isEmpty {
                VStack {
                    Spacer()
                    Text("Add A Category using the '+' button above")
                    Spacer()
                }
            } else {
                VStack {
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
                    
                    Button("Shopping List") {
                        isShoppingListPresented = true
                    }
                    .sheet(isPresented: $isShoppingListPresented) {
                        NavigationStack {
                            ShoppingListScreen()
                        }
                    }
                }
            }
        }
        .task {
            await fetchGroceryCategories()
        }
        .navigationTitle("Categories")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Log Out") {
                    model.logout()
                    appState.routes.append(.login)
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

struct GroceryCategoryListScreenContainer: View {
    
    @StateObject private var model = GroceryModel()
    @StateObject private var appState = AppState()
    
    var body: some View {
        NavigationStack(path: $appState.routes) {
            GroceryCategoryListScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .register:
                        RegistrationScreen()
                    case .login:
                        LoginScreen()
                    case .groceryCategoryList:
                        GroceryCategoryListScreen()
                    case .groceryCategoryDetail(let groceryCategory):
                        GroceryDetailScreen(groceryCategory: groceryCategory)
                    }
                }
        }
        .environmentObject(model)
        .environmentObject(appState)
    }
}

struct GroceryCategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        GroceryCategoryListScreenContainer()
    }
}
