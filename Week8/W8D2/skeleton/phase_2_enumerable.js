


Array.prototype.myEach = function(callBack) {
    for (let i = 0; i < this.length; i++) {
        callBack(this[i])         
    }
};

function prints(el) {
    console.log(el);
    return el
}

function twice(num) {
    console.log(num * 2);
    return num * 2
}

Array.prototype.myMap = function() {



}


Array.prototype.myReduce = function() {




}