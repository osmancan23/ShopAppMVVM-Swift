import UIKit
import SnapKit
import Combine
import ProgressHUD
class HomeViewController: UIViewController {

    private let titleLabel: UILabel = .init()
    private let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let viewModel = HomeViewModel()
    
    private var subscriptions : Set<AnyCancellable> = []
    private  var productList : [ProductModel] = []
    private var errorMessage : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
    
        buildTitleLabel()
        buildCollectionView()
       
        
        self.collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.fetchProducts()
        combineView()
    }
    
    func combineView()  {
        viewModel.$productList.sink { completion in
            if case .failure(let error) = completion {
                          self.errorMessage = error.localizedDescription
                print(error.localizedDescription)
                      }
        } receiveValue: { list in
            self.productList = list
            self.collectionView.reloadData()
            print(list.count)
        }.store(in: &subscriptions)

        viewModel.$isLoading.sink { value in
            if(value){
                ProgressHUD.showProgress("Loading...", 0.99)
            }else{
                ProgressHUD.dismiss()
            }
        }.store(in: &subscriptions)
        
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        if self.productList.count > 0 && indexPath.row < self.productList.count {
            cell.setup(product: self.productList[indexPath.row])

        }
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 170, height: 240)
        }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        vc.setup(product: self.productList[indexPath.row])
        let controller = UINavigationController(rootViewController: vc)
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
}


extension HomeViewController {
    func buildTitleLabel()  {
        titleLabel.text = "Home View"

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaInsets.bottom).offset(60)
            make.centerX.equalTo(self.view)
        }
    }
    
    func buildCollectionView()  {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(40)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.bottom.equalTo(self.view)
        }
    }
    
    
}
