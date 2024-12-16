import SwiftUI

struct HeroListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HeroListView")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
