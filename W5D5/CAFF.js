// function setTimeout() {
//   window.setTimeout(5000, alert('HAMMERTIME'));
// }

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  askForTea();
}

function askForTea() {
  reader.question('Would you like some tea? ', (res1) => {
    console.log(`You replied ${res1}`);
    reader.question('Would you like some biscuits? ', (res2) => {
      console.log(`you replied with ${res2}.`);
      teaAndBiscuitsResult(res1, res2);
    });
  });
}
// function askForBiscuits() {
//   reader.question('Would you like some biscuits?', (res2) => {
//     console.log(`you replied with ${res2}.`);
//     teaAndBiscuitsResult(res1, res2);
//   });
// }
function teaAndBiscuitsResult(first, second) {
  const firstRes = (first === 'yes') ? 'do' : 'don\'t';
  const secondRes = (second === 'yes') ? 'do' : 'don\'t';
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
  console.log('');

}

teaAndBiscuits();
