//
//  ViewController.swift
//  BeerCounter
//
//  Created by Fernando on 23/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: NewBaseViewController {
    func updateBeersViews(numberBeerDrank: String, orders: [String], totalPrice: String)
    func cleanOrder()
}

class HomeView: NewBaseViewController, HomeViewProtocol {

    @IBOutlet weak var bearsDrank: UILabel!
    @IBOutlet weak var drinksToAddPicker: UIPickerView!
    @IBOutlet weak var addBearsButton: UIButton!
    @IBOutlet weak var goLastBearsList: UIBarButtonItem!
    @IBOutlet weak var tableViewOrders: UITableView!
    @IBOutlet weak var textFieldBeerPrice: UITextField!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    @IBOutlet weak var totalStackView: UIStackView!
    var orders: [String] = []
    
    let numberMaxCanAdd = 10
    
    var controller: HomeViewControllerProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinksToAddPicker.delegate = self
        textFieldBeerPrice.delegate = self

        let rightButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(goLastBears(_:)))

        self.navigationItem.setRightBarButton(rightButton, animated: true)
        
        totalStackView.addBackground(color: .gray)
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
    
    func updateBeersViews(numberBeerDrank: String, orders: [String], totalPrice: String) {
        bearsDrank.text = numberBeerDrank
        labelTotalPrice.text = totalPrice
        self.orders = orders
        tableViewOrders.reloadData()
    }
    
    @IBAction func cleanOrder() {
        controller.cleanOrder()
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

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = orders[indexPath.row]
        
        return cell
    }
    
    
    
}

extension HomeView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        controller.endEditing(textField.text)
    }
}


extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
