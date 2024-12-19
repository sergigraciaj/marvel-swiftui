import Foundation

final class HeroDetailRepository: HeroDetailRepositoryProtocol {
    private var Network: NetworkHeroDetailProtocol
    
    init(Network: NetworkHeroDetailProtocol) {
        self.Network = Network
    }
    
    func getHeroDetail(id: Int) async -> HeroDetailModel? {
        return await Network.getHeroDetail(id: id) ?? nil
    }
}

final class HeroDetailRespositoryMock: HeroDetailRepositoryProtocol {
    private var Network: NetworkHeroDetailProtocol
    
    init(Network: NetworkHeroDetailProtocol = NetworkHeroDetailMock()) {
        self.Network = Network
    }
    
    func getHeroDetail(id: Int) async -> HeroDetailModel? {
        return await Network.getHeroDetail(id: id) ?? nil
    }
}
