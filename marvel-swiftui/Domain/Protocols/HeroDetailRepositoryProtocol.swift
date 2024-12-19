import Foundation

protocol HeroDetailRepositoryProtocol{
    func getHeroDetail(id: Int) async -> HeroDetailModel?
}
