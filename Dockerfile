# Use a base image with Erlang and Elixir installed
FROM elixir:1.13.0-alpine AS build

# Set environment variable for Slack webhook
ENV MIX_ENV=prod \
    APP_NAME=slack_integration \
    APP_VERSION=0.1.0 \
    SLACK_WEBHOOK=${SLACK_WEBHOOK}

# Install required dependencies
RUN apk add --no-cache build-base git

# Create app directory and copy the necessary files
WORKDIR /app
COPY mix.exs mix.lock ./
COPY config config

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix deps.get --only prod && mix deps.compile

# Copy the remaining application files
COPY lib lib

# Build the application
RUN mix release

# Start a new image that only contains the release and its dependencies
FROM alpine:3.14
RUN apk add --no-cache openssl ncurses-libs libstdc++

WORKDIR /app
COPY --from=build /app/_build/prod/rel/slack_integration ./

EXPOSE 8080

# Set the default command for the container
CMD ["bin/slack_integration", "start"]
