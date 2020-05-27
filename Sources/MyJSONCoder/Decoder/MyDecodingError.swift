//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/5/28.
//

import Foundation

public enum MyDecodingError : Error {

    /// The context in which the error occurred.
    public struct Context {

        /// The path of coding keys taken to get to the point of the failing decode
        /// call.
        public let codingPath: [CodingKey]

        /// A description of what went wrong, for debugging purposes.
        public let debugDescription: String

        /// The underlying error which caused this error, if any.
        public let underlyingError: Error?

        /// Creates a new context with the given path of coding keys and a
        /// description of what went wrong.
        ///
        /// - parameter codingPath: The path of coding keys taken to get to the
        ///   point of the failing decode call.
        /// - parameter debugDescription: A description of what went wrong, for
        ///   debugging purposes.
        /// - parameter underlyingError: The underlying error which caused this
        ///   error, if any.
        public init(codingPath: [CodingKey], debugDescription: String, underlyingError: Error? = nil) {
            self.codingPath = codingPath
            self.debugDescription = debugDescription
            self.underlyingError = underlyingError
        }
    }

    /// An indication that a value of the given type could not be decoded because
    /// it did not match the type of what was found in the encoded payload.
    ///
    /// As associated values, this case contains the attempted type and context
    /// for debugging.
    case typeMismatch(Any.Type, MyDecodingError.Context)

    /// An indication that a non-optional value of the given type was expected,
    /// but a null value was found.
    ///
    /// As associated values, this case contains the attempted type and context
    /// for debugging.
    case valueNotFound(Any.Type, MyDecodingError.Context)

    ///  An indication that a keyed decoding container was asked for an entry for
    ///  the given key, but did not contain one.
    ///
    /// As associated values, this case contains the attempted key and context
    /// for debugging.
    case keyNotFound(CodingKey, MyDecodingError.Context)

    /// An indication that the data is corrupted or otherwise invalid.
    ///
    /// As an associated value, this case contains the context for debugging.
    case dataCorrupted(MyDecodingError.Context)

    /// Returns a new `.dataCorrupted` error using a constructed coding path and
    /// the given debug description.
    ///
    /// The coding path for the returned error is constructed by appending the
    /// given key to the given container's coding path.
    ///
    /// - param key: The key which caused the failure.
    /// - param container: The container in which the corrupted data was
    ///   accessed.
    /// - param debugDescription: A description of the error to aid in debugging.
    ///
    /// - Returns: A new `.dataCorrupted` error with the given information.
    public static func dataCorruptedError<C>(forKey key: C.Key, in container: C, debugDescription: String) -> MyDecodingError where C : KeyedDecodingContainerProtocol {
        .dataCorrupted(MyDecodingError.Context(codingPath: [], debugDescription: debugDescription))
    }

    /// Returns a new `.dataCorrupted` error using a constructed coding path and
    /// the given debug description.
    ///
    /// The coding path for the returned error is constructed by appending the
    /// given container's current index to its coding path.
    ///
    /// - param container: The container in which the corrupted data was
    ///   accessed.
    /// - param debugDescription: A description of the error to aid in debugging.
    ///
    /// - Returns: A new `.dataCorrupted` error with the given information.
    public static func dataCorruptedError(in container: UnkeyedDecodingContainer, debugDescription: String) -> MyDecodingError {
        
       fatalError("todo")
    }

    /// Returns a new `.dataCorrupted` error using a constructed coding path and
    /// the given debug description.
    ///
    /// The coding path for the returned error is the given container's coding
    /// path.
    ///
    /// - param container: The container in which the corrupted data was
    ///   accessed.
    /// - param debugDescription: A description of the error to aid in debugging.
    ///
    /// - Returns: A new `.dataCorrupted` error with the given information.
    public static func dataCorruptedError(in container: SingleValueDecodingContainer, debugDescription: String) -> MyDecodingError {
        fatalError("todo")
    }
}
