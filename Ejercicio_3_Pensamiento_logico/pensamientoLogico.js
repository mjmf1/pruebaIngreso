// Función que obtiene los números impares hasta un número dado
function getOddNumbersUpTo(n) {
    let oddNumbers = [];
    for (let i = 1; i <= n; i += 2) {
        oddNumbers.push(i);
    }
    return oddNumbers;
}

// Función para mostrar los números impares en la página
function showOddNumbers() {
    const input = document.getElementById('numberInput').value;
    const number = parseInt(input, 10);

    if (isNaN(number) || number < 1) {
        document.getElementById('result').textContent = 'Please enter a valid number greater than 0.';
        return;
    }

    const oddNumbers = getOddNumbersUpTo(number);
    document.getElementById('result').textContent = `Odd numbers: ${oddNumbers.join(', ')}`;
}
