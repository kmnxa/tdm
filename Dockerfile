# Obraz Node.js z zainstalowanym Electronem
FROM node:20

# Katalog roboczy wewnątrz kontenera
WORKDIR /app

# Kopiowanie plików package.json i package-lock.json
COPY package*.json ./

# Instalowanie zależności systemowych potrzebnych do działania Electron
RUN apt-get update && \
    apt-get install -y libgtk-3-0 libx11-xcb1 libnss3 libxkbfile1 \
                       libgconf-2-4 libasound2 xvfb

# Czyszczenie cache npm i instalowanie zależności z wyłączeniem opcjonalnych
RUN npm cache clean --force && npm install --no-optional

# Kopiowanie pozostałych plików aplikacji
COPY . .

# Budowanie aplikacji
RUN npm run build

# Komenda startowa aplikacji Electron
CMD ["npm", "start"]
