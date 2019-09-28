// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Alert {
    /// Ошибка
    internal static let errorTitile = L10n.tr("Localizable", "alert.errorTitile")
    /// Отмена
    internal static let exitBotton = L10n.tr("Localizable", "alert.exitBotton")
    /// Ok
    internal static let okButton = L10n.tr("Localizable", "alert.okButton")
    /// Повторить
    internal static let tryNew = L10n.tr("Localizable", "alert.tryNew")
  }

  internal enum Errors {
    /// Выход
    internal static let exitButton = L10n.tr("Localizable", "errors.exitButton")
    /// Ошибка авторизации
    internal static let grantError = L10n.tr("Localizable", "errors.grantError")
    /// Ошибка распознования ответа от сервера. Разработчики уже в курсе!
    internal static let modelMapError = L10n.tr("Localizable", "errors.modelMapError")
    /// На сервере произошла ошибка, попробуйте позже
    internal static let serverError = L10n.tr("Localizable", "errors.serverError")
    /// Продолжить
    internal static let stayButton = L10n.tr("Localizable", "errors.stayButton")
    /// Неизвестная ошибка
    internal static let undefError = L10n.tr("Localizable", "errors.undefError")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
