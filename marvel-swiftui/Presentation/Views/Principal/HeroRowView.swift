import SwiftUI

struct HeroRowView: View {
    var hero: HerosModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(Color.black)
                .cornerRadius(10)
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .padding(10)
            
            AsyncImage(url: URL(string: hero.photo)) { photo in
                photo
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(10)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
 
            HStack() {
                Text(hero.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 30)
                    .padding(.bottom, 20)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .background(.white)
            .roundedCorner(10, corners: [.bottomLeft, .bottomRight])
            .padding(10)

        }
    }
}

#Preview {
    HeroRowView(hero: HerosModel(id: 123, name: "Abomination",thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04",
        thumbnailExtension: "jpg")
    ))
}
