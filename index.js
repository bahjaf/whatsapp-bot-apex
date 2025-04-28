const { Client } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');

const client = new Client({
    puppeteer: {
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    }
});

client.on('qr', (qr) => {
    console.log('🔵 لطفا این QR را اسکن کن:');
    qrcode.generate(qr, { small: true });
});

client.on('ready', () => {
    console.log('✅ ربات آماده است.');
});

client.initialize();
const http = require('http');
http.createServer((req, res) => {
  res.writeHead(200);
  res.end('Bot is running.');
}).listen(process.env.PORT || 3000);
