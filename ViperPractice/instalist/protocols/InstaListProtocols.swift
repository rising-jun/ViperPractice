//
//  InstaListProtocols.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/21.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit
protocol InstaListViewProtocol: class{
    
}

protocol InstaListWireFrameProtocol: class{
    static func createSpalshModule(instaList: Array<String>) -> UIViewController
    //presenter to wireframe
    //func presentMainScreen(from view: SplashViewProtocol?, netflixlist: Array<NetflixData>,instaList: Array<String>,naverList: Array<String>)
}

protocol InstaListPresenterProtocol: class{
    var view: InstaListViewProtocol? {get set}
    var interactor: InstaListInteractorInputProtocol? {get set}
    var wireFrame: InstaListWireFrameProtocol? {get set}
    
    func viewDidLoad()
    //func showMain()
    
}

protocol InstaListInteractorInputProtocol: class{
    //presenter to interactor
    var presenter: InstaListInteractorOutputProtocol? {get set}
    // datamanager in,output
    func requestDatas()
}

protocol InstaListInteractorOutputProtocol: class{
    func giveDatas()
}

