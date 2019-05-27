//
//  HomeViewPresenter.swift
//  BeerCounter
//
//  Created by Luiz Fernando dos Santos on 26/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit


protocol HomeViewPresenterInterface {

    func addBears(numberOfBears: Int)
    func goLastBears()
}

class HomeViewPresenter: HomeViewPresenterInterface {

    let interactor = HomeViewInteractor()
    var router: HomeViewRouterInterface!
    var view: ViewController!
    var navController: UINavigationController!
    
    func addBears(numberOfBears: Int) {
        interactor.saveBears(numberOfBear: numberOfBears)
    }

    func goLastBears() {
        router.openLastBearsList(navController: navController)
    }
    
}
