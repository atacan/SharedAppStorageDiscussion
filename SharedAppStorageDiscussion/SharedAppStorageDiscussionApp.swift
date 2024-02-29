//
// https://github.com/atacan
// 29.02.24
	

import SwiftUI
import ComposableArchitecture

@main
struct SharedAppStorageDiscussionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: {
                ContentReducer.State()
            }(), reducer: {
                ContentReducer()
            }))
        }
    }
}
