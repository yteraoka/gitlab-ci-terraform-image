# gitlab-ci-terraform-image

GitLab CI で terraform を実行するための Image (Base は debian)

## インストールするもの

- [awscli v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [asdf](https://github.com/asdf-vm/asdf)
  - terraform plugin
- [tfcmt-gitlab](https://github.com/hirosassa/tfcmt-gitlab)

## Image

dockerhub

```
docker pull yteraoka/gitlab-ci-terraform-image:latest
```

GitHub Container Registry

```
docker pull ghcr.io/yteraoka/gitlab-ci-terraform-image:latest
```
