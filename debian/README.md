
# About

This repository is responsible for hosting the latest [go-c8y-cli](https://goc8ycli.netlify.app/) Debian package by hosting it via github pages.

This repository can be used to install the latest go-c8y-cli version via the APT package manager on either Debian or Ubuntu.

# Configuring the repository on Debian or Ubuntu

1. Add the repository gpg key

    ```bash
    curl https://reubenmiller.github.io/c8y-debian/debian/PUBLIC.KEY | sudo apt-key add -
    ```

2. Configure the repository

    ```bash
    sudo sh -c "echo 'deb http://reubenmiller.github.io/c8y-debian/debian stable main' >> /etc/apt/sources.list"
    ```

3. Update the repo then install/update `go-c8y-cli`

    ```bash
    sudo apt-get update
    sudo apt-get install go-c8y-cli
    ```

# Maintainers

## Publish a package to the repository

To publish the latest version of go-c8y-cli to this repository it requires the following dependencies

* gh (github cli tool)
* jq
* reprorepo
* gnupg
* GPG private key used to sign the repository

1. Make sure you have the gpg signing key (This can only be done via a maintainer)

2. Run the build script. This will commit any changes to the repository if there is a newer go-c8y-cli version

    ```bash
    ./debian/scripts/build.sh
    ```

# References

This repository was made possible by the following posts:

* https://pmateusz.github.io/linux/2017/06/30/linux-secure-apt-repository.html
