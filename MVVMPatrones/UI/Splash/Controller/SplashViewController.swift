//
//  SplashViewController.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

//MARK: - PROTOCOLO

protocol SplashViewControllerProtocol: AnyObject {
    func showLoding(_ show: Bool)
    func navigateToHome()
    
}


//MARK: - CLASE -

class SplashViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewLoaded()

        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }

}

//MARK: - EXTENSION -

extension SplashViewController: SplashViewControllerProtocol {
    func showLoding(_ show: Bool) {
        switch show {
            case true where !activityIndicator.isAnimating:
                activityIndicator.startAnimating()
            case false where activityIndicator.isAnimating:
                activityIndicator.stopAnimating()
            default: break
        }
    }
    
    func navigateToHome() {
        // creo vista
        let newvc = HomeTableViewController()
        // creo viewModel
        newvc.viewModel = HomeViewModel(viewDelegate: newvc)
        navigationController?.setViewControllers([newvc], animated: true)
    }
    
    
    
}
