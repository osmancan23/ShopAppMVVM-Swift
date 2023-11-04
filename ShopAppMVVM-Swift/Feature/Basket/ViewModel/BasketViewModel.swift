//
//  BasketViewModel.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 13.08.2023.
//

import Foundation
import CoreData
import UIKit

final class BasketViewModel : ObservableObject {

    func fetchBasketProducts() -> [Int]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketEntity")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
          let results =  try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                let basketlist =  result.value(forKey: "basketList") as? [Int]
                print("Gelen basket list: \(basketlist?.count)")
                return basketlist ?? []
                
            }
        }catch {
            return []
        }
        
        return []
    }
    
    
    func fetchProducts() -> [Int]? {
        let defaults = UserDefaults.standard
        
       return (defaults.array(forKey: "basketItems") as? [Int]) ?? [];
    }
    
    func setBasketProducts(productId: Int){
        let defaults = UserDefaults.standard
        var basketList = (defaults.array(forKey: "basketItems") as? [Int]) ?? []
        if(!basketList.contains(productId) ){
            basketList.append(productId)
            defaults.setValue(basketList, forKey: "basketItems")

        }
    }

}
