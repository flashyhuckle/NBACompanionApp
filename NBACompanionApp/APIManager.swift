//
//  APIManager.swift
//  NBACompanionApp
//
//  Created by Marcin Głodzik on 25/05/2023.
//

import Foundation

struct TeamsResponse: Decodable {
    let response: [Team]
    
    struct Team: Decodable {
        let name: String
    }
}


struct APIManager {
    
    func performRequest() {
        
        let headers = [
            "X-RapidAPI-Key": "7073e271b18148bcceefe78cd090ed28",
            "X-RapidAPI-Host": "v1.basketball.api-sports.io"
        ]
        
        let urlStringID = "https://v1.basketball.api-sports.io/teams?id=139"
        let urlStringConference = "https://v1.basketball.api-sports.io/teams?conference=East"
        
        let request = NSMutableURLRequest(url: NSURL(string: urlStringID)! as URL,
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
//                print(httpResponse)
                do {
                    let decodedData = try JSONDecoder().decode(TeamsResponse.self, from: data!)
                    print(decodedData.response.count)
                    print(decodedData)
                } catch {
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
}
