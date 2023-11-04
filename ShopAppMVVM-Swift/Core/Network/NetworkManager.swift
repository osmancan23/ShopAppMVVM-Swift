//
//  NetworkManager.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation
import Alamofire

class NetworkManager {
   
    static func request <T:Codable>(onSuccess: @escaping (T) -> Void , onFailed: @escaping (String) -> Void, route: Route, method:HTTPMethod, parameters:Parameters?=nil,headers:HTTPHeaders?=nil){
              let urlString = Route.baseUrl + route.value
                      
              guard let url = urlString.asUrl else { return  }
              
          
              AF.request(url,method: method,parameters: parameters,headers: headers).responseDecodable(of:T.self) { result in
                  
                  guard let value = result.value else{
                      onFailed(result.error!.localizedDescription)
                      return
                  }
                  
                  onSuccess(value)
          
              }
      }
}
