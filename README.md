# Predicted Runway In-Use Deployment

This repository contains deployment artifacts for the Predicted Runway In-Use project.

## Use

### Docker-Compose

You can deploy the docker containers with:

```
docker-compose up -d
```

The web-app service expects in `./predicted_runway/models` the trained sklearn models you wish to make available.

The nginx services expects in `./nginx/secrets` the following files:

- A file `selfsigned-cert.pem` with the public key to be used for TLS termination.
- A file `selfsigned-key.pem`with the private key to be used for TLS termination.
- A file `dhparams.pem` with the Diffie-Hellman parameters.

# Ansible

You can deploy the containers from a remote machine the Ansible playbook `deploy-playbook.yaml`. Simply do:

```
ansible-playbook ./deploy-playbook.yaml
```

The playbook will install the necessary dependencies, copy the nginx secrets and the models and launch the docker containers.

Make sure to point the `predicted_runway` hosts to the instance(s) you intend to deploy to. 