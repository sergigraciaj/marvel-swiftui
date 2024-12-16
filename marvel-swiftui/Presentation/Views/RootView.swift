import SwiftUI

struct RootView: View {
    @Environment(AppStateVM.self) var appState
       
    var body: some View {
       
        switch(appState.status){
        case .principal:
            HeroListView()
        case .loading:
            withAnimation {
                LoaderView()
            }
        case .error:
            withAnimation {
                ErrorView()
            }
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateVM())
}
