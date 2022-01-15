
# Using the repository

1. Add the repository gpg key

    ```sh
    curl https://reubenmiller.github.com/c8y-debian | sudo apt-key add -
    ```

2. Configure the repository

    ```sh
    sudo sh -c "echo 'deb http://reubenmiller.github.io/c8y-debian stable main' >> /etc/apt/sources.list"
    ```

3. Update the repo then install/update `go-c8y-cli`

    ```bash
    sudo apt-get update
    sudo apt-get install go-c8y-cli
    ```

# Publish a package to the repository

1. Make sure you have the gpg signing key (This can only be done via a maintainer)

2. Run the build script. This will commit any changes to the repository if there is a newer go-c8y-cli version

    ```sh
    ./scripts/build.sh
    ```

# References

This repository was made possible by the following post:
https://pmateusz.github.io/linux/2017/06/30/linux-secure-apt-repository.html
