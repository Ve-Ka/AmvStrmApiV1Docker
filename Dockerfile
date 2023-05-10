FROM node:alpine as BUILDER
RUN apk add --no-cache git curl
RUN curl -sf https://gobinaries.com/tj/node-prune | sh
WORKDIR /app
RUN git clone https://github.com/Ve-Ka/AmvStrmApiV1
WORKDIR /app/AmvStrmApiV1
RUN find .  -type f -exec sed -i 's/\r$//' {} +
RUN npm install --verbose
RUN rm -rf .git .github .gitignore .vscode LICENSE README.md
RUN node-prune node_modules
RUN chmod -R 777 .

FROM node:alpine
RUN mkdir /app
RUN mkdir /app/AmvStrmApiV1
WORKDIR /app/AmvStrmApiV1
COPY --from=BUILDER /app/AmvStrmApiV1 .
EXPOSE 5000
CMD npm start
