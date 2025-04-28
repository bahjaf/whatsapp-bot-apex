# 1. انتخاب نسخه رسمی Node.js
FROM node:18-slim

# 2. تنظیم متغیر محیطی برای Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# 3. نصب Chromium و کتابخانه‌های لازم
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# 4. نصب Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

# 5. کپی کردن پروژه
WORKDIR /app
COPY . .

# 6. نصب پکیج‌های npm
RUN npm install

# 7. اجازه اجرای فایل start.sh
RUN chmod +x start.sh

# 8. اجرای پروژه
CMD ["./start.sh"]
