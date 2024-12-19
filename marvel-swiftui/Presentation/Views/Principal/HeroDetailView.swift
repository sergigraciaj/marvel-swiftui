import SwiftUI

struct HeroDetailView: View {
    @State var viewModel: HeroDetailViewModel

    init(id: Int, viewModel: HeroDetailViewModel? = nil) {
        self.viewModel = viewModel ?? HeroDetailViewModel(id: id)
    }
    
    var body: some View {
        VStack {
            if let heroDetail = viewModel.heroDetailData {
                Text("Hero Name: \(heroDetail.name)")
            } else {
                Text("Loading hero details...")
            }
        }
        .padding()
    }
}

#Preview {
    HeroDetailView(id: 2, viewModel: HeroDetailViewModel(id: 2, useCaseHeroDetail: HeroDetailUseCaseMock()))
}
