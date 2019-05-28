//
//  HomeViewInteractor.swift
//  BeerCounter
//
//  Created by Luiz Fernando dos Santos on 26/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation

protocol HomeViewInteractorInterface {
    func saveBeers(numberOfBeer: Int)
    func getBeers() -> Int
}

class HomeViewInteractor: HomeViewInteractorInterface {
    private let beersKey = "beers"

    public static let shared: HomeViewInteractor = HomeViewInteractor()
    
    private init() { }
    
    internal func saveBeers(numberOfBeer: Int) {
        let savedBeers = getBeers()
        let beers = savedBeers + numberOfBeer
        UserDefaults.standard.set(beers, forKey: beersKey)
    }

    internal func getBeers() -> Int {
        return UserDefaults.standard.integer(forKey: beersKey)
    }
}
