import Foundation

protocol NetworkHeroDetailProtocol {
    func getHeroDetail(id: Int) async -> HeroDetailModel?
}

final class NetworkHeroDetail: NetworkHeroDetailProtocol {
    func getHeroDetail(id: Int) async -> HeroDetailModel? {
        var modelReturn: ResponseModel<[HeroDetailModel]>
        var heroDetail: HeroDetailModel?
        
        let urlCad = "\(ConstantsApp.CONST_API_URL)\(Endpoints.heroDetail.rawValue)\(id)\(ConstantsApp.CONST_API_HASH)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: HttpMethods.contentTypeID)

        do{
            let (data, response) = try await URLSession.shared.data(for: request)

            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                modelReturn = try! JSONDecoder().decode(ResponseModel.self, from: data)
                
                heroDetail = modelReturn.data.results[0]
            }
        } catch {
            NSLog("Error en detalle del heroe: \(error.localizedDescription)")
        }

        return heroDetail
    }
}


//Mock Class for Testing and UI Design
final class NetworkHeroDetailMock: NetworkHeroDetailProtocol{
    
    func getHeroDetail(id: Int) async -> HeroDetailModel? {
        let series = Series(available: 2, collectionURI: "collection Fake")
        let model = HeroDetailModel(name: "Test",series: series)
        
        return model
    }
}
