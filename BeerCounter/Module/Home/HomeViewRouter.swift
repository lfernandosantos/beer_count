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
    func openLastBearsList() {
        
    }
    
    static func createModule(using navigationController: UINavigationController) -> ViewController {
        let router = HomeViewRouter()
        let view 
    }
}
