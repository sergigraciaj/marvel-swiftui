import Foundation

protocol NetWorkHerosProtocol {
    func getHeros() async -> [HerosModel]
}

final class NetWorkHeros: NetWorkHerosProtocol {
    func getHeros() async -> [HerosModel] {
        
        var modelReturn = [HerosModel]()
        
        let urlCad = "\(ConstantsApp.CONST_API_URL)\(Endpoints.heros.rawValue)?ts=1&apikey=806fdb915bd59ec732b51e06137bd59a&hash=6696d834975890e11e337172240f07b9"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: HttpMethods.contentTypeID)
        
        do{
            
            let (data, response) = try await URLSession.shared.data(for: request)
            print(data)
            
            if (response.getResponseCode() == HttpResponseCodes.SUCESS){
                modelReturn = try! JSONDecoder().decode([HerosModel].self, from: data)
            }
        } catch {
            NSLog("Error en heroes: \(error.localizedDescription)")
        }
        
        
        return modelReturn
        
    }
}


final class NetworkHerosMock: NetWorkHerosProtocol{
    func getHeros() async -> [HerosModel]{
        let model1 = HerosModel(id: UUID(), name: "Goku", thumbnail: Thumbnail(
            path: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1",
            thumbnailExtension: "jpg"
        ))
        
        let model2 = HerosModel(id: UUID(), name: "Vegeta", thumbnail: Thumbnail(
            path: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita",
            thumbnailExtension: "jpg"
        ))
        
        return [model1, model2]
    }
    
}

extension URLResponse {
    func getResponseCode() -> Int {
        if let resp = self as? HTTPURLResponse {
            return resp.statusCode
        } else{
            return 500
        }
    }
}
