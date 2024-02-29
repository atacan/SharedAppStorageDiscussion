//
// https://github.com/atacan
// 29.02.24
	

import SwiftUI
import ComposableArchitecture

@Reducer
public struct ContentReducer {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        @Shared(.appStorage(SettingsKey.playSounds.rawValue)) var playSounds: Bool = true
        @Shared(.appStorage(SettingsKey.mode.rawValue)) var mode: Mode = .inProgress
    }
}

struct ContentView: View {
    let store: StoreOf<ContentReducer>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("Hello, world!")
                
                if store.playSounds{
                    // UI shows true
                    Text("true")
                } else {
                    Text("false")
                }
                
                switch store.mode {
                case .idle:
                    Text("idle")
                case .inProgress:
                    // UI shows inProgress
                    Text("inProgress")
                }
            }
            .padding()
            .onAppear {
                // ⚠️ returns `false`
                print(UserDefaults.standard.bool(forKey: SettingsKey.playSounds.rawValue))
                
                // ⚠️ returns `nil`
                print(UserDefaults.standard.string(forKey: SettingsKey.mode.rawValue))
                
                
                // to see where the Library/Preferences folder is
                print(NSHomeDirectory())
                // it has the com.atacan.SharedAppStorageDiscussion.plist file for UserDefaults
                
            }
        }
    }
}

#Preview {
    ContentView(
        store: Store(initialState: {ContentReducer.State()}(), reducer: {
            ContentReducer()
        })
    )
}

enum SettingsKey: String {
    case playSounds
    case mode
}

enum Mode: String {
    case inProgress
    case idle
}
