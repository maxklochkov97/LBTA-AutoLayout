//
//  SwipingControllerExtension.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 13.04.2022.
//

import UIKit

extension SwipingController {
    // для поддержки альбомной ориентации
    override func viewWillTransition(to: CGSize, with: UIViewControllerTransitionCoordinator) {
        
        with.animate { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        } completion: { (_) in
            
        }
    }
}
