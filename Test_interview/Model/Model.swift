//
//  Model.swift
//  Test_interview
//
//  Created by Raman Kozar on 12/06/2023.
//

import Foundation
import Alamofire

struct MainResult {
    let title: String?
}

class MainAPI {
    
    func downloadDataUsingAPI(_ urlRequestString: URL, completion: @escaping (_ data: NSDictionary?, _ error: String?) -> Void) {
        
        AF.request(urlRequestString).validate().responseJSON { data in
            
            if let json = try? data.result.get() {
                completion(json as? NSDictionary, nil)
            } else {
                completion(nil, "Error")
                return
            }
            
        }
        
    }
    
}
