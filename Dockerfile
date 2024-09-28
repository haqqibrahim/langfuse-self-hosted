# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production
ENV DATABASE_URL=postgresql://langfuse_db_a9xf_user:ORyjjKV4RNyUCwcyOrgZftmoo2hM7PdT@dpg-crructggph6c738m2nv0-a/langfuse_db_a9xf
ENV NEXTAUTH_URL=http://localhost:3000
ENV NEXTAUTH_SECRET=secret
ENV SALT=salt

# Start the application
CMD ["npm", "start"]