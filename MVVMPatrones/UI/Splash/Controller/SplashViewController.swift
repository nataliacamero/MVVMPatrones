//
//  SplashViewController.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import UIKit

//MARK: - PROTOCOLO -
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
    //Metodo cargar activity indicator
    func showLoding(_ show: Bool) {
        switch show {
            case true where !activityIndicator.isAnimating:
                activityIndicator.startAnimating()
            case false where activityIndicator.isAnimating:
                activityIndicator.stopAnimating()
            default: break
        }
    }
    //Metodo para navegar a la vista
    func navigateToHome() {
        // creo vista, siempre que creo la vista debo ir a crearla, y es ahi donde se instancia, en donde voy a ir a navegar hacia ella.
        let newViewController = HomeTableViewController()// Vista delegada
        // creo viewModel
        newViewController.viewModel = HomeViewModel(viewDelegate: newViewController)// Inyeccion de dependencias, es decir inyecto la clase.
        navigationController?.setViewControllers([newViewController], animated: true)
    }
    
    
    
}
