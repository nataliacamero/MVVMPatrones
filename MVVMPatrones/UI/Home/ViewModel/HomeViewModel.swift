//
//  HomeViewModel.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import Foundation

//MARK: - PROTOCOLO -
protocol HomeViewModelProtocol {
    func onItemSelected(at index: Int)
    func data(at index: Int) -> CharacterModel?
    var dataCount: Int {get} //Variable computada
    func onViewsLoaded()
}


//MARK: - CLASE -
final class HomeViewModel { // final es por que no quiero que HEREDEN de nadie.
    private weak var viewDelegate: HomeTableViewControllerProtocol? //Cuando se hace la comunicacion una de los dos debe ser wek para que no queden dependencias recursivas. Y el protocolo de la clase debe ser AnyObject
    private var viewData = CharactersModel()
    
    init(viewDelegate: HomeTableViewControllerProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = sampleCharacterData
        //TODO: Notificar a la vista que se actualice
        viewDelegate?.updateViews()
    }
}

//MARK: - EXENSION -
extension HomeViewModel: HomeViewModelProtocol {
    func onItemSelected(at index: Int) {
        guard let data = data(at: index) else {return}
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func data(at index: Int) -> CharacterModel? {
            guard index < dataCount else {return nil}
            return viewData[index]
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
       loadData()
    }
}
