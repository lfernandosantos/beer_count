//
//  NewBaseViewController.swift
//  BeerCounter
//
//  Created by Fernando on 27/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class NewBaseViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationLogo()
        self.setBackButton()
    }
    
    private func setBackButton() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    private func setNavigationLogo() {
        let iconLogo = UILabel()
        iconLogo.text = "Beears - Count"
        iconLogo.textColor = .white
        iconLogo.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        iconLogo.textAlignment = .center
        self.navigationItem.titleView = iconLogo
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    
    func showAlert(title: String?, message: String?, buttonActions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttonActions.forEach({ action in
            alert.addAction(action)
        })
        present(alert, animated: true, completion: nil)
    }
    
}
