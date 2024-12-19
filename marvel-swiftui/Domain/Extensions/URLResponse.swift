import Foundation

extension URLResponse {
     func getResponseCode() -> Int {
        if let resp = self as? HTTPURLResponse {
            return resp.statusCode
        } else{
            return 500
        }
    }
}
