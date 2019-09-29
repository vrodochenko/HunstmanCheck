//
//  ScanScanViewController.swift
//  HuntsmanCheck
//
//  Created by dibadgo on 28/09/2019.
//  Copyright © 2019 dibado. All rights reserved.
//

import UIKit
import ZBarSDK

class ScanViewController: BaseUIViewController {

    @IBOutlet weak var scanButton: UIButton!

    var output: ScanViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareViewController()

        output.viewIsReady()
    }

    @IBAction func didSelectScanButton(_ sender: Any) {
        let reader = ZBarReaderViewController()
        reader.readerDelegate = self
        let scanner = reader.scanner
        scanner?.setSymbology(ZBAR_NONE, config: ZBAR_CFG_ENABLE, to: 0)
        scanner?.setSymbology(ZBAR_QRCODE, config: ZBAR_CFG_ENABLE, to: 1)
        reader.readerView.zoom = 1.0

        self.present(reader, animated: true)
    }
}

extension ScanViewController: ScanViewInput {

    func showError(withMessage message: String) {
        showAlert(with: message)
    }
}

extension ScanViewController: ZBarReaderDelegate {
    public func readerControllerDidFail(toRead reader: ZBarReaderController!, withRetry retry: Bool) {
        //picker.dismiss(animated: true)
    }

    public func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

        let key = UIImagePickerController.InfoKey(rawValue: ZBarReaderControllerResults)

        let results: ZBarSymbolSet = info[key] as! ZBarSymbolSet

        var symbolFound: ZBarSymbol?

        for symbol in (results) {
            symbolFound = symbol as? ZBarSymbol
            break
        }

        let resultString = symbolFound!.data

        picker.dismiss(animated: true)

        output.didScanQrCode(with: resultString)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension ScanViewController {
    private func prepareViewController() {
        UIAssistant.cornerRadius(forView: scanButton, radius: 20)
        UIAssistant.setShadow(
                forLayer: scanButton.layer,
                color: scanButton.backgroundColor!,
                radius: 0.5
        )
    }
}
