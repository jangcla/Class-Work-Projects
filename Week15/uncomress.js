const uncompress = (s) => {
    let ans = [];
    let count = '';

    for (let i = 0; i < s.length; i++) {

        if (parseInt(s[i]) >= 0) {
            count += s[i];
        } else {
            for (let j = 0; j < parseInt(count); j++) {
                ans.push(s[i]);
            }
            count = '';
        }

    }

    return ans.join("");
};



// n = number of groups
// m = max num found in any group
// Time: O(n*m) as the potential is multiplied by the max amount
// Space: O(n*m) as the potential is multiplied by the max amount

