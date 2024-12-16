import Foundation

@Observable
final class HerosViewModel {
    var herosData = [HerosModel]()
    
    @ObservationIgnored
    private var useCaseHeros: HerosUseCaseProtocol
    
    init(useCaseHeros: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCaseHeros = useCaseHeros
        
        Task{
            await getHeros()
        }
    }
    
    @MainActor
    func getHeros() async {
        let data = await useCaseHeros.getHeros()
        self.herosData = data
    }
}
