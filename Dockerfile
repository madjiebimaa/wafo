# Dockerfile.rails
FROM ruby:3.0.0 AS wafo-server

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler

#RUN chown -R user:user /opt/app
WORKDIR /opt/app

# Exposing port so it's accessible outside
EXPOSE 3000

# Run a shell
CMD ["/bin/sh"]