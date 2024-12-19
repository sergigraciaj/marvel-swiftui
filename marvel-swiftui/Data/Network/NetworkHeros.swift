import Foundation

protocol NetWorkHerosProtocol {
    func getHeros() async -> [HerosModel]
}

final class NetWorkHeros: NetWorkHerosProtocol {
    func getHeros() async -> [HerosModel] {
        
        var modelReturn: ResponseModel<[HerosModel]>
        var heros = [HerosModel]()
        
        let urlCad = "\(ConstantsApp.CONST_API_URL)\(Endpoints.heros.rawValue)\(ConstantsApp.CONST_API_HASH)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: HttpMethods.contentTypeID)
        
        do{
            
            let (data, response) = try await URLSession.shared.data(for: request)

            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                modelReturn = try! JSONDecoder().decode(ResponseModel.self, from: data)
                heros = modelReturn.data.results
            }
        } catch {
            NSLog("Error en heroes: \(error.localizedDescription)")
        }

        return heros
    }
}


final class NetworkHerosMock: NetWorkHerosProtocol{
    func getHeros() async -> [HerosModel]{
        let model1 = HerosModel(id: 123, name: "Abomination", thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04",
            thumbnailExtension: "jpg"
        ))
        
        let model2 = HerosModel(id: 321, name: "Agent Zero", thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790",
            thumbnailExtension: "jpg"
        ))
        
        return [model1, model2]
    }
    
}
