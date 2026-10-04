# MW IMIGRATION ASSET v1.5.1 — Railway deployment

## Deploy
1. Extract this ZIP into a folder and upload the extracted project to a GitHub repository.
2. In Railway, create a new project and deploy from that GitHub repository. Railway will build using the included Dockerfile.
3. Add environment variables in Railway > Service > Variables. Set `SETTINGS_SECRET` and `DISCORD_SESSION_SECRET` to long random secrets.
4. If using Discord login, set `DISCORD_CLIENT_ID`, `DISCORD_CLIENT_SECRET`, and `DISCORD_REDIRECT_URI` to your Railway public URL plus `/auth/discord/callback`; add the same callback URL in the Discord developer portal.
5. Generate a Railway public domain. Open it and test `/api/download/info`.

## Important
- `PORT` is supplied by Railway; the server now listens on `0.0.0.0`.
- To preserve `bridge/data/accounts.json` across deploys/restarts, add a Railway Volume mounted at `/app/bridge/data`. Without a volume, local JSON data can be lost during redeploys.
- Roblox upload actions need a valid Roblox Open Cloud API key and creator ID configured in the app. Keep API keys/secrets in Railway Variables, never in the ZIP or GitHub.
- The current quota/token store is in-memory and resets on restart; `/api/quota/grant` is an admin/testing endpoint without payment verification. Do not use it as a real paid-token system until protected and connected to a verified payment webhook.
- Features requiring external credentials/providers remain inactive until configured.
