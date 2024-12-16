import SwiftUI

@main
struct marvel_swiftuiApp: App {
    @State var AppState = AppStateVM()

    var body: some Scene {
        WindowGroup {
            RootView().environment(AppState)
        }
    }
}
