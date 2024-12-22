import SwiftUI

struct HeroDetailView: View {
    @State var viewModel: HeroDetailViewModel

    init(id: Int, viewModel: HeroDetailViewModel? = nil) {
        self.viewModel = viewModel ?? HeroDetailViewModel(id: id)
    }
    
    var body: some View {
        VStack {
            ScrollView{
                ForEach(viewModel.heroDetailData){ hero in
                    VStack(alignment: .leading) {
                        Text(hero.title)
                            .font(.headline)
                            .padding(.leading, 10)
                        
                        AsyncImage(url: URL(string: hero.photo)) { photo in
                            photo
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                        
                        if (hero.description != nil) {
                            Text(hero.description!)
                                .padding([.leading, .trailing], 10)
                        }
                        
                        Divider()
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    HeroDetailView(id: 2, viewModel: HeroDetailViewModel(id: 2, useCaseHeroDetail: HeroDetailUseCaseMock()))
}
