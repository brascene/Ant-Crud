import Vapor

extension Droplet {
    func setupRoutes() throws {
        post("ants") {
            request in
            
            guard let jsonContent = request.json else { throw Abort(.badRequest, reason: "no JSON provided")}
            let ant: Ant
            do {
                ant = try Ant(json: jsonContent)
            } catch {
                throw Abort(.badRequest, reason: "incorrect json")
            }
            
            try ant.save()
            
            return try ant.makeJSON()
        }
        
        get("all_ants") {
            req in
            let ants = try Ant.all()
            var antsJson = JSON()
            try antsJson.set("ants", ants)
            return antsJson
        }
        
        get("ant", Int.parameter) {
            request in
            let antId = try request.parameters.next(Int.self)
            guard let ant = try Ant.find(antId) else {
                throw Abort(.badRequest, reason: "user with id \(antId) does not exist")
            }
            return try ant.makeJSON()
        }
        
        put("ant", Int.parameter) {
            req in
            let antId = try req.parameters.next(Int.self)
            guard let ant = try Ant.find(antId) else {
                throw Abort(.badRequest, reason: "ant with given id \(antId) could not be found")
            }
            
            guard let name = req.data["name"]?.string else {
                throw Abort(.badRequest, reason: "no name provided")
            }
            
            guard let age = req.data["age"]?.int else {
                throw Abort(.badRequest, reason: "no age provided")
            }
            
            guard let position = req.data["position"]?.string else {
                throw Abort(.badRequest, reason: "no position provided")
            }
            
            ant.name = name
            ant.age = age
            ant.position = position
            
            try ant.save()
            
            return try ant.makeJSON()
        }
        
        delete("ant", Int.parameter) {
            req in
            let antId = try req.parameters.next(Int.self)
            guard let ant = try Ant.find(antId) else {
                throw Abort(.badRequest, reason: "ant does not exist")
            }
            
            try ant.delete()
            
            return try JSON(node: ["type": "success", "message": "ant with id \(antId) is deleted"])
        }
    }
}
