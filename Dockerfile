# Use the official Langfuse image
FROM langfuse/langfuse:latest

# Set environment variables
ENV DATABASE_URL="postgresql://langfuse_db_a9xf_user:ORyjjKV4RNyUCwcyOrgZftmoo2hM7PdT@dpg-crructggph6c738m2nv0-a/langfuse_db_a9xf"
ENV NEXTAUTH_URL="http://localhost:3000"
ENV NEXTAUTH_SECRET="secret"
ENV SALT="salt"
ENV ENCRYPTION_KEY="0000000000000000000000000000000000000000000000000000000000000000"

# Additional environment variables from docker-compose.yml
ENV DATABASE_PORT=5432
ENV DATABASE_USERNAME=root
ENV DATABASE_PASSWORD=root
ENV DATABASE_NAME=langfuse
ENV DATABASE_HOST=db
ENV TELEMETRY_ENABLED=false
ENV LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES=false

# Expose port 3000
EXPOSE 3000

# Run database migrations
RUN npx prisma migrate deploy

# Start the application
CMD ["npm", "start"]