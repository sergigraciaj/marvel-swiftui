import Foundation

public struct ResponseModel<T: Codable>: Codable {
    public let data: DataModel<T>
}

public struct DataModel<T: Codable>: Codable {
    public let results: T
}
