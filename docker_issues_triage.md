Issue: https://github.com/docker/cli/issues/2249 - Permissions with v2 docker stuff

Answer: chmod the file in the .docker directory

Issue: Build context takes ages - https://stackoverflow.com/questions/26600769/build-context-for-docker-image-very-large

Answer: export DOCKER_BUILDKIT=1

Issue: openssl-dev name on non-alpine

Answer: libssl-dev or libssl1.0-dev

Issue: Cannot install any gems or build anything correctly due to DNS / connection issues

Answer: sudo service network-manager restart
