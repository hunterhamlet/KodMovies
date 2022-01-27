//
//  ViewController.swift
//  KodMovies
//
//  Created by Hamon on 26/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var width : CGFloat = UIScreen.main.bounds.width
    lazy var height : CGFloat = UIScreen.main.bounds.height
    
    private let tlAppName = UILabel()
    private let iVLogoApp = UIImageView()
    private let bMoveTo = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        view.addSubview(iVLogoApp)
        iVLogoApp.image = UIImage(named: "ic_login")
        iVLogoApp.addAnchorsAndCenter(centerX: true, centerY: nil, width: width / 2, height: width / 2, left: nil, top: height / 4, right: nil, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        tlAppName.text = "Las mejores peliculas"
        tlAppName.textAlignment = .center
        view.addSubview(tlAppName)
        tlAppName.addAnchorsAndCenter(centerX: true, centerY: nil, width: width / 2, height: width / 2, left: nil, top: height / 4 + width / 2, right: nil, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        view.addSubview(bMoveTo)
        bMoveTo.setTitle("Acceder...", for: .normal)
        bMoveTo.setTitleColor(.white, for: .normal)
        bMoveTo.layer.cornerRadius = 5
        bMoveTo.backgroundColor = .blue
        bMoveTo.addTarget(self, action: #selector(moveToMoviesList), for: .touchUpInside)
        bMoveTo.addAnchorsAndSize(width: nil, height: 50, left: 16, top: 30, right: 16, bottom: nil, withAnchor: .top, relativeToView: tlAppName)
        
    }
    
    
    @objc func moveToMoviesList() {
        let screenList = ListViewController()
        screenList.modalPresentationStyle = .fullScreen
        present(screenList, animated: true, completion: nil)
    }

}

