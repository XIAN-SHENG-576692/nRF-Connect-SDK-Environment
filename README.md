# NRF Dev Container

## ✨ Features

- .devcontainer
  - The configuration files for `ms-vscode-remote.remote-containers` extension in VS Code to build the container.

- install_full_sdk.sh
  - Install the **nRF Connect SDK** in the mounted volume.  
  - ⚠️ The script **must be executed inside the container**.
  - ⚠️ The script must use `west`, please refer to [How to Access the `west` Environment in a Container](<#📄 How to Access the `west` Environment in a Container>)

- pull_nrf_image.sh
	- The script to pull the latest image.

- README.md

- run_nrf_devcontainer.sh
	- The script to pull the latest image then run the container.

- variables.sh
	- The script defines variables that are shared with other scripts for configuration. 

---

## 📖 Others

### 📄 How to manually Install J-Link

1. Download the `JLink_Linux_x86_64.deb` from [SEGGER - The Embedded Experts - Downloads - J-Link / J-Trace](https://www.segger.com/downloads/jlink/)
2. Extract the package contents:
    ```bash
    dpkg-deb -R JLink_Linux_V862_x86_64.deb ./jlink_unpack
    ```
3. Move the extracted files and create a symbolic link:
    ```bash
    mv ./jlink_unpack/opt/SEGGER /opt/SEGGER
    ln -snf /opt/SEGGER/JLink_V862 /opt/SEGGER/JLink
    ```

### 📄 How `nordic-semiconductor.nrf-connect` detects whether the SDK is installed

According to the [Welcome View](https://docs.nordicsemi.com/bundle/nrf-connect-vscode/page/reference/ui_sidebar_welcome.html) and [Workspaces — Zephyr Project Documentation](https://docs.zephyrproject.org/3.5.0/develop/west/workspaces.html#t2-star-topology-application-is-the-manifest-repository), the SDK must be installed in a directory structure that follows the T1, T2, or T3 workspace topology.

Only when the SDK is located within such a structure can the extension automatically detect and recognize it.

### 📄 How to Access the `west` Environment in a Container

When the container is **launched through VS Code**, you **must** create a terminal using `nRF Connect: Create Shell Terminal`. This terminal includes the `west` environment automatically.

> **Note:** A regular VS Code terminal **does not** have `west` available.

When the container is **started directly using** `podman run`, all terminals inside the container **already include** `west` by default.

## 📖 References

- [Package sdk-nrf-toolchain · GitHub](https://github.com/nrfconnect/sdk-nrf/pkgs/container/sdk-nrf-toolchain)
- [Building Nordic nRF-Connect SDK Projects with GitHub Actions | Interrupt](https://interrupt.memfault.com/blog/ncs-github-actions)
- [GitHub - NordicPlayground/nrf-docker: Dockerfile example for building nRF Connect SDK applications with GitHub Actions](https://github.com/NordicPlayground/nrf-docker)
- [nRF Connect SDK toolchain Docker image](https://docs.nordicsemi.com/bundle/ncs-3.0.2/page/nrf/scripts/docker/README.html)
