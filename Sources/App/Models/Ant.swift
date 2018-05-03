import Vapor
import FluentProvider
import HTTP

final class Ant: Model {
    let storage = Storage()
    
    var name: String
    var age: Int
    var position: String
    
    struct Keys {
        static let name = "name"
        static let age = "age"
        static let position = "position"
    }
    
    init(name: String, age: Int, position: String) {
        self.name = name
        self.age = age
        self.position = position
    }

    init(row: Row) throws {
        name = try row.get(Keys.name)
        age = try row.get(Keys.age)
        position = try row.get(Keys.position)
    }

    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Keys.name, self.name)
        try row.set(Keys.age, self.age)
        try row.set(Keys.position, self.position)
        return row
    }
}

// MARK: Fluent Preparation

extension Ant: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Posts
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(Keys.age)
            builder.string(Keys.name)
            builder.string(Keys.position)
        }
    }

    /// Undoes what was done in `prepare`
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Ant: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            name: try json.get(Keys.name),
            age: try json.get(Keys.age),
            position: try json.get(Keys.position)
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Ant.idKey, id)
        try json.set(Keys.name, name)
        try json.set(Keys.age, age)
        try json.set(Keys.position, position)
        return json
    }
}
