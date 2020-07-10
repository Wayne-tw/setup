# Setup

<!-- markdownlint-disable MD013 -->

This folder will setup build pipeline and deployment. It is designed to be as generic as possible with a few variables set.

## What do I need to set/ create

- [Dockerfile](../../Dockerfile) to run the app in GCP app engine. </br>
- [Backend](../../infrastructure/backend.tf) state location for terraform.
- [Terraform Variables](../../infrastructure/variables.tf) updated to set app infra.
- [Code linter script](code_linter.sh) to be populated.
- [Install and test script](install_and_test.sh) to be populated.
- [Build script](build.sh) to be populated.
- Set GCP_SA_KEY secret. See 'GitHub action secret' for more info.

## GCP

Google cloud platform is our platform provider.

### Setup local authentication

Add the below exports (To `.zshrc` or similar)

```bash
export TF_VAR_org_id=YOUR_ORG_ID
export TF_VAR_billing_account=YOUR_BILLING_ACCOUNT_ID
export TF_ADMIN=${USER}-terraform-admin
export TF_CREDS=~/.config/gcloud/${USER}-terraform-admin.json
```

YOUR_ORG_ID can be found by running
`gcloud organizations list`
YOUR_BILLING_ACCOUNT_ID can be found by running
`gcloud beta billing accounts list`

The below can be run to create a new bucket for terraform state

`gsutil mb -p ${TF_ADMIN} gs://${TF_ADMIN}`

## Github actions

We use github actions as our buid server. Once the above is populated the github action should run without alteration.

The build server will run on master using ubuntu.

1. Checkout code
2. Install and test
3. Build
4. Setup GCP
5. Auth GCP
6. Setup Terraform
7. Apply Terraform changes
8. Deploy application
9. Ping test

### GitHub action secret

This is used to authenticate with GCP

Should be set to a base64 encoded google application credentials

Create secret with key GCP_SA_KEY

run the following command to copy value
`cat \$GOOGLE_APPLICATION_CREDENTIALS | base64 | pbcopy`

## Terraform

Terraform is used to provision infrastructure.

By default the state is maintained using a GCS bucket, this is set within the `bakend.tf` file.

Variables are set within the `variables.tf` file

Terraform will

- Select a random ID to ensure uniqueness of the project.
- Setup a project.
- Enable services.
  - Compute.
  - App engine.
  - Container registry.
- Create app engine application.
- Set outputs to be used when deploying and testing application

## Pre commit hooks

For more infromation see [here](https://pre-commit.com/)

- First check that pre-commit is installed `pre-commit --version`
- To install `brew install pre-commit`
- To wire up pre-commit-config run `pre-commit install`
- To test that install run `pre-commit run --all-files`
- Commit hook config can be found [here](.pre-commit-config.yaml)

Currently the commit hook will:

- Fix trailing whitespace, end of files and yaml formats
- Lint markdown
- Format terraform code
- Run code linter
- Build and test
