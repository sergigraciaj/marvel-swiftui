import SwiftUI

struct HeroListView: View {    
    @State var viewModel: HerosViewModel

    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.herosData){ hero in
                    NavigationLink {
                        HeroDetailView()
                    } label: {
                        HeroRowView(hero: hero)
                    }
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    HeroListView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseMock()))
}
