FROM gitpod/workspace-base

RUN sudo apt-get update -qq \
  && sudo apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg \
  && curl -sL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null \
  && AZ_REPO=`lsb_release -cs` \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" \
    | sudo tee /etc/apt/sources.list.d/azure-cli.list \
  && sudo apt-get update -qq \
  && sudo apt-get install azure-cli \
  && sudo apt-get clean

