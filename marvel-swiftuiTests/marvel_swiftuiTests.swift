import Testing
@testable import marvel_swiftui

struct marvel_swiftuiTests {
    @Suite("Domain Testing") struct DomainTest {
        @Suite("Entities", .serialized) struct ModelTest {
            @Test("Response Model")
            func responseModelTest() async throws {
                let dataModel = DataModel<String>(results: "Test")
                let model = ResponseModel<String>(data: dataModel)
                #expect(model != nil)
                #expect(model.data.results == "Test")
            }
            
            @Test("Thumbnail Model")
            func thumbnailModelTest() async throws {
                let model = Thumbnail(path: "path", thumbnailExtension: "extension")
                #expect(model != nil)
                #expect(model.path == "path")
                #expect(model.thumbnailExtension == "extension")
            }
            
            @Test("Heros Model")
            func herosModelTest() async throws {
                let model = HerosModel(id: 123, name: "Test", thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04",
                    thumbnailExtension: "jpg"
                ))
                #expect(model != nil)
                #expect(model.id == 123)
                #expect(model.name == "Test")
                #expect(model.photo == "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg")
            }
            
            @Test("Hero Detail Model")
            func heroDetailModelTest() async throws {
                let model = HeroDetailModel(id: 123, title: "Test", description: "Test description", thumbnail: Thumbnail(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04",
                    thumbnailExtension: "jpg"
                ))
                #expect(model != nil)
                #expect(model.id == 123)
                #expect(model.title == "Test")
                #expect(model.description == "Test description")
                #expect(model.photo == "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg")
            }
            
            @Test("Heros Use Case")
            func HerosUseCaseTest() async throws {
                let herosUC = HerosUseCase(repo: HerosRespositoryMock())
                #expect(herosUC != nil)
                
                let herosResponse = await herosUC.getHeros()
                #expect(herosResponse.count == 2)
            }
            
            @Test("Hero Detail Use Case")
            func HeroDetailUseCaseTest() async throws {
                let heroDetailUC = HeroDetailUseCase(repo: HeroDetailRespositoryMock())
                #expect(heroDetailUC != nil)
                
                let heroDetailResponse = await heroDetailUC.getHeroDetail(id: 1)
                #expect(heroDetailResponse.count == 1)
            }
        }
        
        @Suite("Data Testing") struct DataTest {
            @Test("Heros Network")
            func HerosNetworkTest() async throws {
                let herosNetwork = NetworkHerosMock()
                #expect(herosNetwork != nil)
                
                let heros = await herosNetwork.getHeros()
                #expect(heros.count == 2)
            }
            
            @Test("Hero Detail Network")
            func HeroDetailNetworkTest() async throws {
                let heroDetailNetwork = NetworkHeroDetailMock()
                #expect(heroDetailNetwork != nil)
                
                let heroDetail = await heroDetailNetwork.getHeroDetail(id: 1)
                #expect(heroDetail.count == 1)
            }
        }
        
        @Suite("Presentation") struct PresentationTest {
            @Test("Heros View Model")
            func HerosViewModelTest() async throws {
                let herosVM = HerosViewModel(useCaseHeros: HerosUseCaseMock())
                #expect(herosVM != nil)
                
                await herosVM.getHeros()
                #expect(herosVM.herosData.count == 2)
            }
            
            @Test("Hero Detail View Model")
            func HeroDetailViewModelTest() async throws {
                let heroDetailVM = HeroDetailViewModel(id: 1, useCaseHeroDetail: HeroDetailUseCaseMock())
                #expect(heroDetailVM != nil)
                
                await heroDetailVM.getHeroDetail(id: 1)
                #expect(heroDetailVM.heroDetailData.count == 1)
            }
        }
    }
}
