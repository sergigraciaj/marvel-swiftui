import SwiftUI

struct HeroListView: View {    
    @State var viewModel: HerosViewModel

    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(viewModel.herosData){ hero in
                    NavigationLink {
                        HeroDetailView(id: hero.id)
                    } label: {
                        HeroRowView(hero: hero)
                            .visualEffect { content, proxy in
                                content
                                    .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).minY) - 200) / 10, axis: (x: 1, y: 0, z: 0))
                            }
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
