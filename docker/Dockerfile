FROM python:3.8.1-slim-buster

# Set working directory
WORKDIR /app

COPY run.sh /


# Install OS dependencies
RUN apt-get update && apt-get install -qq -y \
    git gcc build-essential libpq-dev --fix-missing --no-install-recommends \ 
    && apt-get clean

# Make sure we are using latest pip
RUN pip install --upgrade pip

# Create directory for dbt config
RUN mkdir -p /root/.dbt
COPY profiles.yml /root/.dbt/profiles.yml
# Copy requirements.txt

# Install dependencies
RUN pip install dbt-snowflake==1.0.0
RUN pip install dbt-redshift==1.0.0

RUN git config --global user.name "pawar-amit12"
RUN git config --global user.email "pawar.amit1@gmail.com"
ARG username "pawar-amit12"
ARG password "amit1982@G"
RUN git clone https://github.com/pawar-amit12/melio_matching.git /app/matching


# WORKDIR /app/dbt/demo_dbt
# RUN dir -s
# Copy dbt profile
# COPY /profiles.yml /root/.dbt/profiles.yml

# Copy source code
COPY . /app
ENTRYPOINT ["/bin/bash", "/run.sh"]
# CMD ["dbt","snapshot"]

