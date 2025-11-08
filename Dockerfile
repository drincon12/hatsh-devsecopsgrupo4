#Etapa 1 Build Segura grupo 4
FROM node:24-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .
RUN npm run build

# Etapa 2 — Runtime endurecido
FROM node:24-alpine

# Crear usuario NO ROOT
RUN addgroup -g 1001 nextjs && \
    adduser -S -u 1001 -G nextjs appuser

WORKDIR /app

# Copiar únicamente lo necesario
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

USER appuser

EXPOSE 3000

CMD ["npm", "run", "start"]
