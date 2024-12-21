import Foundation

protocol NetworkHeroDetailProtocol {
    func getHeroDetail(id: Int) async -> [HeroDetailModel]
}

final class NetworkHeroDetail: NetworkHeroDetailProtocol {
    func getHeroDetail(id: Int) async -> [HeroDetailModel] {
        
        var modelReturn: ResponseModel<[HeroDetailModel]>
        var heroDetail = [HeroDetailModel]()
        
        let urlCad = "\(ConstantsApp.CONST_API_URL)\(Endpoints.heroDetail(id: id).path)\(ConstantsApp.CONST_API_HASH)"
        print(urlCad)
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: HttpMethods.contentTypeID)

        do{
            let (data, response) = try await URLSession.shared.data(for: request)

            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                modelReturn = try! JSONDecoder().decode(ResponseModel.self, from: data)
                
                heroDetail = modelReturn.data.results
            }
        } catch {
            NSLog("Error en detalle del heroe: \(error.localizedDescription)")
        }

        return heroDetail
    }
}


//Mock Class for Testing and UI Design
final class NetworkHeroDetailMock: NetworkHeroDetailProtocol{
    
    func getHeroDetail(id: Int) async -> [HeroDetailModel] {
        let model = HeroDetailModel(id: 3, title: "Fake Detail", description: "random description",
                                    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: "jpg"))
        
        return [model]
    }
}
