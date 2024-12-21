import Foundation

protocol HeroDetailUseCaseProtocol {
    var repo: HeroDetailRepositoryProtocol {get set}
    func getHeroDetail(id: Int) async -> [HeroDetailModel]
}

final class HeroDetailUseCase :HeroDetailUseCaseProtocol {
    var repo : HeroDetailRepositoryProtocol
    
    init(repo: HeroDetailRepositoryProtocol = HeroDetailRepository(Network:  NetworkHeroDetail())) {
        self.repo = repo
    }
    
    func getHeroDetail(id: Int) async -> [HeroDetailModel] {
        await repo.getHeroDetail(id: id)
    }
}

final class HeroDetailUseCaseMock :HeroDetailUseCaseProtocol {
    var repo : HeroDetailRepositoryProtocol
    
    init(repo: HeroDetailRepositoryProtocol = HeroDetailRepository(Network:  NetworkHeroDetailMock())) {
        self.repo = repo
    }
    
    func getHeroDetail(id: Int) async -> [HeroDetailModel] {
        await repo.getHeroDetail(id: id)
    }
}

