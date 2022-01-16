
# Setup repository

1. Add the repository

    ```sh
    wget -O /etc/apk/keys/reuben.d.miller\@gmail.com-61e3680b.rsa.pub https://reubenmiller.github.io/c8y-debian/alpine/PUBLIC.KEY

    # Add the repo
    sh -c "echo 'https://reubenmiller.github.io/c8y-debian/alpine/stable/main'" >> /etc/apk/repositories
    ```

2. Update the repo and install go-c8y-cli

    ```sh
    apk update
    apk add go-c8y-cli
    ```

# Update repository with latest version

```sh
./alpine/scripts/build.sh /home/reubenmiller/reuben.d.miller\@gmail.com-61e3680b.rsa
```
