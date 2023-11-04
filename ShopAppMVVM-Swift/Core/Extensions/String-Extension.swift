//
//  String-Extension.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import Foundation

extension String {
    
    var asUrl : URL? {
        return URL(string: self)
    }
}
