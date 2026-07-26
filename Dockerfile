FROM public.ecr.aws/docker/library/eclipse-temurin:21-jdk
# Create non-root user
RUN useradd -m mshopping
# Set working directory
WORKDIR /app
# Copy jar file
COPY target/mshopping*.jar app.jar
# Change ownership to new user
RUN chown -R mshopping:mshopping /app
# Switch to non-root user
USER mshopping
# Expose port
EXPOSE 8080
# Run application
ENTRYPOINT ["java", "-jar", "app.jar"]