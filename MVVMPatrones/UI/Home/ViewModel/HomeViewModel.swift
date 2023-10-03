//
//  HomeViewModel.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import Foundation


protocol HomeViewModelProtocol {
    
    var dataCount: Int {get}
    func onViewsLoaded()
    func data(at indx: Int) -> CharacterModel
    func onItemSelected(at indx: Int)
}

final class HomeViewModel {
    private weak var viewDelegate: HomeTableViewControllerProtocol?
    private var viewData = CharactersModel()
    
    init(viewDelegate: HomeTableViewControllerProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
      viewData = sampleCharacterData
        viewDelegate?.updateViews()
    }
}


extension HomeViewModel: HomeViewModelProtocol {
    func onItemSelected(at indx: Int) {
        guard let data = data(at: indx: Int) else {return}
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func data(at indx: Int) -> CharacterModel {
        guard let data = data(at: indx) else {
            return
        }
        //TODO: NOTIFICAR A LA VISA QUE NAVEGUE AL DTALLE
    }
    
    
    func data(at indx: Int) -> CharacterModel? {
        guard indx < dataCount else {return nil}
        return viewData[indx]
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
       loadData()
    }
    
    
}
