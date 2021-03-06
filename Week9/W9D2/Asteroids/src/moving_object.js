class MovingObject {
    constructor(obj) {
        this.pos = obj.pos;
        this.vel = obj.vel;
        this.radius = obj.radius;
        this.color = obj.color;
        this.game = obj.game;
    }
}
MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0],this.pos[1], this.radius, 0, 2 * Math.PI, true);
    ctx.fill();

};

MovingObject.prototype.move = function () {
    let game = this.game;
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.pos = game.wrap(this.pos);
};

module.exports = MovingObject;