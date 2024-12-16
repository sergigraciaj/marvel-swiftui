import Foundation

final class HerosRespository: HerosRepositoryProtocol {
    
    private var Network: NetWorkHerosProtocol
    
    init(Network: NetWorkHerosProtocol) {
        self.Network = Network
    }
    
    func getHeros() async -> [HerosModel] {
        return await Network.getHeros()
    }
}


//Mock

final class HerosRespositoryMock: HerosRepositoryProtocol {
    private var Network: NetWorkHerosProtocol
    
    init(Network: NetWorkHerosProtocol = NetworkHerosMock()) {
        self.Network = Network
    }
    func getHeros() async -> [HerosModel] {
        return await Network.getHeros()
    }
}

