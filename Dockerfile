FROM nginx:alpine

# Remove default nginx content (best practice)
RUN rm -rf /usr/share/nginx/html/*

# Copy only needed files
COPY . /usr/share/nginx/html

# Permissions (optional but safer)
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
