# 创建专用目录并进入
mkdir -p ~/docker/postgres && cd $_ 

# 创建docker-compose.yml (支持PostgreSQL 15.5 AIO优化版)
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  postgres:
    image: postgres
    container_name: pg15-server
    environment:
      POSTGRES_DB: banking_core
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: Secur3P@ss2025!
    ports:
      - "5432:5432"
    volumes:
      - ~/apps/postgres:/var/lib/postgresql/data
EOF
