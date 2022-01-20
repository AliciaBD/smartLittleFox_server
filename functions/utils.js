const translate = require("translate");

exports.format = (param) => {
  const str = param.replace(/-/g, " ");
  let result = str.charAt(0).toUpperCase() + str.slice(1);
  console.log(result);
  return result;
};

/* arr: array
language : string */

async function translateArray(arr, language) {
  let words;
  arr.forEach((entry) => {
    if (words == null) words = entry.word;
    else words += " " + entry.word;
  });

  let translated = await translate(words, language);
  let lang = language === "es" ? "spanish" : undefined;
  let translatedArr = translated.split(" ");
  let newJson = [];
  let i = 0;

  arr.forEach((entry) => {
    let newEntry = { ...entry, translation: translatedArr[i], language: lang };
    newJson.push(newEntry);
    i++;
  });
  return newJson;
}

exports.translateArray = translateArray;
