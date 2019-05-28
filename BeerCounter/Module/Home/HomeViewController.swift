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
    
}

enum ViewsToGo {
    case lastBeers
}

class HomeViewController: HomeViewControllerProtocol {
    
    let router: HomeViewRouterInterface
    let interactor: HomeViewInteractorInterface
    private var view: HomeViewProtocol?
    
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
        let beers = String(interactor.getBeers())
        self.view?.updateBeersViews(numberBeerDrank: beers)
    }
    
    func goNewView(_ viewToGo: ViewsToGo) {
        switch viewToGo {
        case .lastBeers:
            router.openLastBearsList()
        }
    }
}
