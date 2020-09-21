//
//  SplashWireframe.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/17.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit

class SplashWireframe: SplashWireFrameProtocol{
    
    
    class func createSpalshModule() -> UIViewController {
        let splashViewController = SplashViewController()
        let presenter: SplashPresenterProtocol & SplashInteractorOutputProtocol = SplashPresenter()
            let interactor: SplashInteractorInputProtocol = SplashInteractor()
            let wireFrame: SplashWireFrameProtocol = SplashWireframe()

            splashViewController.presenter = presenter
            presenter.view = splashViewController
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            return splashViewController
    }
    
    func presentMainScreen(from view: SplashViewProtocol?, netflixlist: Array<NetflixData>,instaList: Array<String>,naverList: Array<String>) {
        //TODO present screen
        let tabBarController = UITabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        
        if let sourceView = view as? UIViewController{
            sourceView.present(tabBarController, animated: true, completion: nil)
        }
        
        let netFlixListView = NetflixListWireframe.createMainViewModule(netflixlist: netflixlist)
        tabBarController.addChild(netFlixListView)
        netFlixListView.tabBarItem = UITabBarItem(title: "NetFlix", image: UIImage(), tag: 0)
        
        let naverListView = NaverListWireframe.createMainViewModule(naverList: naverList)
        tabBarController.addChild(naverListView)
        naverListView.tabBarItem = UITabBarItem(title: "naver", image:  UIImage(), tag: 1)
    
        let instaListView = InstaListWireFrame.createSpalshModule(instaList: instaList)
        tabBarController.addChild(instaListView)
        instaListView.tabBarItem = UITabBarItem(title: "insta", image:  UIImage(), tag: 2)
        
        
    }
    
}
