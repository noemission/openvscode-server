ARG VARIANT=22
FROM node:22-alpine AS build

ARG TARGETOS
ARG TARGETARCH
ARG USERNAME=node
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
RUN echo "export PATH=${PATH}" >> /home/${USERNAME}/.bashrc

COPY --chown=${USERNAME}:${USERNAME} . /home/node/openvscode

RUN apk --no-cache add build-base libsecret-dev krb5-dev python3 wget libx11-dev libxkbfile-dev git

USER node
WORKDIR /home/node/openvscode
CMD ["sleep", "infinity"]
# RUN ./build-me.sh $TARGETOS $TARGETARCH


# FROM scratch
# COPY --from=build /home/node/output /
# ENTRYPOINT ["/"]

