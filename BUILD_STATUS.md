# Build verification status

- Static plugin contract tests: PASS (`python3 tests/static_test.py`).
- Hetu 0.4.2 bytecode compilation: NOT RUN successfully in the authoring container. The `hetu` executable is not installed, and this container cannot resolve external hosts to install the pinned toolchain (`hetu: No such file or directory`).
- GitHub Actions workflow: added to run the pinned compiler and package the plugin on push/PR/manual dispatch. A successful CI run is still required before treating the bytecode as verified.

Do not install this source bundle as a `.smplug`; it is a source project, not a compiled plugin package.
