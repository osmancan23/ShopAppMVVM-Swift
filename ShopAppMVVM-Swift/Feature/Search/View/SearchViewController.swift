//
//  SearchViewController.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 27.07.2023.
//

import UIKit
import Combine
class SearchViewController: UIViewController {
    private let titleLabel : UILabel = .init()
    private let searchField : UITextField = .init()
    private let productTableView : UITableView = .init()
    private var subscriptions : Set<AnyCancellable> = []

    var productList : [ProductModel] = []
    var errorMessage : String = ""
    
    
    private let viewModel : SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(searchField)
        view.addSubview(productTableView)
        
        buildTitleLabel()
        buildSearchField()
        buildProductTableView()
        
        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.rowHeight = 100
        
        viewModel.fetchSearchProducts(word: "")
        bindViews()
        
    }
    
    func bindViews()  {
        viewModel.$productList.sink { completion in
            if case .failure(let error) = completion {
                self.errorMessage = error.localizedDescription
            }
        } receiveValue: { result in
            print("sink calıstı \(result.count)")
            self.productList = result
            self.productTableView.reloadData()
        }.store(in: &subscriptions)

    }
    

    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text != nil {
            viewModel.fetchSearchProducts(word: textField.text!)
        }
    }

}


extension SearchViewController {
    
    func buildTitleLabel()  {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = "Search View"
        
        self.titleLabel.snp.makeConstraints { make in
           
            make.top.equalTo(self.view.safeAreaInsets.bottom).offset(60)
            make.centerX.equalTo(self.view)
        }
    }
    
    func buildSearchField()  {
        self.searchField.translatesAutoresizingMaskIntoConstraints = false
        self.searchField.placeholder = "Search a product .."
        self.searchField.borderStyle = .roundedRect
        self.searchField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        self.searchField.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
        }
        
        
        
        self.searchField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        
    
    }
    
    func buildProductTableView()  {
        self.productTableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.productTableView.snp.makeConstraints { make in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.searchField.snp.bottom).offset(20)
            make.bottom.bottom.equalTo(self.view)
        }
    }
}

extension SearchViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.setup(product: self.productList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        vc.setup(product: self.productList[indexPath.row])
        let controller = UINavigationController(rootViewController: vc)
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
}


