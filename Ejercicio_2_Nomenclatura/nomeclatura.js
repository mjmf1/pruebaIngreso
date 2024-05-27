

function calculateSinOfProductSum(addend1, addend2, multiplier) {
    let sum = addend1 + addend2;
    let product = sum * multiplier;
    let result = Math.sin(product);
    return result;
}
