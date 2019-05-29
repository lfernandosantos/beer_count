//
//  HomeViewController.swift
//  BeerCounter
//
//  Created by Fernando on 24/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit


protocol HomeViewControllerProtocol {
    func viewDidLoad(view: HomeView)
    func viewWillApper()
    func addBeers(numberOfBeers: Int)
    func goNewView(_ viewToGo: ViewsToGo)
    func cleanOrder()
    func endEditing(_ text: String?)
}

enum ViewsToGo {
    case lastBeers
}

class HomeViewController: HomeViewControllerProtocol {
    
    let router: HomeViewRouterInterface
    let interactor: HomeViewInteractorInterface
    private var view: HomeViewProtocol?
    
    var priceBeer: Int = 0
    
    init(router: HomeViewRouterInterface, interactor: HomeViewInteractorInterface) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: HomeView){
        self.view = view
    }
    
    func viewWillApper(){
        updateViews()
    }
    
    func addBeers(numberOfBeers: Int) {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            self.saveMoreBeers(numberOfBeers: numberOfBeers)
        }
        self.view?.showAlert(title: nil, message: "Confirm number of drinks (\(numberOfBeers))?", buttonActions: [cancelAction, confirmAction])
        
    }
    
    func saveMoreBeers(numberOfBeers: Int){
        interactor.saveBeers(numberOfBeer: numberOfBeers)
        updateViews()
    }
    
    func updateViews(){
        var beers: Int = 0
        let orders = interactor.getOrders()
    
        let itemList = orders.map { (item) -> String in
            var i = Utils.getDateFormatted(date: item.date! as Date)
            i += " - \(item.numberOfBeers)"
            
            beers += Int(item.numberOfBeers)
            return i
        }
        
        let totalCalculated = "\(priceBeer * beers)"
        
        self.view?.updateBeersViews(numberBeerDrank: String(beers), orders: itemList, totalPrice: totalCalculated )
    }
    
    func goNewView(_ viewToGo: ViewsToGo) {
        switch viewToGo {
        case .lastBeers:
            router.openLastBearsList()
        }
    }
    
    func cleanOrder() {
        interactor.cleanOrderDB()
        updateViews()
    }
    
    func endEditing(_ text: String?) {
        priceBeer = Int(text ?? "0") ?? 0
        updateViews()
    }
}

class Utils {
    static func getDateFormatted(date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "[dd] HH : mm "
        return formater.string(from: date)
    }
}
