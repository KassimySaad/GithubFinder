# Use an official Nginx runtime as a parent image
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Remove default Nginx static assets
RUN rm -rf ./*

# Copy the static assets from your project to the Nginx html directory
# Copy index.html
COPY ./index.html .
# Copy css folder (if it exists and contains bootstrap.min.css or other styles)
COPY ./css ./css
# Copy JavaScript files
COPY ./github.js .
COPY ./UI.js .
COPY ./app.js .

# Expose port 80 to the outside world
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
