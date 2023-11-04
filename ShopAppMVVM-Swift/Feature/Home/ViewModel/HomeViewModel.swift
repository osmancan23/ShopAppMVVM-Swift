//
//  HomeViewModel.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation
import Combine

final class HomeViewModel : ObservableObject {
    @Published  var productList : [ProductModel] = .init()
    @Published  var errorMessage : String = ""
    @Published var isLoading : Bool = false
    
    
    func fetchProducts()  {
        isLoading = true
        ProductService().fetchAllProducts { [weak self] result in
            self?.productList = result.products
            self?.isLoading = false
        } onFailed: { error in
            self.isLoading = false
            self.errorMessage = error
        }

    }
    
}
