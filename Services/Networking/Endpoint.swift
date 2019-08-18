//
//  Endpoint.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation

struct Endpoint<A> {
    public enum Method {
        case get, post, put, patch
    }
    
    public var request: URLRequest
    var parse: (Data?, URLResponse?) -> Result<A, Error>
    var expectedStatusCode: (Int) -> Bool = expected200to300
    
    func map<B>(_ f: @escaping (A) -> B) -> Endpoint<B> {
        return Endpoint<B>(request: request, expectedStatusCode: expectedStatusCode, parse: { value, response in
            self.parse(value, response).map(f)
        })
    }

    func compactMap<B>(_ transform: @escaping (A) -> Result<B, Error>) -> Endpoint<B> {
        return Endpoint<B>(request: request, expectedStatusCode: expectedStatusCode, parse: { data, response in
            self.parse(data, response).flatMap(transform)
        })
    }

    init(_ method: Method,
         url: URL, accept: ContentType? = nil,
         contentType: ContentType? = nil,
         body: Data? = nil,
         headers: [String:String] = [:],
         expectedStatusCode: @escaping (Int) -> Bool = expected200to300,
         timeOutInterval: TimeInterval = 10,
         query: [String:String] = [:],
         parse: @escaping (Data?, URLResponse?) -> Result<A, Error>) {
        
        var comps = URLComponents(string: url.absoluteString)!
        comps.queryItems = comps.queryItems ?? []
        comps.queryItems!.append(contentsOf: query.map { URLQueryItem(name: $0.0, value: $0.1) })
        request = URLRequest(url: comps.url!)
        if let a = accept {
            request.setValue(a.rawValue, forHTTPHeaderField: "Accept")
        }
        if let ct = contentType {
            request.setValue(ct.rawValue, forHTTPHeaderField: "Content-Type")
        }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.timeoutInterval = timeOutInterval
        request.httpMethod = method.string

        // body *needs* to be the last property that we set, because of this bug: https://bugs.swift.org/browse/SR-6687
        request.httpBody = body

        self.expectedStatusCode = expectedStatusCode
        self.parse = parse
    }
    
    init(request: URLRequest,
         expectedStatusCode: @escaping (Int) -> Bool = expected200to300,
         parse: @escaping (Data?, URLResponse?) -> Result<A, Error>) {
        self.request = request
        self.expectedStatusCode = expectedStatusCode
        self.parse = parse
    }
}

extension Endpoint: CustomStringConvertible {
    public var description: String {
        let data = request.httpBody ?? Data()
        return "\(request.httpMethod ?? "GET") \(request.url?.absoluteString ?? "<no url>") \(String(data: data, encoding: .utf8) ?? "")"
    }
}

extension Endpoint.Method {
    var string: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .patch: return "PATCH"
        }
    }
}

extension Endpoint where A == () {
     init(_ method: Method, url: URL,
          accept: ContentType? = nil,
          headers: [String:String] = [:],
          expectedStatusCode: @escaping (Int) -> Bool = expected200to300,
          query: [String:String] = [:]) {
        
        self.init(method, url: url,
                  accept: accept,
                  headers: headers,
                  expectedStatusCode: expectedStatusCode,
                  query: query, parse: { _, _ in .success(()) })
    }

     init<B: Codable>(json method: Method,
                      url: URL,
                      accept: ContentType? = .json,
                      body: B, headers: [String:String] = [:],
                      expectedStatusCode: @escaping (Int) -> Bool = expected200to300,
                      query: [String:String] = [:]) {
        let b = try! JSONEncoder().encode(body)
        self.init(method, url: url, accept: accept, contentType: .json, body: b, headers: headers, expectedStatusCode: expectedStatusCode, query: query, parse: { _, _ in .success(()) })
    }
}

extension Endpoint where A: Decodable {
     init(json method: Method,
          url: URL,
          accept: ContentType = .json,
          headers: [String: String] = [:],
          expectedStatusCode: @escaping (Int) -> Bool = expected200to300,
          query: [String: String] = [:],
          decoder: JSONDecoder? = nil) {
        let d = decoder ?? JSONDecoder()
        
        self.init(method,
                  url: url,
                  accept: accept,
                  body: nil,
                  headers: headers,
                  expectedStatusCode: expectedStatusCode,
                  query: query) { data, _ in
            return Result {
                guard let dat = data else { throw NoDataError() }
                return try d.decode(A.self, from: dat)
            }
        }
    }

     init<B: Codable>(json method: Method,
                      url: URL, accept: ContentType = .json,
                      body: B? = nil,
                      headers: [String: String] = [:],
                      expectedStatusCode: @escaping (Int) -> Bool = expected200to300,
                      query: [String: String] = [:]) {
        
        let b = body.map { try! JSONEncoder().encode($0) }
        self.init(method, url: url, accept: accept, contentType: .json, body: b, headers: headers, expectedStatusCode: expectedStatusCode, query: query) { data, _ in
            return Result {
                guard let dat = data else { throw NoDataError() }
                return try JSONDecoder().decode(A.self, from: dat)
            }
        }
    }
}
