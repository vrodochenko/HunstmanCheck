//
// Created by Арабаджиян Артем on 2019-09-28.
// Copyright (c) 2019 DigitalCustoms. All rights reserved.
//

import Foundation
import ZBarSDK

extension ZBarSymbolSet: Sequence {
    public func makeIterator() -> NSFastEnumerationIterator {
        return NSFastEnumerationIterator(self)
    }
}


extension DateFormatter {

    func date(from dateString: String, by pattern: DatePatterns) -> Date? {
        return date(fromString: dateString, pattern: pattern.rawValue)
    }

    func date(fromString date: String, pattern: String) -> Date? {
        self.dateFormat = pattern
        return self.date(from: date)
    }
}

extension Date {

    func toString(_ pattern: DatePatterns) -> String {
        return toString(by: pattern.rawValue)
    }

    func toString(by pattern: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = pattern
        return formatter.string(from: self)
    }

    func addDays(_ count: Int) -> Date {
        var component = Calendar.current.dateComponents([.day, .year, .month, .hour, .minute, .second], from: self)
        component.day = component.day! + count
        return Calendar.current.date(from: component)!
    }

    var date: Date {
        let component = Calendar.current.dateComponents([.day, .year, .month], from: self)
        return Calendar.current.date(from: component)!
    }
}


extension UIViewController {
    func showAlert(with message: String, title: String? = nil) {
        let alert = UIAlertController(title: title ?? L10n.Alert.errorTitile, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: L10n.Alert.okButton, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showAlertDialog(with message: String, title: String? = nil, tryBody: @escaping (() -> Void)) {
        let dialogMessage = UIAlertController(title: title ?? L10n.Alert.errorTitile, message: message, preferredStyle: .alert)

        let ok = UIAlertAction(title: L10n.Alert.exitBotton, style: .destructive, handler: nil)

        let cancel = UIAlertAction(title: L10n.Errors.stayButton, style: .cancel) { (action) -> Void in
            tryBody()
        }

        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)

        self.present(dialogMessage, animated: true, completion: nil)
    }
}