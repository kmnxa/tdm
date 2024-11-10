# Obraz Node.js z zainstalowanym Electronem
FROM node:18
#should be 20 I guess, but let's try

# Katalog roboczy wewnątrz kontenera
WORKDIR /app

# Instalowanie zależności systemowych potrzebnych do działania Electron
RUN apt-get update && \
    apt-get install -y \
    libgtk-3-0 libx11-xcb1 libnss3 libxkbfile1 \
    libgconf-2-4 libasound2 xvfb libgbm1 \
    libatomic1 libstdc++6

# Kopiowanie plików package.json i package-lock.json
COPY package*.json ./

# Instalowanie Electron
RUN npm install electron --save-dev --force

# Instalowanie zależności
RUN npm cache clean --force && npm install --legacy-peer-deps --verbose


# Kopiowanie wszystkich plików aplikacji
COPY . .

# Budowanie aplikacji
RUN npm run build

# Komenda startowa aplikacji Electron
CMD ["npm", "start"]
