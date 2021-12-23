const anagrams = (s1, s2) => {
    // todo
    let hash = {};

    for (let i = 0; i < s1.length; i++) {
        let ele = s1[i];
        if (hash[ele] === undefined) {
            hash[ele] = 1;
        } else {
            hash[ele]++;
        }
    }

    for (let i = 0; i < s2.length; i++) {
        let ele = s2[i];
        if (hash[ele] === undefined) {
            return false;
        } else {
            hash[ele]--;
        }
    }

    for (const key in hash) {
        if (hash[key] !== 0) return false;
    }

    return true;
};

//this is Time: O(n+m+n) or O(2n + m) as I use three loops in my code;
//this is Space: O(n) as I only use on place to store the values into;






