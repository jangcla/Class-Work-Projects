function sum(args) {
    let arr = Array.from(arguments);
    let sum = 0;
    arr.forEach((ele) => {
        sum += ele
    });
    return sum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

function sum2(...args) {
    let sum = 0;
    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return arguments;
}

console.log(sum2(1, 2, 3, 4) === 10);
console.log(sum2(1, 2, 3, 4, 5) === 16);

