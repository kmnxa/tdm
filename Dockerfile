#just testing and praying...
# Obrazu Node.js z zainstalowanym Electronem
FROM node:20

# Katalog roboczy wewnątrz kontenera
WORKDIR /app

# Kopiowanie package.json i package-lock.json
COPY package*.json ./

# Instalowanie zależności
RUN npm install

# Kopiowanie pozostałych plików aplikacji
COPY . .

# Buduj aplikację
RUN npm run build

# Komenda startowa aplikacji Electron
CMD ["npm", "start"]
