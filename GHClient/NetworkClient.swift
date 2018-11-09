//
//  NetworkClient.swift
//  GHClient
//
//  Created by zengge  on 2018/11/6.
//  Copyright © 2018 com.thoughtworks.workshop. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkClient {
    func get(url: URL, header: [String: String]?, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkImpl: NetworkClient {
    func get(url: URL, header: [String : String]?, completion: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, headers: header).response{ response in
            if(response.error != nil) {
                completion(nil, response.error)
            } else {
                completion(response.data, nil)
            }
        }
    }
}
