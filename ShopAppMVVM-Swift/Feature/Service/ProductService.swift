//
//  ProductService.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation

protocol IProductService {
    func fetchAllProducts(onSuccess : @escaping (ResultModel) -> Void , onFailed: @escaping(String) -> Void)
    
    func searchProducts(searchWord: String, onSuccess: @escaping(ResultModel)-> Void , onFailed: @escaping(String)-> Void)
}

class ProductService : IProductService {
    func searchProducts(searchWord: String, onSuccess: @escaping (ResultModel) -> Void, onFailed: @escaping (String) -> Void) {
        NetworkManager.request(onSuccess: onSuccess, onFailed: onFailed, route: .searchProduct(searchWord), method: .get)
    }
    
    
    func fetchAllProducts(onSuccess: @escaping (ResultModel) -> Void, onFailed: @escaping (String) -> Void) {
        NetworkManager.request(onSuccess: onSuccess, onFailed: onFailed, route: .fetchAllProducts, method: .get)
    }
    
    
   
    
}
