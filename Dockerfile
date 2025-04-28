# از یک ایمیج رسمی Node.js شروع می‌کنیم
FROM node:18

# یک دایرکتوری برای اپلیکیشن می‌سازیم
WORKDIR /app

# فایل‌های package.json و package-lock.json رو کپی می‌کنیم
COPY package*.json ./

# پکیج‌ها رو نصب می‌کنیم
RUN npm install

# بقیه کدها (index.js و...) رو کپی می‌کنیم
COPY . .

# پورتی که اپلیکیشن گوش میده (اختیاری، اما بهتره)
EXPOSE 3000

# دستور اجرای برنامه
CMD ["npm", "start"]
