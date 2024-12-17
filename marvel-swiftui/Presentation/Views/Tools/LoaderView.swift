import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("LoaderView")
        }
        .padding()
    }
}

#Preview {
    LoaderView()
}
