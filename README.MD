# Build
1. Build image using this command
    ```shell
    docker build -t tommyprmbd:laravel10-latest . -f ../file/php.dockerfile 
    ```
2. Copy .env.example file to .env
    ```shell
    cp -rv .env.example .env
    ```
3. Execute runner.sh using command:
    ```shell
    ./runner.sh -a=start
    ```

# Additional Info
If command to execute runner.sh failed, probably because the file is not executable file. You need to convert runner.sh file to be executable. Execute below command to convert it:
```shell
chmod +x filename.sh
```