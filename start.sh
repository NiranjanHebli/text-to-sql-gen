#!/usr/bin/env bash
set -e

echo "Starting local Docker infrastructure..."

# Start the MySQL database in the background
docker-compose up -d

echo ""
echo "MySQL Database is starting up in the background!"
echo "   - It will automatically run the init.sql migrations on first boot."
echo "   - Connection String: mysql+pymysql://app_user:app_password@localhost:3306/business_db"
echo ""
echo "Helpful Commands:"
echo "   - View live logs:  docker-compose logs -f"
echo "   - Stop the DB:     docker-compose down"
echo "   - Wipe the DB:     docker-compose down -v"
