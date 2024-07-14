[private]
install-custom-flatpaks:
    #!/usr/bin/bash
    IMAGE_INFO="/usr/share/ublue-os/image-info.json"
    BASE_IMAGE_NAME=$(jq -r '."base-image-name"' < $IMAGE_INFO)
    FLATPAKS="flatpaks/include"
    FLATPAK_LIST="$(curl https://raw.githubusercontent.com/ublue-os/bluefin/main/${FLATPAKS} | tr '\n' ' ')"
    flatpak --system -y install --or-update ${FLATPAK_LIST}

[private]
remove-flatpaks:
    #!/usr/bin/bash
    IMAGE_INFO="/usr/share/ublue-os/image-info.json"
    BASE_IMAGE_NAME=$(jq -r '."base-image-name"' < $IMAGE_INFO)
    FLATPAKS="flatpaks/exclude"
    FLATPAK_LIST="$(curl https://raw.githubusercontent.com/ublue-os/bluefin/main/${FLATPAKS} | tr '\n' ' ')"
    flatpak --system -y uninstall ${FLATPAK_LIST}
