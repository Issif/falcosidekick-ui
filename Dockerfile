ARG BUILDER_IMAGE=golang:1.16.1
ARG BASE_IMAGE=alpine:3.12

FROM ${BUILDER_IMAGE} AS build-stage

ENV CGO_ENABLED=0

WORKDIR /src
COPY . .

RUN go mod download
RUN make falcosidekick-ui

# Final Docker image
FROM ${BASE_IMAGE} AS final-stage
LABEL MAINTAINER "Thomas Labarussias <issif+falcosidekick@gadz.org>"

RUN apk add --update --no-cache ca-certificates

# Create user falcosidekick
RUN addgroup -S falcosidekickui && adduser -u 1234 -S falcosidekickui -G falcosidekickui
# must be numeric to work with Pod Security Policies:
# https://kubernetes.io/docs/concepts/policy/pod-security-policy/#users-and-groups
USER 1234

WORKDIR /app
COPY --from=build-stage /src/LICENSE .
COPY --from=build-stage /src/falcosidekick-ui .
COPY static/ static

EXPOSE 2802

ENTRYPOINT ["./falcosidekick-ui"]
