1. Create new folder from machine

    make NAMESPACE=<machineID>

2. Create namespace in Kubernetes

    k create namespace <machineID>

3. Deploy new chart

    cd to new folder
    run:

        helm install <release/folder name> . --namespace < machineID >



