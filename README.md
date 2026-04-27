# NRF Dev Container

## File Structure

- `.devcontainer/`: The configuration files for `ms-vscode-remote.remote-containers` extension in VS Code to build the container.
- `dev_setup_scripts/`: Some scripts for developer.

## Scripts in `dev_setup_scripts/`

### `create_config_env.sh`

Create the `.devcontainer/.env` file so that it can be used in other applications.

### `fix_jlink_error.sh`

Fix the `Failed to send reload request: Permission denied` error.

### `install_ncs_in_volume.sh`

Install the **nRF Connect SDK** in the mounted volume.

> [!CAUTION]  
> The script **must be executed inside the container**.
> 
> The script must use `west`, please refer to [How to Access the `west` Environment in a Container](<#how-to-access-the-west-environment-in-a-container>)

### `install_tools_for_native_building.sh`

Installs the necessary tools to build the cmake target.

### `install_tools_for_native_sim_building.sh`

Install nRF Connect SDK dependencies for `native_sim` builds.

### `pull_nrf_image.sh`

The script to pull the latest image.

---

## How `nordic-semiconductor.nrf-connect` detects whether the SDK is installed

> [!TIP]  
> According to the [Welcome View](https://docs.nordicsemi.com/bundle/nrf-connect-vscode/page/reference/ui_sidebar_welcome.html) and [Workspaces — Zephyr Project Documentation](https://docs.zephyrproject.org/3.5.0/develop/west/workspaces.html#t2-star-topology-application-is-the-manifest-repository), the SDK must be installed in a directory structure that follows the T1, T2, or T3 workspace topology.
> 
> Only when the SDK is located within such a structure can the extension automatically detect and recognize it.

## How to Access the `west` Environment in a Container

> [!IMPORTANT]  
> When the container is **launched through VS Code**, you **must** create a terminal using `nRF Connect: Create Shell Terminal`. This terminal includes the `west` environment automatically.
> 
> A regular VS Code terminal **does not** have `west` available.

> [!NOTE]  
> When the container is **started directly using** `podman run`, all terminals inside the container **already include** `west` by default.

## References

- [Building Nordic nRF-Connect SDK Projects with GitHub Actions | Interrupt](https://interrupt.memfault.com/blog/ncs-github-actions)
- [GitHub - nrfconnect/sdk-nrf: nRF Connect SDK main repository · GitHub](https://github.com/nrfconnect/sdk-nrf)
- [GitHub - NordicPlayground/nrf-docker: Dockerfile example for building nRF Connect SDK applications with GitHub Actions](https://github.com/NordicPlayground/nrf-docker)
- [nRF Connect SDK toolchain Docker image](https://docs.nordicsemi.com/bundle/ncs-3.0.2/page/nrf/scripts/docker/README.html)
- [Package sdk-nrf-toolchain · GitHub](https://github.com/nrfconnect/sdk-nrf/pkgs/container/sdk-nrf-toolchain)
