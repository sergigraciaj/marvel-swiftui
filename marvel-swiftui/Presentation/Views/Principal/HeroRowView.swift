import SwiftUI

struct HeroRowView: View {
    var hero: HerosModel
    
    var body: some View {
        ZStack{
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

            VStack(alignment: .leading){
                HStack{
                    Text(hero.name)
                        .font(.title)
                        .bold()
                        .padding(.leading, 30)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HeroRowView(hero: HerosModel(id: 123, name: "Abomination",thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04",
        thumbnailExtension: "jpg")
    ))
}
