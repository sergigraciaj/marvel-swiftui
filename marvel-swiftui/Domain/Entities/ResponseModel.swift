import Foundation

public struct ResponseModel<T: Codable>: Codable {
    public let code: Int
    public let status: String
    public let copyright: String
    public let attributionText: String
    public let attributionHTML: String
    public let etag: String
    public let data: DataModel<T>
}

public struct DataModel<T: Codable>: Codable {
    public let offset: Int
    public let limit: Int
    public let total: Int
    public let count: Int
    public let results: T
}
