1. Create new folder for machine

    make NAMESPACE=<machineID>
    This creates a copy of machine-deployment and modifies the namespace.

2. Create namespace in Kubernetes

    k create namespace <machineID>

3. Deploy new chart

    cd to new folder
    run:

        helm install <release/folder name> . --namespace < machineID >



