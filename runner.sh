#!/bin/bash

action=""
docker_file=""
env_file=""
build=0

function display_help() {
    echo "Docker Compose Runner Manager."
    echo "Usage : "
    echo "  ./runner -a=start"
    echo "  ./runner -a=start --build"
    echo "  ./runner --action=start"
    echo ""
    echo "Options:"
    echo "-a, --action=ACTION       specify an action to use"
    echo "                            start   : Start existing containers."
    echo "                            stop    : Stops containers and removes containers, networks, volumes, and images"
    echo "                            restart : Restart container."
    echo "--build                   build the image"
    echo "-h, --help                show brief help"
    exit 0
}

function handler() {
    docker_file=./.docker/compose/docker-compose.yml
    env_file=./.env

    if [[ $1 == "start" ]]; then
        echo "starting docker service."
        if [[ $2 == 0 ]]; then
            docker compose --env-file="${env_file}" --file="${docker_file}" up -d
        else
            docker compose --env-file="${env_file}" --file="${docker_file}" up -d --build
        fi
    elif [[ $1 == "stop" ]]; then
        echo "stopping docker service."
        docker compose --env-file="${env_file}" --file="${docker_file}" down
    elif [[ $1 == "restart" ]]; then
        echo "restarting docker service."
        docker compose restart --file="${docker_file}"
    else
        echo "unknown action name."
        exit 0
    fi

    exit 0
}

while test $# -gt 0; do
    case "$1" in
    -a* | --action*)
        action=$(echo $1 | sed -e 's/^[^=]*=//g')
        shift
        ;;
    --build)
        build=1
        shift
        ;;
    -h | --help)
        shift
        display_help
        exit 0
        ;;
    *)
        display_help
        exit 0
        ;;
    esac
done

if [[ "$action" == "" ]]; then
    display_help
    exit
fi

handler "${action}" "${build}"