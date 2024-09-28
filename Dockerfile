# Use the official Langfuse image
FROM langfuse/langfuse:2

# Set environment variables
ENV DATABASE_URL="postgresql://langfuse_db_a9xf_user:ORyjjKV4RNyUCwcyOrgZftmoo2hM7PdT@dpg-crructggph6c738m2nv0-a/langfuse_db_a9xf"
ENV NEXTAUTH_URL="http://localhost:3000"
ENV NEXTAUTH_SECRET="mysecret"
ENV SALT="mysalt"
ENV ENCRYPTION_KEY="0000000000000000000000000000000000000000000000000000000000000000"

# Expose port 3000
EXPOSE 3000

# Set the default command to run the application
CMD ["node", "server.js"]