const MovingObject = require("./moving_object.js")
const Util = require("./util.js")

const def = {
    COLOR: "#000000",
    RADIUS: 45,
}

class Asteroid extends MovingObject {
    constructor (obj) {
        super(obj);   
        this.pos = obj.pos;
        this.color = def.COLOR;
        this.radius = def.RADIUS;
        this.vel = Util.randomVec(2)
        this.game = obj.game;
    }
}


module.exports = Asteroid;