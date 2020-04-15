const db = require("../data/db-config")

module.exports = {
    find,
    findById,
    findSteps,
    addStep,
    add,
    update,
    remove
}

function find() {
    return db("schemes")
}

function findById(id) {
    return db("schemes")
        .where({ id })
        .first()
}

function findSteps(id) {
    return db("schemes")
        .join("steps", "schemes.id", "steps.scheme_id")
        .select("steps.id", "schemes.scheme_name", "steps.step_number", "steps.instructions")
        .where("schemes.id", id)
        .orderBy("steps.step_number")
}

function add(scheme) {
    return db("schemes").insert(scheme)
}

function addStep(step, scheme_id) {
    return db("steps")
        .insert(step)
        .where({ scheme_id })
}

function update(id, changes) {
    return db("schemes")
        .update(changes)
        .where({ id })
        
}

function remove(id) {
    return db("schemes")
        .where({ id })
        .del()
}