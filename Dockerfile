# ============================================
#  Dockerfile – Glam Fashion Store
#  Uses PHP + Apache base image
# ============================================

FROM php:8.2-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install MySQL extension for PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy all project files into the web server root
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Apache starts automatically
CMD ["apache2-foreground"]
