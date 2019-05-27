//
//  HomeViewRouter.swift
//  BeerCounter
//
//  Created by Fernando on 24/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

protocol HomeViewRouterInterface {
    func openLastBearsList(navController: UINavigationController)
    
}

class HomeViewRouter: HomeViewRouterInterface {


    func openLastBearsList(navController: UINavigationController) {
        let lastView = LastBearsRouter.createModuleLastBearViewController()
        navController.pushViewController(lastView, animated: true)
    }
    
    static func createModuleUsingNavigationController() -> UINavigationController {
        let router = HomeViewRouter()
        let view = ViewController()
        let presenter = HomeViewPresenter()
        presenter.view = view
        presenter.router = router
        view.presenter = presenter

        let navController = UINavigationController(rootViewController: view)

        presenter.navController = navController
        return navController
    }
}
