//
//  APIManager.swift
//  NBACompanionApp
//
//  Created by Marcin Głodzik on 25/05/2023.
//

import Foundation

struct APIManager {
    
    func performRequest() {
        
        let headers = [
            "X-RapidAPI-Key": "7ab61f3e56mshc11bba9e2a6cc0ap187439jsn0ad3ffa31232",
            "X-RapidAPI-Host": "api-nba-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api-nba-v1.p.rapidapi.com/seasons")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }
    
}
