//
//  ProductDetailViewController.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 25.07.2023.
//

import UIKit
import SnapKit
import Kingfisher
import CoreData

class ProductDetailViewController: UIViewController {
    private var imageView : UIImageView = .init()
    private var titleLabel : UILabel = .init()
    private var priceLabel: UILabel = .init()
    private var descriptionLabel: UILabel = .init()
    private let basketButton : UIButton = .init(type: .system)
    private var productId : Int = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(onTapBack))
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(basketButton)
      
        buildImageView()
        buildTitleLabel()
        buildDescriptionLabel()
        buildPriceLabel()
        buildBasketButton()
        checkContainBasket()
    }
    
    func checkContainBasket()  {
        var basketList = BasketViewModel().fetchProducts()
        print("Basket List Length: \(basketList?.count)")
        if(basketList?.contains(productId) ?? false){
            basketButton.setTitle("Remove from Basket", for: .normal)
            basketButton.setTitleColor(.red, for: .normal)
        }else{
            basketButton.setTitle("Add To Basket", for: .normal)
        }
    }
    
  @objc func onTapBack() {
      self.dismiss(animated: true)
    }
    
    func setup(product:ProductModel)  {
        print(product.title)
        
        self.imageView.kf.setImage(with: product.images.first?.asUrl)
        self.titleLabel.text = product.title
        self.descriptionLabel.text = product.description
        self.priceLabel.text = "\(product.price)€"
        self.productId = product.id
    }


}


extension ProductDetailViewController {
    
    func buildImageView()  {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.snp.makeConstraints { make in
            make.width.equalTo(500)
            make.height.equalTo(300)
            make.top.equalTo(self.view.safeAreaInsets.bottom).offset(100)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)

        }
    }
    
    func buildTitleLabel()  {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.imageView.snp.bottom).offset(30)
            
        }
    }
    func buildDescriptionLabel()  {
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.descriptionLabel.numberOfLines = 2
        self.descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(70)
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            
        }
    }
    
    func buildPriceLabel()  {
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(15)
            
        }
    }
    
    func buildBasketButton()  {
        self.basketButton.translatesAutoresizingMaskIntoConstraints = false
        self.basketButton.tintColor = .blue
        self.basketButton.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        
        self.basketButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.priceLabel.snp.bottom).offset(15)
        }
    }

    
    @objc func addToBasket()  {
        BasketViewModel().setBasketProducts(productId: productId)
    }
    
}
