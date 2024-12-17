import SwiftUI

struct HeroDetailView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HeroDetailView")
        }
        .padding()
    }
}

#Preview {
    HeroDetailView()
}
