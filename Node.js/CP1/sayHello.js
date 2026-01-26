const name = process.argv[2];

if (!name) {
  console.log("Пожалуйста, передайте имя как аргумент: node greet.js Имя");
} else {
  console.log("Привет, " + name + "!");
}

