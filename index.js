const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');
const fs = require('fs');

const SESSION_DIR = './sessions';
if (!fs.existsSync(SESSION_DIR)) fs.mkdirSync(SESSION_DIR);

const users = ['user1', 'user2']; // هر کاربر یک شماره واتساپ جدا

users.forEach((username) => {
    const client = new Client({
        authStrategy: new LocalAuth({ clientId: username }),
        puppeteer: {
            args: ['--no-sandbox', '--disable-setuid-sandbox']
        }
    });

    client.on('qr', qr => {
        console.log(`[${username}] Escanea este QR:`);
        qrcode.generate(qr, { small: true });
    });

    client.on('ready', () => {
        console.log(`[${username}] Cliente está listo!`);
    });

    client.on('message', msg => {
        console.log(`[${username}] Mensaje de ${msg.from}: ${msg.body}`);
        if (msg.body.toLowerCase() === 'hola') {
            msg.reply('Hola 👋 ¿Cómo puedo ayudarte?');
        }
    });

    client.on('disconnected', reason => {
        console.log(`[${username}] Se ha desconectado: ${reason}`);
    });

    client.initialize();
});