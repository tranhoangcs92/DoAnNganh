export const formatCurrency = (n, currency) => {
    return (
        n.toFixed(0).replace(/./g, function (c, i, a) {
            return i > 0 && c !== '.' && (a.length - i) % 3 === 0 ? ' ' + c : c;
        }) + ' ' + currency
    );
};
const string_limit = 25;
export const formatLongString = (string)=>{
  
  var dots = "...";
  if(string.length > string_limit)
  {
    console.log(string.length);
    // you can also use substr instead of substring
    string = string.substr(0,string_limit) + dots;
  }
 
    return string;
}

