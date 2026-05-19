FROM quay.io/openbao/openbao-hsm:2.5

USER root

RUN apk add --no-cache softhsm opensc

USER 100
