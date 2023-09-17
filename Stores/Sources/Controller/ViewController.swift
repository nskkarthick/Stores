//
//  ViewController.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var menuListTableView: UITableView!
    @IBOutlet weak var searchTxtField: UITextField!
    
    var menuViewModel = MenuViewModel()
    
    // Mark: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getMenuListFromStores()
    }
    
    // Mark: - Custom methods
    
    private func setupUI() {
        searchView.layer.borderWidth = 0.3
        searchView.layer.borderColor = UIColor.gray.cgColor
        searchView.layer.cornerRadius = 3
        menuViewModel.delegate = self
        searchTxtField.delegate = self
        menuListTableView.registerCell(CategoriesCell.self)
        menuListTableView.registerCell(BannersCell.self)
        menuListTableView.registerCell(ProductsCell.self)
    }

    func getMenuListFromStores() {
        menuViewModel.getMenuList()
    }

}

// Mark: - MenuViewModelDelegate methods

extension ViewController: MenuViewModelDelegate {
    
    func reloadMenuList() {
        DispatchQueue.main.async { [weak self] in
            self?.menuListTableView.dataSource = self?.menuViewModel
            self?.menuListTableView.delegate = self?.menuViewModel
            self?.menuListTableView.reloadData()
        }
    }

}

// Mark: - UITextFieldDelegate methods

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
