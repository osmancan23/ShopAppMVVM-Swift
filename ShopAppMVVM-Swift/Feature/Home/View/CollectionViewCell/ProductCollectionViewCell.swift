//
//  ProductCollectionViewCell.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 19.07.2023.
//

import UIKit
import SnapKit
import Kingfisher
class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    private let view : UIView = .init()
    private var imageView : UIImageView = .init(image: nil)
    private var titleLabel : UILabel = .init()
    private var priceLabel : UILabel = .init()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        buildView()
        buildTitleLabel()
        buildImageView()
        buildPriceLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(product: ProductModel?)  {
        self.titleLabel.text = product?.title ?? "-"
        self.imageView.kf.setImage(with: product?.images.first?.asUrl)
        self.priceLabel.text =  "\(String(describing: product!.price))€"
    }
    
}

extension ProductCollectionViewCell {
    
    func buildImageView()  {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "macbook")
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints { make in
            make.width.equalTo(self.view)
            make.height.equalTo(100)

            make.top.equalTo(self.view).offset(10)
        }
        
    }
    
    func buildTitleLabel()  {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Product Name"
        titleLabel.numberOfLines = 2
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(140)
            make.top.equalTo(self.imageView).offset(110)
            make.left.equalTo(self.view).offset(10)
        }
    }
    
    func buildView()  {
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))

        }
    }
    
    func buildPriceLabel()  {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "55.000₺"
        priceLabel.textColor = .gray
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel).offset(60)
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.leading.equalTo(self.titleLabel)
        }
    }
}
