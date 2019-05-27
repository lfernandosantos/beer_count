//
//  LastBearsRouter.swift
//  BeerCounter
//
//  Created by Luiz Fernando dos Santos on 26/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit


class LastBearsRouter {
    static func createModuleLastBearViewController() -> UIViewController {
        let router = LastBearsRouter()
        let view = LastBearsViewController()
        return view
    }
}
