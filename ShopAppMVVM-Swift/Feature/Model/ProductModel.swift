//
//  ProductModel.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
