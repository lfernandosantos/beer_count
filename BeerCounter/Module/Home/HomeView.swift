//
//  ViewController.swift
//  BeerCounter
//
//  Created by Fernando on 23/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit


protocol HomeViewProtocol: NewBaseViewController {
    func updateBeersViews(numberBeerDrank: String)
}

class HomeView: NewBaseViewController, HomeViewProtocol {

    @IBOutlet weak var bearsDrank: UILabel!
    @IBOutlet weak var drinksToAddPicker: UIPickerView!
    @IBOutlet weak var addBearsButton: UIButton!
    @IBOutlet weak var goLastBearsList: UIBarButtonItem!
    
    let numberMaxCanAdd = 10
    
    var controller: HomeViewControllerProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinksToAddPicker.delegate = self

        let rightButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(goLastBears(_:)))

        self.navigationItem.setRightBarButton(rightButton, animated: true)
        
        controller.viewDidLoad(view: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controller.viewWillApper()
    }
    
    init(controller: HomeViewControllerProtocol) {
        self.controller = controller
        super.init(nibName: "HomeView", bundle: nil)

    }
    
    func updateBeersViews(numberBeerDrank: String) {
        bearsDrank.text = numberBeerDrank
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func addBearsAction(_ sender: Any) {
        let numberOfBeers = drinksToAddPicker.selectedRow(inComponent: 0) + 1
        controller.addBeers(numberOfBeers: numberOfBeers)
    }
    
    @IBAction func goLastBears(_ sender: Any) {
       controller.goNewView(.lastBeers)
    }
}

extension HomeView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberMaxCanAdd
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(row + 1)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

