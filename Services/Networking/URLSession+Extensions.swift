//
//  URLSession+Extensions.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation

extension URLSession {
    @discardableResult
    func load<A>(_ e: Endpoint<A>, onComplete: @escaping (Result<A, Error>) -> ()) -> URLSessionDataTask {
        let r = e.request
        let task = dataTask(with: r, completionHandler: { data, resp, err in
            guard let h = resp as? HTTPURLResponse else {
                onComplete(.failure(UnknownError()))
                return
            }
            
            guard e.expectedStatusCode(h.statusCode) else {
                onComplete(.failure(WrongStatusCodeError(statusCode: h.statusCode, response: h)))
                return
            }
            
            onComplete(e.parse(data,resp))
        })
        task.resume()
        return task
    }

    public func onDelegateQueue(_ f: @escaping () -> ()) {
        self.delegateQueue.addOperation(f)
    }
}
