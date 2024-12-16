import Foundation

protocol HerosUseCaseProtocol {
    var repo: HerosRepositoryProtocol {get set}
    func getHeros() async -> [HerosModel]
}


final class HerosUseCase :HerosUseCaseProtocol {
    var repo : HerosRepositoryProtocol
    
    init(repo: HerosRepositoryProtocol = HerosRespository(Network:  NetWorkHeros())) {
        self.repo = repo
    }
    
    func getHeros() async -> [HerosModel] {
        await repo.getHeros()
    }
}



final class HerosUseCaseMock :HerosUseCaseProtocol {
    var repo : HerosRepositoryProtocol
    
    init(repo: HerosRepositoryProtocol = HerosRespository(Network:  NetworkHerosMock())) {
        self.repo = repo
    }
    
    func getHeros() async -> [HerosModel] {
        await repo.getHeros()
    }
}
