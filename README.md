# Sling Cloud-Native Demo Application

This projects wraps a minimal Sling Starter application and adds:

- a Dockerfile
- a Kubernetes YAML file

It uses several unpublished/unreleased dependencies:

* from the Sling Whiteboard
    * [org.apache.sling.commons.metrics.prometheus](https://github.com/apache/sling-whiteboard/tree/master/metrics-prometheus)
    * [org.apache.sling.starter.content.system-info](https://github.com/apache/sling-whiteboard/tree/master/starter-system-info)
* [branched version of Oak](https://github.com/rombert/jackrabbit-oak/tree/sling-cloud-native-poc) 
    * patch for OAK-8529
    * patch for OAK-8530
    * patch to set `AuthenticationConfigurationImpl`, `UserConfigurationImpl` and `DefaultAuthorizableActionProvider` to use `ConfigurationPolicy.REQUIRE`

## Deployment

This repository does not contain the necessary Kubernetes plumbing to set up cluster and include all prerequisites. The cluster used to deploy this application should minimally support:

* Ingress Objects (via ingress-nginx)
* Persistent Volume Claims

and should contain a deployment of

* Prometheus
* Grafana
* A log management solution
* MongoDB in the default namespace

## Demo steps

Some useful environment variables are setup via [direnv](https://direnv.net/). It is recommended to install it and grant access to the top-level `.envrc` file using `direnv allow`.

The demo steps are recorded as git tags. `git tag` will show a list of all demo steps.

The `scripts/step.sh` file makes it easy to display changes and apply kubernetes configurations for a specific step. For example, `step.sh show 1` will show the specific changes for step 1, while `step.sh apply 1` will apply the changes to the kubernetes cluster.

Deploying the Docker images can be done using the `scripts/deploy.sh`. This scripts iterates through the demo steps, builds and deploys the images. Note that you probably need to change the repository name to something suitable for you.

## Pulling/contributing

History is changing frequently and is being rewritten in order to keep the demo steps in a logical order. This may make contributions harder, so early feedback using GitHub issues is recommended.

The following notes are useful for making changes:

- all the preparation work is done in the _preparation_ branch. For instance - adding new scripts to be used in the demo.
- the master branch contains all the demo steps on top of the preparation branch
- all changes in the preparation branch must be followed by:
    - rebasing the _master_ branch on top of the preparation branch
    - regenerating the tags using the _scripts/retag.sh_ script
