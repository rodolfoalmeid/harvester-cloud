# Terraform | DigitalOcean - Preparatory steps

In order for Terraform to run operations on your behalf, you must [install doctl utility](https://docs.digitalocean.com/reference/doctl/how-to/install/)

## Example

#### macOS installation and setup and How to generate [Personal Access Token on DigitalOcean](https://docs.digitalocean.com/reference/api/create-personal-access-token/#:~:text=Creating%20a%20Token,the%20Generate%20New%20Token%20button.)

```bash
brew update && brew install doctl
```

```bash
doctl auth init # after executing the command introduce the Personal Access Token generated
```

##### If there are other active subscriptions, run

```bash
doctl auth init --context <NAME>
```
