//
//  BaseUIViewController.swift
//  OpenRegistratura
//
//  Created by Арабаджиян Артем on 30.06.18.
//  Copyright © 2018 Арабаджиян Артем. All rights reserved.
//

import Foundation
import UIKit

class BaseUIViewController: UIViewController {

//
//    lazy var blurLoadingView: CUIBlurLoading = {
//        CUIBlurLoading(frame: self.view.frame)
//    }()
//
//    var eLoadingView: CUIXLoading?
//    var errorView: CUIXErrorView?

}

extension BaseUIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
//
//extension BaseUIViewController {
//
//    var isActivityViewProcessing: Bool {
//        return blurLoadingView.superview != nil
//    }
//
//    func showActivityView(with message: String) {
//        blurLoadingView.title = message
//
//        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: { [weak self] in
//            if let loadingView = self?.blurLoadingView {
//                self?.view.addSubview(loadingView)
//            }
//        }, completion: nil)
//    }
//
//    func hideActivityView() {
//        if blurLoadingView.superview != nil {
//            UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: { [weak self] in
//                self?.blurLoadingView.removeFromSuperview()
//            }, completion: nil)
//        }
//    }
//}
//
//
//extension BaseUIViewController: ViewState {
//    func switchToMain() {
//        hideLoading()
//        hideErrorView()
//    }
//
//    func switchToLoading(with message: String, timeOutSec: Int, cancelBody: retryBody?) {
//
//        hideErrorView()
//
//        if eLoadingView == nil {
//            eLoadingView = CUIXLoading(frame: self.view.frame)
//        }
//
//        eLoadingView?.setSkipButton() {
//            cancelBody?()
//        }
//
//        eLoadingView?.startLoading(with: message)
//
//        UIView.transition(
//                with: self.view,
//                duration: 0.5,
//                options: [.transitionCrossDissolve],
//                animations: { [weak self] in
//                    if let eLoadingView = self?.eLoadingView {
//                        self?.view.addSubview(eLoadingView)
//                    }
//                },
//                completion: nil
//        )
//    }
//
//    func switchToError(with message: String, retryBody: retryBody?) {
//
//        if errorView == nil {
//            errorView = CUIXErrorView(frame: self.view.frame)
//        }
//
//        errorView?.title = message
//        errorView?.didTouchNextButton = {
//            retryBody?()
//        }
//
//        UIView.transition(
//                with: self.view,
//                duration: 0.5,
//                options: [.transitionCrossDissolve],
//                animations: { [weak self] in
//                    if let errorView = self?.errorView {
//                        self?.view.addSubview(errorView)
//                    }
//                },
//                completion: nil
//        )
//    }
//
//    private func hideErrorView() {
//        if let errorView = errorView, errorView.superview != nil {
//            UIView.transition(
//                    with: self.view,
//                    duration: 0.5,
//                    options: [.transitionCrossDissolve],
//                    animations: { [weak self] in
//                        self?.errorView?.removeFromSuperview()
//                    },
//                    completion: nil)
//        }
//    }
//
//    private func hideLoading() {
//        if let eLoadingView = self.eLoadingView, eLoadingView.superview != nil {
//            eLoadingView.stopLoading()
//            UIView.transition(
//                    with: self.view,
//                    duration: 0.5,
//                    options: [.transitionCrossDissolve],
//                    animations: { [weak self] in
//                        self?.eLoadingView?.removeFromSuperview()
//                    },
//                    completion: nil)
//        }
//    }
//}