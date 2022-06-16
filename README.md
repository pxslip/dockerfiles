# Dockerfiles for Devcontainers and CLIs (and other stuff)

This repository represents my work to leverage docker in as many ways as possible to reduce the install requirements for tools. 

## Contents

### AWS Amplify CLI (In Progress)

An attempt to create a docker image that simplifies installing the amplify cli.

#### To Do

- [] Switch active user from `root`
- [] Update the default working directory

#### Usage

```sh
docker run -it --mount type=bind,source="$HOME/.aws",target=/root/.aws --mount type=bind,source="$(pwd),target=/app pxslip/aws-amplify-cli your-amplify-argument
```

### AWS SAM CLI

Like above, an attempt to containerize the SAM CLI so you can avoid installing it and all of its dependencies locally

#### To Do

- [] Switch active user from `root`

#### Usage

```sh
docker run -it --mount type=bind,source="$HOME/.aws",target=/root/.aws --mount type=bind,source="$(pwd),target=/aws pxslip/aws-cli your-args
```

### Directus Extension

A quick devcontainer for developing directus extensions

### Laravel Devcontainer

2 dockerfiles, one depcrecated version for PHP 7.3 (becase adding `gd` is different on PHP 7.4+) that are intended for use with VSCode/GitHub Codespaces containers to develop Laravel based applications.

### OpenSSL

A quick one to access the low level openssl library without manually installing it

### Tauri

Devcontainer images to develop tauri based applications in, the vue variant provides a starting place to use Vue.js as a frontend framework.