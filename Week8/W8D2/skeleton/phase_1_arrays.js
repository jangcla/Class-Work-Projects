
Array.prototype.uniq = function() {
    let uiniqueArray = [];

    for (let i = 0; i < this.length; i++) {
        if (!(uiniqueArray.includes(this[i]))) {
            uiniqueArray.push(this[i]);
        }
        // if (uiniqueArray.indexOf(this[i]) === -1) {
        //     uiniqueArray.push(this[i]);
        // }
    }
    return uiniqueArray;
}

// array1 = [1, 2, 3, 3, 4, 4, 4];
// console.log(
//     array1.uniq()
//     );


Array.prototype.twoSum = function() {
    let sumArray = [];

    for (let i = 0; i < this.length; i++) {
    
        for (let j = 0 ; j < this.length; j++) {
            if ((this[i] + this[j] === 0) && (i < j)) {
                sumArray.push([i, j]);
            }
        }
    }
    return sumArray;
}


// array1 = [1, -1, 2, -2];
// console.log(
//     array1.twoSum()
//     );
// [[0, 1], [2, 3]]




Array.prototype.transpose = function() {
    // var grid = (new Array(this[0].length).fill(new Array(this.length)));
    const grid = Array.from({ length: this[0].length },
        () => Array.from({length: this.length})
     );
    for(let i = 0; i < this.length; i++) {
        for( let j = 0; j < this[i].length; j++) {
            grid[j][i] = this[i][j];
        }
    }
    return grid;
};

arr1 = [[1,2,3],[4,5,6],[7,8,9]]
console.log(arr1.transpose());