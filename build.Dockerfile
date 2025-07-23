ARG VARIANT=22
FROM node:${VARIANT} AS build

ARG TARGETOS
ARG TARGETARCH
ARG USERNAME=node
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
RUN echo "export PATH=${PATH}" >> /home/${USERNAME}/.bashrc

COPY --chown=${USERNAME}:${USERNAME} . /home/node/openvscode

RUN apt-get update && apt-get install -y g++ gcc make pkg-config libx11-dev libxkbfile-dev libsecret-1-dev

USER node
WORKDIR /home/node/openvscode
RUN ./build-me.sh $TARGETOS $TARGETARCH


FROM scratch
COPY --from=build /home/node/output /
ENTRYPOINT ["/"]
