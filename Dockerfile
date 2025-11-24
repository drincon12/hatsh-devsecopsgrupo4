# Etapa 1 — Build (Grupo 4, segura)
FROM node:24-alpine AS builder

WORKDIR /app

# Solo lo mínimo para instalar
COPY package*.json ./
RUN npm install

# Copiamos el resto del código
COPY . .

# Construimos el proyecto (next build + next export + postbuild)
RUN npm run build



# Etapa 2 — Runtime endurecido
FROM node:24-alpine

# Crear usuario NO ROOT
RUN addgroup -g 1001 nextjs && \
    adduser -S -u 1001 -G nextjs appuser

WORKDIR /app

# Copiar solo lo necesario desde el builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/next.config.js ./next.config.js

# Opcional: si usas algún archivo extra en runtime (post-build.js no hace falta)
# COPY --from=builder /app/post-build.js ./post-build.js

ENV NODE_ENV=production

USER appuser

# Dentro del contenedor la app escucha en 3000 por defecto
EXPOSE 3000

CMD ["npm", "run", "start"]

