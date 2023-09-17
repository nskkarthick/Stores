//
//  ViewModel.swift
//  Stores
//
//  Created by KarthickNachimuthu on 17/09/23.
//

import Foundation
import UIKit

protocol MenuViewModelDelegate: AnyObject {
    func reloadMenuList()
}

class MenuViewModel: NSObject {
    
    weak var delegate: MenuViewModelDelegate?
    var model: GetMenuList
    var menus: MenuList?
    
    override init() {
        model = MenuModel()
    }
    
    // Mark: - Custom methods
    
    func getMenuList() {
        let apiRequest = URLRequest(url: URL(string: APIRoot.MenuList.rawValue)!)
        model.dataRequest(urlRequest: apiRequest.url!) { (response: Result<MenuList, Error>) in
            switch response {
            case .success(let menuList):
                self.menus = menuList
                self.delegate?.reloadMenuList()
            case .failure( _): break
            }
        }
    }
    
}

// Mark: - UITableViewDelegate and UITableViewDataSource methods

extension MenuViewModel: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus?.homeData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if menus?.homeData[indexPath.row].type == "category" {
            let cell = tableView.dequeueCell(CategoriesCell.self, indexPath) as? CategoriesCell
            cell?.updateCategoryTableViewCell(details: menus?.homeData[indexPath.row])
            return cell ?? UITableViewCell()
        } else if menus?.homeData[indexPath.row].type == "banners" {
            let cell = tableView.dequeueCell(BannersCell.self, indexPath) as? BannersCell
            cell?.updateCategoryTableViewCell(details: menus?.homeData[indexPath.row])
            return cell ?? UITableViewCell()
        } else if menus?.homeData[indexPath.row].type == "products" {
            let cell = tableView.dequeueCell(ProductsCell.self, indexPath) as? ProductsCell
            cell?.updateCategoryTableViewCell(details: menus?.homeData[indexPath.row])
            return cell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if menus?.homeData[indexPath.row].type == "category" {
            return 100
        } else if menus?.homeData[indexPath.row].type == "banners" {
            return 191
        } else if menus?.homeData[indexPath.row].type == "products" {
            return 290
        } else {
            return 0
        }
    }
    
}

