//
//  HomeViewRouter.swift
//  BeerCounter
//
//  Created by Fernando on 24/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

protocol HomeViewRouterInterface {
    func openLastBearsList()
    
}

class HomeViewRouter: HomeViewRouterInterface {

    var navigationController: UINavigationController?

    func openLastBearsList() {
        let lastView = LastBearsRouter.createModuleLastBearViewController()
        navigationController?.pushViewController(lastView, animated: true)
    }
    
    func createModuleUsingNavigationController() -> UINavigationController {
        let interactor = HomeViewInteractor.shared
        let controller = HomeViewController(router: self, interactor: interactor)
        let view = HomeView(controller: controller)
        let navController = UINavigationController(rootViewController: view)
        navigationController = navController
        return navController
    }
}
