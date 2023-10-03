//
//  HomeTableViewController.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

protocol HomeTableViewControllerProtocol: AnyObject {
    func navigateToDetail(with data: CharacterModel?)
    func updateViews()
}


class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModelProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel?.onViewsLoaded()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "HomeCellTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeCell")
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.dataCount ?? 0
    }

    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCellTableView else {
            return UITableViewCell()
        }

        if let data = viewModel?.data(at: indexPath.row) {
            cell.updateViews(data: data)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onItemSelected(at: indexPath.row)
    }
    
}

extension HomeTableViewController: HomeTableViewControllerProtocol {
    func updateViews(){
        tableView.reloadData()
    }
    
    func navigateToDetail(with data: CharacterModel?) {
        let newController = DetailViewController()
        navigationController?.pushViewController(newController, animated: true)
    }
    
    
    
}
