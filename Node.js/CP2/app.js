const http = require('http');
const os = require('os');


const username = os.userInfo().username;


const userName = require('./name').default || require('./name'); // Если export default или module.exports


const mods = require('./modules/main');


const math = require('./math');
console.log('Синус π/2:', math.sin(Math.PI / 2)); // ~1


const requestDate = new Date().toLocaleString('ru-RU');


const hour = new Date().getHours();
let greeting = '';
if (hour >= 6 && hour < 12) greeting = 'Доброе утро';
else if (hour >= 12 && hour < 18) greeting = 'Добрый день';
else greeting = 'Добрый вечер';

const server = http.createServer((req, res) => {

  const globalName = global.name || 'не установлено';
  
  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  
  let response = `
    <h1>Сервер Node.js запущен!</h1>
    <p>Дата и время запроса: ${requestDate}</p>
    <p>Имя пользователя ПК: ${username}</p>
    <p>${greeting}, ${username}!</p>
    <p>Привет, ${userName}!</p>
    <p>Привет1: ${mods.greeting('Пользователь1')}, Привет2: ${mods.greeting('Пользователь2')} (пункт 13, кэш модулей)</p>
    <p>Привет из кэша: ${require('./name')} </p>
    <p>Глобальное имя: ${globalName} </p>
  `;
  
  res.end(response);
});

const PORT = 3000;
server.listen(PORT, 'localhost', () => {
  console.log(`Сервер запущен: http://localhost:${PORT}`);
});
