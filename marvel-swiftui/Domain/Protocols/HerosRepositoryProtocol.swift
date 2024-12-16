import Foundation

protocol HerosRepositoryProtocol{
    func getHeros() async -> [HerosModel]
}
