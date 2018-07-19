function madLib(verb, adj, noun) {
  verb.toUpperCase;
  adj.toUpperCase;
  noun.toUpperCase;
  console.log(`We shall ${verb} the ${adj} ${noun}.`);
}

madLib('make', 'best', 'guac')

function.isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

function fizzBuzz(array) {
  var new_arr = [];
  array.forEach(function(el) {
    if (el % 3 === 0) ^ (el % 5 === 0) {
      new_arr.push(el);
    }
  });
  return new_arr;
}

function isPrime (n) {
  if (n<2) { return false; }
  for (let i = 2; i < n, i++) {
    if (n%1 == 0) {
      return false;
    }
  }
  return true;
}
