//
//  ResultModel.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation

struct ResultModel : Codable {
    let products : [ProductModel]
    let total : Int
    let skip : Int
    let limit : Int

}
