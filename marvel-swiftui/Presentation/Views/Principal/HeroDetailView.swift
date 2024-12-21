import SwiftUI

struct HeroDetailView: View {
    @State var viewModel: HeroDetailViewModel

    init(id: Int, viewModel: HeroDetailViewModel? = nil) {
        self.viewModel = viewModel ?? HeroDetailViewModel(id: id)
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(viewModel.heroDetailData){ hero in
                    Text(hero.title).fontWeight(.bold)
                    
                    AsyncImage(url: URL(string: hero.photo)) { photo in
                        photo
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .padding([.leading, .trailing], 20)
                            .opacity(0.9)
                        
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                    
                    if (hero.description != nil) {
                        Text(hero.description!)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    HeroDetailView(id: 2, viewModel: HeroDetailViewModel(id: 2, useCaseHeroDetail: HeroDetailUseCaseMock()))
}
