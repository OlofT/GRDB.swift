#if !os(Linux) && !os(Android)
import Foundation

/// Decimal adopts DatabaseValueConvertible
extension Decimal: DatabaseValueConvertible {
    public var databaseValue: DatabaseValue {
        NSDecimalNumber(decimal: self)
            .description(withLocale: Locale(identifier: "en_US_POSIX"))
            .databaseValue
    }
    
    public static func fromDatabaseValue(_ dbValue: DatabaseValue) -> Self? {
        switch dbValue.storage {
        case .int64(let int64):
            return self.init(int64)
        case .double(let double):
            return self.init(double)
        case let .string(string):
            // Must match NSNumber.fromDatabaseValue(_:)
            return self.init(string: string, locale: posixLocale)
        default:
            return nil
        }
    }
}

/// Decimal adopts StatementColumnConvertible
extension Decimal: StatementColumnConvertible {
    public init?(sqliteStatement: SQLiteStatement, index: Int32) {
        switch sqlite3_column_type(sqliteStatement, index) {
        case SQLITE_INTEGER:
            self.init(sqlite3_column_int64(sqliteStatement, index))
        case SQLITE_FLOAT:
            self.init(sqlite3_column_double(sqliteStatement, index))
        case SQLITE_TEXT:
            self.init(
                string: String(cString: sqlite3_column_text(sqliteStatement, index)!),
                locale: posixLocale)
        default:
            return nil
        }
    }
}

private let posixLocale = Locale(identifier: "en_US_POSIX")
#endif
