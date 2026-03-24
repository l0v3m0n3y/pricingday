import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: request) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data, let response = response {
                    continuation.resume(returning: (data, response))
                } else {
                    continuation.resume(throwing: URLError(.unknown))
                }
            }
            task.resume()
        }
    }
}


public class Pricingday {
    private let api = "https://pricing.day/_next/data/ltZLXFvzTh1RillBuqeGx"
    private let api_2 = "https://pricing.day/api/v01"
    private var headers: [String: String]
    
    public init() {
        self.headers = [
        "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
        "Host":"pricing.day",
        "Connection":"keep-alive",
        "Accept-Encoding":"deflate, zstd",
        "Accept-Language":"en-US,en;q=0.9",
        "User-Agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"
        ]

    }
    
    public func get_index() async throws -> Any {
        guard let url = URL(string: "\(api)/index.json") else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try JSONSerialization.jsonObject(with: data)
    }
    
    public func get_catalog() async throws -> Any {
        guard let url = URL(string: "\(api)/catalog.json") else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try JSONSerialization.jsonObject(with: data)
    }
    
    public func get_from_catalog(id: Int) async throws -> Any {
        guard let url = URL(string: "\(api)/catalog/\(id).json") else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try JSONSerialization.jsonObject(with: data)
    }
    
    public func get_products_by_id(id: Int) async throws -> Any {
        guard let url = URL(string: "\(api)/products/\(id).json") else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try JSONSerialization.jsonObject(with: data)
    }
    
    public func get_product_details(id: Int) async throws -> Any {
        guard let url = URL(string: "\(api_2)/product/details/\(id)") else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try JSONSerialization.jsonObject(with: data)
    }
    
    public func get_news_by_id(id: Int) async throws -> Any {
        guard let url = URL(string: "\(api)/news/\(id).json") else {
            throw NSError(domain: "Invalid URL", code: -1)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        return  try JSONSerialization.jsonObject(with: data)
    }
}
