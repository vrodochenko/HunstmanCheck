//
//  CUIXLoading.swift
//  iRegistratura2
//
//  Created by A on 26/11/2018.
//  Copyright © 2018 Electronical medicine. All rights reserved.
//


import Foundation
import UIKit.UIView

class BaseCUINib: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromNib()
    }
    
    @discardableResult
    func loadViewFromNib() -> UIView? {
        return fromNib()
    }
}

class CUIXLoading: BaseCUINib {

    static let DEF_DELAY_TIME_SEC = TimeInterval(5)

    @IBOutlet private weak var loadingActivity: UIActivityIndicatorView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var skipButton: UIButton!

    private var isHiddenSkipButton = false
    private var completion: (() -> ())?
    private var duration = DEF_DELAY_TIME_SEC

    func startLoading(with title: String?) {
        titleLabel.text = title
        loadingActivity.startAnimating()

        if isHiddenSkipButton == false {
            Timer.scheduledTimer(withTimeInterval: duration, repeats: false, block: showSkipButton)
        }
    }

    func stopLoading() {
        loadingActivity.stopAnimating()
        skipButton.isHidden = true
    }

    func setSkipButton(
            title: String? = nil,
            duration: TimeInterval = DEF_DELAY_TIME_SEC,
            completion: @escaping () -> ()) {
        self.isHiddenSkipButton = false
        self.completion = completion
        self.duration = duration
        if let title = title {
            self.skipButton.setTitle(title, for: .normal)
        }
    }

    func hideSkipButton() {
        isHiddenSkipButton = true
        skipButton.isHidden = true
    }

    @IBAction private func didTouchSkipButton(_ sender: Any) {
        self.completion?()
    }

    private func showSkipButton(on t: Timer) {
        UIView.transition(
                with: skipButton,
                duration: 0.7,
                options: .transitionCrossDissolve,
                animations: { [weak self] in
                    self?.skipButton.isHidden = false
                }
        )
    }
}
