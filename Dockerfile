FROM node:22-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
RUN corepack enable && corepack prepare pnpm@11.0.8 --activate
WORKDIR /opt
RUN git clone https://github.com/LuxAlgo/trade-journal.git app && cd app && git checkout 949bca1993ee284e1facf2e26cfd1fa820b8f5cf
WORKDIR /opt/app
COPY overrides/demo.ts apps/web/src/server/demo.ts
RUN sed -i 's/Load demo data/Load my trade tracker/g' apps/web/src/app/page.tsx || true
RUN pnpm install --frozen-lockfile
RUN pnpm build
EXPOSE 3000
VOLUME ["/opt/app/apps/web/data"]
CMD ["pnpm","start"]
