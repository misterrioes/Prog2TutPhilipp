FROM jupyter/base-notebook

USER root
RUN echo "USING CUSTOM DOCKERFILE"
# Install Java (wichtig für Scala)
RUN apt-get update && apt-get install -y \
    curl \
    openjdk-11-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Install coursier (Scala installer)
RUN curl -Lo coursier https://git.io/coursier-cli && chmod +x coursier

# Install Almond (Scala kernel)
RUN ./coursier launch almond --scala 2.13 -- --install

# Clean up
RUN rm coursier