import Foundation

@Observable
final class HeroDetailViewModel {
    var heroDetailData: HeroDetailModel?
    
    @ObservationIgnored
    private var useCaseHeroDetail: HeroDetailUseCaseProtocol
    
    init(id: Int, useCaseHeroDetail: HeroDetailUseCaseProtocol = HeroDetailUseCase()) {
        self.useCaseHeroDetail = useCaseHeroDetail
        
        Task{
            await getHeroDetail(id: id)
        }
    }
    
    @MainActor
    func getHeroDetail(id: Int) async {
        let data = await useCaseHeroDetail.getHeroDetail(id: id)
        self.heroDetailData = data
    }
}
