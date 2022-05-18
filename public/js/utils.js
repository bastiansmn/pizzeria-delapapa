capitalize = (str) => {
   return str[0].toUpperCase() + str.substring(1);
}

displayPrice = (price) => {
   return `${(price / 100).toFixed(2)} €`;
}