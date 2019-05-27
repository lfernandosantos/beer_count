//
//  ViewController.swift
//  BeerCounter
//
//  Created by Fernando on 23/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bearsDrank: UILabel!
    @IBOutlet weak var drinksToAddPicker: UIPickerView!
    @IBOutlet weak var addBearsButton: UIButton!
    @IBOutlet weak var goLastBearsList: UIBarButtonItem!
    
    let numberMaxCanAdd = 10

    var presenter: HomeViewPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinksToAddPicker.delegate = self


        let rightButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(goLastBears(_:)))

    
        self.navigationItem.setRightBarButton(rightButton, animated: true)
        self.navigationItem.title = "Bear Counter"
    }

    init() {
        super.init(nibName: "StartViewController", bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func addBearsAction(_ sender: Any) {
        showAlertConfirmation(bears: String(drinksToAddPicker.selectedRow(inComponent: 0) + 1))

    }
    @IBAction func goLastBears(_ sender: Any) {
        presenter.goLastBears()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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

extension ViewController {
    
    func showAlertConfirmation(bears: String) {
    let alertController = UIAlertController(title: nil, message: "Confirm number of drinks (\(bears))?", preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            self.presenter.addBears(numberOfBears: self.drinksToAddPicker.selectedRow(inComponent: 0) + 1)
        }
        alertController.addAction( confirmAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
