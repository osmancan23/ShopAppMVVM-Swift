//
//  ProductTableViewCell.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 1.08.2023.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    private let titleLabel : UILabel = .init()
    private let productImageView : UIImageView = .init()
    private let view : UIView = .init()
    static let identifier = "ProductTableViewCell"

    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("calıs")
        contentView.addSubview(view)
        view.addSubview(titleLabel)
        view.addSubview(productImageView)
        
        buildView()
        buildImageView()
        buildTitle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(product:ProductModel)  {
        self.titleLabel.text = product.title
        self.productImageView.kf.setImage(with: product.images.first?.asUrl)
    }
}


extension ProductTableViewCell {

    func buildView()  {
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))

        }
    }
    
    func buildTitle()  {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Product"
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.left.equalTo(self.productImageView.snp.right).offset(20)
        }
    }
    
    func buildImageView (){
        self.productImageView.translatesAutoresizingMaskIntoConstraints = false
        self.productImageView.image = UIImage(systemName: "pencil")
        
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(80)
            make.left.equalTo(self.view).offset(20)
        }
        
    }
}

