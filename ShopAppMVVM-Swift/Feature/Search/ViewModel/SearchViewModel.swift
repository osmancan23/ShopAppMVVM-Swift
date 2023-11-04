//
//  SearchViewModel.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 12.08.2023.
//

import Foundation

final class SearchViewModel : ObservableObject {
    @Published var productList : [ProductModel] = .init()
    @Published var errorMesage : String = .init()
    @Published var isLoading : Bool = false
    
    func fetchSearchProducts(word: String)  {
        self.isLoading = true
        ProductService().searchProducts(searchWord: word) { [weak self] response in
            self?.productList = response.products
            self?.isLoading = false

        } onFailed: { [weak self] error in
            self?.errorMesage = error
            self?.isLoading = false

        }
    }
    
    
}

