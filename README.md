# YouTube Direct Audio — cookie authentication patch

This project keeps the provided `audio_source.ht` implementation as the baseline and wires an optional YouTube session cookie into its InnerTube requests.

## Authentication

1. Build and install `build/plugin.smplug` in Spotube.
2. Use the plugin's authentication action and paste the complete `Cookie` request header from a logged-in `youtube.com` request.
3. Cookies are stored in Spotube LocalStorage under `yt_cookie_auth`; logout removes that value.
4. For requests to YouTube, the plugin sends the cookie, origin/referer, `X-Goog-AuthUser`, and a `SAPISIDHASH` authorization header when a `SAPISID`, `__Secure-3PAPISID`, or `__Secure-1PAPISID` cookie is present.

Treat the cookie as a password. Do not commit it, put it in bug reports, or send it to anyone. The cookie only grants the permissions of the signed-in YouTube session and may expire or be revoked.

## Build and test

Requires Dart and the compiler matching Spotube's Hetu 0.4.2 runtime:

```sh
dart pub global activate hetu_script_dev_tools 0.1.0+2
export PATH="$HOME/.pub-cache/bin:$PATH"
make test
make archive
```

`make test` runs static plugin-contract checks and then invokes the actual `hetu compile` command. GitHub Actions does the same and uploads `plugin.smplug` only if compilation succeeds.

## Limitations

- YouTube's InnerTube endpoints are private APIs and can change; valid cookies do not guarantee that every video can be played.
- This is session-cookie authentication, not Google OAuth. There is no password collection.
- The included build workflow has not been run from this environment; compilation must be confirmed by `make test` or the GitHub Actions run before installing the package.
