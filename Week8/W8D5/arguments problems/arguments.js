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

// console.log(sum2(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 16);

// bind-time = 1st set of parenthesis
// call-time = 2nd set of parenthesis

Function.prototype.myBind = function (context) {
    let bindargs = Array.from(arguments).slice(1); //bind time args

    return (...callargs) => this.apply(context, bindargs.concat(callargs)); //call-time args

    // return function() {  //ES5 solution
    //     let thing1 = arguments[0]
    //     let thing2 = arguments[1]
    //     that.apply(context, stuff.concat([thing1, thing2]))
    // }
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);

// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true





//curriedSum

function curriedSum(numArgs) {
    const numbers = [];

    let sum = 0;
    function _curriedSum(number) {
        if (numArgs === numbers.length + 1) {
            numbers.push(number);

            sum = numbers.reduce((acc, el) => acc + el);
            return sum;
        }else {
           numbers.push(number);
           return _curriedSum; 
        }
    }
    return _curriedSum;
}


// const total = curriedSum(4);
// console.log(
// total(5)(30)(20)(1)
// );

// function sumThree(num1, num2, num3) {
//     return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30


Function.prototype.curry = function(numArgs) {
    const args = [];
    let that = this;
    console.log(args);
    function _helperMethod(arg) {
        args.push(arg);
        if (args.length < numArgs) {
            return _helperMethod;
        } else if (args.length === numArgs) {
            return that(...args);
        }
        
    }
    return _helperMethod;
}

function fourAddition(a, b, c, d) {
    let final = a + b + c + d;
    return final;
}

let stuffs = fourAddition.curry(4)
stuffs(2)
stuffs(4)
stuffs(6)
console.log(stuffs(8))

// fourAddition.curry