//
//  ContentView.swift
//  GlobalError
//
//  Created by Thomas Cowern on 9/5/23.
//

import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var listUsers = [String]()
    @Published var userError: UserError? = nil
    
    @MainActor
    func loadUsers(withError: Bool) async {
        if withError {
            userError = UserError.failedLoading
        } else {
            userError = nil
            listUsers = ["ninha", "Mike", "Pepijn"]
        }
    }
}

enum UserError: Error {
    case failedLoading
    
    var description: String {
        switch self {
        case .failedLoading:
            return "Sorry, we couldn't retrieve users. \n Try again later. ☹️"
        }
    }
}

struct ShowErrorEnvironmentKey: EnvironmentKey {
    static var defaultValue: (Error, String) -> Void = { _, _ in }
}

extension EnvironmentValues {
    var showError: (Error, String) -> Void {
        get { self[ShowErrorEnvironmentKey.self]}
        set { self[ShowErrorEnvironmentKey.self] = newValue }
    }
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance:  String?
}

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text(errorWrapper.error.localizedDescription)
            Text(errorWrapper.guidance ?? "")
        }
    }
}

struct ErrorView2: View {
    let errorTitle: String = ""
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {
                
                VStack {
                    Text(errorTitle)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Button("Reload Users") {
                        Task {
                            await usersViewModel.loadUsers(withError: false)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            }
    }
}

struct ErrorView3: View {
    let errorTitle: String
    @ObservedObject var usersViewModel: UsersViewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .frame(height: 200)
            .padding()
            .overlay {

                VStack {
                    Text(errorTitle)
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    Button("Reload Users") {
                        Task {
                            await usersViewModel.loadUsers(withError: false)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }

            }
    }
}

struct ContentView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    @Environment(\.showError) private var showError
    @State var showAlert = false
    @State var showError2 = false
    
    private enum SampleError: Error {
        case operationFailed
    }
    
    var body: some View {
        
        // popup animated view
        VStack {
            List(usersViewModel.listUsers, id: \.self) { user in
                Text(user)
            }.overlay {
                if showError2 {
                    VStack {
                        ErrorView3(errorTitle: usersViewModel.userError?.description ?? "", usersViewModel: usersViewModel)
                        
                        Spacer()
                    }.transition(.move(edge: .top))
                }
            }.transition(.move(edge: .top))
        }
        .animation(.default, value: usersViewModel.userError)
        .task {
            try? await Task.sleep(for: .seconds(1))
            await usersViewModel.loadUsers(withError: true)
        }
        .onChange(of: usersViewModel.userError) { newValue in
            showError2 = newValue != nil
        }
        
        
        // ***** Alert modifier *****
        //        ZStack {
        //            List(usersViewModel.listUsers, id: \.self) { user in
        //                Text(user)
        //            }
        //        }
        //        .task {
        //            try? await Task.sleep(for: .seconds(2))
        //            await usersViewModel.loadUsers(withError: true)
        //        }
        //        .onChange(of: usersViewModel.userError,
        //                  perform: { newValue in
        //            showAlert = newValue != nil
        //        })
        //        .alert(usersViewModel.userError?.description ?? "", isPresented: $showAlert) {
        //            ErrorView2(usersViewModel: usersViewModel)
        //        }
        
        // ***** Error view called *****
        //        ZStack {
        //            List(usersViewModel.listUsers, id: \.self) { user in
        //                Text(user)
        //            }
        //
        //            if let error = usersViewModel.userError { // << error handling here
        //                ErrorView2(errorTitle: error.description, usersViewModel: usersViewModel)
        //            }
        //        }
        //        .task {
        //            try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
        //            await usersViewModel.loadUsers(withError: true) // calling the fake function with error
        //        }
        
        // ***** Global Error ******
        //        VStack {
        //            Button("Throw Error") {
        //                do {
        //                    throw SampleError.operationFailed
        //                } catch {
        //                    showError(error, "Please try again")
        //                }
        //            }
        //        }
        //        .padding()
    }
}

struct ContentViewContainer: View {
    
    @State var errorWrapper: ErrorWrapper?
    
    var body: some View {
        ContentView()
            .environment(\.showError) { error, guidance in
                errorWrapper = ErrorWrapper(error: error, guidance: guidance)
            }
            .sheet(item: $errorWrapper) { error in
                ErrorView(errorWrapper: error)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewContainer()
    }
}
