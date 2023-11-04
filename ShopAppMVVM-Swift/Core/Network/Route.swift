//
//  Route.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation



enum Route {
    
    static let baseUrl  = "https://dummyjson.com"
    
    case fetchAllProducts
    case searchProduct(String)
    
    
    var value : String {
        
        switch self {
        case .fetchAllProducts : return "/products"
            
            
        case .searchProduct(let word) : return "/products/search?q=\(word)"
        }
    }
    
}
