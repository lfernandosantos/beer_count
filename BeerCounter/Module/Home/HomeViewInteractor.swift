//
//  HomeViewInteractor.swift
//  BeerCounter
//
//  Created by Luiz Fernando dos Santos on 26/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation

protocol HomeViewInteractorInterface {
    func saveBears(numberOfBear: Int)
    func getBears() -> Int
}

class HomeViewInteractor: HomeViewInteractorInterface {
    private let bearsKey = "bears"

    func saveBears(numberOfBear: Int) {
        let bears = getBears() + numberOfBear
        UserDefaults.standard.set(bearsKey, forKey: bearsKey)
    }

    func getBears() -> Int {
        return UserDefaults.standard.integer(forKey: bearsKey)
    }
}
