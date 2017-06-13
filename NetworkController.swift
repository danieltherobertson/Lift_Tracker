//
//  NetworkController.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 24/05/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import UIKit

class NetworkController: NSObject {
    
    let url = "https://wger.de/api/v2/exercise/?page=1"
    
    func performNetworkRequest(withURL target: String) {
        guard let url: URL = URL(string: target) else {
            print("Error: Invalid url target (\(target))")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
        
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let woo = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                let exercises = woo["results"]
            } catch  {
                print("error trying to convert data to JSON")
                return
        }
        }
        
        task.resume()
        
        
        
        }
}

