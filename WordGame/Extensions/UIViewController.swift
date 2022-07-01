//
//  UIViewController.swift
//  WeatherApp
//
//  Created by Mahdi on 6/25/22.
//

import UIKit

extension UIViewController {
    
    func presentCross(_ viewControllerToPresent: UIViewController) {
            
        let view = viewControllerToPresent
        view.modalPresentationStyle = .overCurrentContext
        view.modalTransitionStyle   = .crossDissolve
        present(view, animated: true, completion: nil)
    }
}
