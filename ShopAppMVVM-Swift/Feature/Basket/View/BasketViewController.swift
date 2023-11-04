//
//  BasketViewController.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 27.07.2023.
//

import UIKit
import CoreData
class BasketViewController: UIViewController {
    private let titleLabel : UILabel = .init()
    private let viewModel : BasketViewModel = BasketViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(titleLabel)
        
        buildTitleLabel()
        
        viewModel.fetchBasketProducts()
    }
    



}

extension BasketViewController {
    func buildTitleLabel()  {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = "Basket View"
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaInsets.bottom).offset(60)
            make.centerX.equalTo(self.view)
        }
    }
}
